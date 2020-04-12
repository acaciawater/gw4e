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
#     schema = get_schema(layer.server.url, layer.layername, version=layer.server.version)
    response = service.getfeature(typename=layer.layername,propertyname=propertyname,outputFormat='GeoJSON')
    data = json.loads(response.read())
    table = gpd.GeoDataFrame.from_features(data)
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
