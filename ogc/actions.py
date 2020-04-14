import json

from django.contrib import messages
from owslib.feature.schema import get_schema

import geopandas as gpd
import re


def classify(modeladmin, request, queryset):
    ''' create default legend classification '''
    num_created = 0
    for legend in queryset:
        try:
            legend.create_default()
            num_created += 1
        except Exception as e:
            messages.error(request,e)
    messages.success(request, f'{num_created} legends created')
classify.short_description = 'Create default classifcation for selected legends'

def create_legends(modeladmin, request, queryset):
    ''' create default WFS legends for all properties in a layer'''
    num_created = 0
    wfs_layers = queryset.filter(server__service_type='WFS')
    for layer in wfs_layers:
        try:
            service = layer.server.service
            response = service.getfeature(typename=layer.layername,outputFormat='GeoJSON')
            data = json.loads(response.read())
            features = gpd.GeoDataFrame.from_features(data)
            
            def property_name(name):
                ''' return sanitized wfs property name ''' 
                name = re.sub(r'\s', '_', name)
                name = re.sub(r'[^A-Za-z0-9_\-]','',name)
                return name

            properties = get_schema(layer.server.url, layer.layername, version=layer.server.version).get('properties',{})
            exclude = ['geometry','fid','ogc_fid','no','nr','id','sn', 'x','y','adindanx','adindany','remarks','remark','lon','lat','longitude','latitude','easting','northing']
            for name, series in features.iteritems():
                if name.lower() not in exclude:
                    prop = property_name(name)
                    if prop not in properties:
                        messages.error(request, f'cannot find property {layer}:{prop}')
                    else:
                        legend, _created = layer.legends.get_or_create(title=name, property=prop)
                        try:
                            legend.create_default(series)
                        except Exception as e:
                            messages.error(request, e)
                        num_created += 1
        except Exception as e:
            messages.error(request, e)
    messages.success(request, f'{num_created} legends created')
    
create_legends.short_description = 'Create default legends'
    