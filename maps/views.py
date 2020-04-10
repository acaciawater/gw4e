'''
Created on May 15, 2019

@author: theo
'''
import json

from django.conf import settings
from django.db.models import Q
from django.http.response import HttpResponse, HttpResponseNotFound,\
    JsonResponse
from django.shortcuts import get_object_or_404, redirect
from django.views.decorators.csrf import csrf_exempt
from django.views.generic.base import TemplateView
from django.views.generic.detail import DetailView

from .models import Map, UserConfig
from maps.models import DocumentGroup
from sorl.thumbnail.shortcuts import get_thumbnail


#class MapDetailView(LoginRequiredMixin, DetailView):
class MapDetailView(DetailView):
    ''' View with leaflet map, legend and layer list '''
    model = Map

    def get_map(self):
        return self.get_object()

    def get_context_data(self, **kwargs):
        context = TemplateView.get_context_data(self, **kwargs)
        context['api_key'] = settings.GOOGLE_MAPS_API_KEY
        context['options'] = {'zoom': 12, 'center': [52, 5]}
        map_object = self.get_map()
        context['map'] = map_object
        context['extent'] = map_object.extent()
        return context


@csrf_exempt
#@login_required
def reorder(request, pk):
    ''' reorder layers in map and save to user config
        request.body contains names of layers as json array in proper order
        is something like ["suitability","ndvi",,...]
    '''
    if not request.user.is_authenticated:
        return HttpResponse('Authentication required to reorder layers.', status=401)

    user = request.user
    target = get_object_or_404(Map, pk=pk)
    items = json.loads(request.body.decode('utf-8'))

    # make sure user config is in sync with map
    UserConfig.sync(user, target)

    for index, item in enumerate(items):
        config = user.userconfig_set.get(
            layer__map=target, layer__layer__title=item)
        if config.order != index:
            config.order = index
            config.save(update_fields=('order',))

    return HttpResponse(status=200)


@csrf_exempt
#@login_required
def toggle(request, pk):
    ''' toggle visibility of layers in map and save to user config
        request.body contains names of layers as json array in proper order
        is something like ["suitability","ndvi",,...]
    '''
    if not request.user.is_authenticated:
        return HttpResponse('Authentication required to toggle visibility of layers.', status=401)

    user = request.user
    target = get_object_or_404(Map, pk=pk)
    items = json.loads(request.body.decode('utf-8'))

    # make sure user config is in sync with map
    UserConfig.sync(user, target)

    for item in items:
        config = user.userconfig_set.get(
            layer__map=target, layer__layer__title=item)
        config.visible = not config.visible
        config.save(update_fields=('visible',))

    return HttpResponse(status=200)


class HomeView(TemplateView):
    template_name = 'home.html'

class BrowseView(TemplateView):
    template_name = 'browse.html'
    
class OverlayView(TemplateView):
    template_name = 'overlay.html'


CLUSTERS = {
    '0': 'Ethiopia', # only for admins
    '1': 'Wag Himra',
    '2': 'Afar',
    '3': 'Siti',
    '4': 'Liben',
    '5': 'Bale',
    '6': 'Borena',
    '7': 'Wolayta',
    '8': 'South Omo'
}


def map_proxy(request):
    ''' resolve map id from cluster name or number '''
    cluster = request.GET.get('cluster')
    if not cluster:
        return HttpResponseNotFound('Cluster name or number is missing.')
    clustername = CLUSTERS[cluster] if cluster in '012345678' else cluster
    map_object = get_object_or_404(Map, name__icontains=clustername)
    return redirect('map-detail', pk=map_object.pk)


#@login_required
def get_map_config(request, pk):
    ''' return user's layer configuration for all groups in the map '''
    map_object = get_object_or_404(Map, pk=pk)
    user = request.user
    UserConfig.sync(user, map_object)
    return HttpResponse(UserConfig.groups(user, map_object), content_type='application/json')

#@login_required
def docs2json(request):
    ''' return json response with all documents grouped by theme '''
    
    from maps.engine import engine
    
    def process_group(cluster, group, result):
        data = {
            'id': group.id,
            'name': group.name,
            'documents': process_docs(cluster, group),
            'folders': []
        }
        result.append(data)
        for child in group.children.all():
            if not child.empty(cluster):
                process_group(cluster, child, data['folders'])

    def process_docs(cluster, group):
        result = []
        queryset = group.document_set.order_by('cluster','name')
        if cluster:
            queryset = queryset.filter(Q(cluster=cluster)|Q(cluster=0))
        for doc in queryset:
            item = {
                'id': doc.id,
                'name': doc.name,
                'description': doc.description,
                }
            if doc.doc:
                item['url'] = doc.doc.url
                try:
                    with engine(doc.doc.name):
                        img = get_thumbnail(doc.doc, 'x600')
                        if img:
                            item['img'] = img.url
                except ValueError:
                    pass
            result.append(item)
        return result
    
    root = DocumentGroup.objects.get(parent__isnull=True)
    cluster = request.GET.get('cluster')
    try:
        cluster = int(cluster)
    except ValueError:
        cluster = 0
    result = []
    process_group(cluster, root, result)
    return JsonResponse({'results': result})

