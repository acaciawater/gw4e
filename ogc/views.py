import json
import os

from django.http.response import JsonResponse, HttpResponse, \
    HttpResponseBadRequest
from django.shortcuts import get_object_or_404
from owslib.feature.schema import get_schema

import geopandas as gpd
from ogc.models.layer import Layer
from ogc.models.server import Server


def zipdir(folder):            
    from io import BytesIO
    import zipfile
    io = BytesIO()

    with zipfile.ZipFile(io, mode="w",compression=zipfile.ZIP_DEFLATED) as zf:
        for root, _dirs, files in os.walk(folder):
            for fname in files:
                zf.write(os.path.join(root, fname), fname)
    return io.getvalue()


def properties1(request, pk):
    ''' return property list of a wfs layer using DescribeFeature '''
    layer = get_object_or_404(Layer, pk=pk)
    schema = get_schema(layer.server.url, layer.layername, version=layer.server.version)
    return JsonResponse({
        'layer': {
            'id': layer.pk, 
            'name': layer.layername,
            'geometry': schema.get('geometry'),
            'properties': schema.get('properties')
        }})
    
    
def properties(request, pk):
    ''' return property list of a wfs layer using GetFeature '''
    layer = get_object_or_404(Layer, pk=pk)
    response = layer.server.service.getfeature(typename=layer.layername,maxfeatures=1,outputFormat='GeoJSON')
    data = json.loads(response.read())
    features = gpd.GeoDataFrame.from_features(data)
    return JsonResponse({
        'layer': {
            'id': layer.pk, 
            'name': layer.layername,
            'geometry': features.geometry.name,
            'properties': {key:str(val) for key, val in features.dtypes.items()}
        }})

def statistics(request, pk):
    ''' return statistics of layer's properties '''
    layer = get_object_or_404(Layer, pk=pk)
    service = layer.server.service
    propertyname = request.GET.get('property','*')
    response = service.getfeature(typename=layer.layername,propertyname=propertyname,outputFormat='GeoJSON')
    data = json.loads(response.read())
    table = gpd.GeoDataFrame.from_features(data)
    # pandas cannot describe geometries
    result = table.drop('geometry',axis=1).describe(include='all').to_json()
    return HttpResponse(result,content_type='application/json')

def layers(request, pk):
    ''' return server's layer list with properties '''
    server = get_object_or_404(Server, pk=pk)
    layers = {}
    for layer in server.layer_set.all():
        schema = get_schema(layer.server.url, layer.layername, version=layer.server.version)
        layers[layer.layername] = {
            'id': layer.pk,
            'geometry': schema.get('geometry'),
            'properties': schema.get('properties')
            }
    return JsonResponse({
        'server': {
            'name': server.name,
            'url': server.url,
            'type': server.service_type,
            'version': server.version,
            'layers': layers
        }})

def legends(request, pk):
    ''' return layer's legends '''
    def to_json(legend):
        data = {
            'id': legend.id,
            'title': legend.title,
            'property': legend.property,
            'type': 'range' if legend.range_set.exists() else 'category'
        }
        if data['type'] == 'range':
            data['entries'] = [{'label': r.label, 'color': r.color, 'lo': r.lo, 'hi': r.hi} 
                       for r in legend.range_set.order_by('lo')]
        else:
            data['entries'] = [{'label': v.label, 'color': v.color, 'value': v.value} 
                       for v in legend.value_set.order_by('value')]
        return data
    
    layer = get_object_or_404(Layer, pk=pk)
    legends = [to_json(legend) for legend in layer.legends.all()]
    return JsonResponse({'layer': {'id': layer.id, 'name': layer.layername}, 'legends': legends})

def download(request, pk):
    '''
    download layer from server
    '''
    layer = get_object_or_404(Layer, pk=pk)
    service = layer.server.service

    if layer.server.service_type == 'WMS':
        import rasterio as rio
        from rasterio.io import MemoryFile
        
        details = layer.details()
        srs = request.GET.get('srs')
        if srs:
            try:
                bbox = next(filter(lambda b: b[-1] == srs, details.crs_list))
            except StopIteration:
                return HttpResponseBadRequest(f'SRS not supported: {srs}') 
        else:
            # default SRS
            bbox = details.boundingBox
            srs = bbox[-1]
        size = (bbox[2]-bbox[0], abs(bbox[3]-bbox[1]))
        height = int(request.GET.get('height',0))
        width = int(request.GET.get('width',0))
        scale = int(request.GET.get('scale',0)) #TODO: implement scale parameter
        if height == 0 and width == 0:
            height = 400
        if width == 0:
            width = int((height * size[0]) / size[1])
        elif height == 0:
            height = int((width * size[1]) / size[0])
            
        # QGIS server does not support geoTIFF output
        # user rasterio to convert PNG output to geoTIFF
        image = service.getmap(layers = [layer.layername], 
                            bbox = bbox[:-1],
                            format = 'image/png',
                            srs = srs,
                            size = (width, height),
                            transparent = True
                            )
        with rio.open(image) as src:
            with MemoryFile() as tif:
                with tif.open(driver='GTiff', 
                              dtype='uint8', 
                              width=width, 
                              height=height, 
                              count=4, 
                              crs=srs,
#                               compress='JPEG',
#                               photometric='YCBCR',
                              transform=rio.Affine(size[0]/width, 0, bbox[0], 0, -size[1]/height, bbox[3])
                              ) as dest:
                    dest.write(src.read())
                response = HttpResponse(tif.read(), content_type='image/tif')
                response['Content-Disposition'] = f'attachment; filename={layer.layername}.tif'
                return response
    
    elif layer.server.service_type == 'WFS':
        import fiona
        from fiona.collection import BytesCollection
        from tempfile import TemporaryDirectory

        # QGIS server does not support ESRI shapefile output
        # Use fiona to convert geojson to shp
        features = service.getfeature(typename=layer.layername, outputFormat='geoJSON')
        with BytesCollection(features.read()) as source:
            # save features as shapefile in temp dir, return zipped dir as attachment
            with TemporaryDirectory() as tempdir:
                with fiona.open(os.path.join(tempdir,f'{layer.layername}.shp'), 
                                mode = 'w', 
                                driver='ESRI Shapefile',
                                crs=source.crs,
                                schema=source.schema) as sink:
                    for feature in source:
                        sink.write(feature)
                        
                response = HttpResponse(zipdir(tempdir), content_type='application/zip')
                response['Content-Disposition'] = f'attachment; filename={layer.layername}.zip'
                return response
                