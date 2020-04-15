from django.shortcuts import get_object_or_404
from ogc.models.layer import Layer
from django.http.response import JsonResponse, HttpResponse
from ogc.models.server import Server
from owslib.feature.schema import get_schema
import json
import geopandas as gpd

def properties(request, pk):
    ''' return property list of a wfs layer '''
    layer = get_object_or_404(Layer, pk=pk)
    schema = get_schema(layer.server.url, layer.layername, version=layer.server.version)
    return JsonResponse({
        'layer': {
            'id': layer.pk, 
            'name': layer.layername,
            'geometry': schema.get('geometry'),
            'properties': schema.get('properties')
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
