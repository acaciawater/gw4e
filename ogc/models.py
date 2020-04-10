from django.db import models
from django.utils.translation import gettext_lazy as _
from owslib.wms import WebMapService
from owslib.wfs import WebFeatureService

SERVICES = (
    ('WMS','WMS'),
    ('WFS','WFS')
)

VERSIONS = (
    ('WMS', (
        ('1.1.1','1.1.1'),
        ('1.3.0','1.3.0'),
        )
    ),
    ('WFS', (
        ('1.0.0','1.0.0'),
        ('1.1.0','1.1.0'),
        ('2.0.0','2.0.0'),
        ('3.0.0','3.0.0'),
        )
    )
)

class Server(models.Model):
    ''' OWS server '''
    name = models.CharField(_('name'), max_length=100, unique=True)
    url = models.URLField(_('url'), max_length=255)
    service_type = models.CharField(_('type'), max_length=4, choices=SERVICES, default='WMS')
    version = models.CharField(_('version'), max_length=10, choices=VERSIONS, default='1.3.0')

    def __str__(self):
        return self.name

    @property
    def service(self):
        if self.service_type == 'WMS':
            return WebMapService(self.url, self.version)
        elif self.service_type == 'WFS':
            return WebFeatureService(self.url, self.version)
        else:
            raise ValueError('Service not supported')

    def layer_details(self, layername = None):
        if layername is None:
            # return details of all layers
            service = self.service
            return {layer: service[layer] for layer in service.contents}
        else:
            # single layer
            return {layername: self.service[layername]}
    
    def enum_layers(self):
        for layer in self.service.contents:
            yield layer

    def update_layers(self, delete_nonexisting=True):

        if delete_nonexisting:
            # delete layers that are not reported in service contents
            newLayers = set(self.enumLayers())
            self.layer_set.exclude(layername__in=newLayers).delete()

        # create new layers
        numCreated = 0
        for layername, details in self.layer_details().items():
            _layer, created = self.layer_set.get_or_create(layername=layername,defaults = {
                'title': details.title or layername,
                'attribution': details.attribution.get('title','') if hasattr(details,'attribution') else ''
            })
            if created:
                numCreated += 1
        return numCreated
                
    class Meta:
        verbose_name = _('Server')
        
class Layer(models.Model):
    ''' Layer in an OWS server '''
    layername = models.CharField(_('layername'), max_length=100)
    title = models.CharField(_('title'), max_length=100)
    server = models.ForeignKey(Server,models.CASCADE,verbose_name=_('WMS Server'))
    bbox = models.CharField(_('extent'),max_length=100,null=True,blank=True)
    attribution = models.CharField(_('attribution'),max_length=200,blank=True,null=True)

    def __str__(self):
        return '{}:{}'.format(self.server, self.title or self.layername)

    def details(self):
        for _key, value in self.server.layer_details(self.layername).items():
            return value
    
    def get_extent(self):
        details = self.details()
        return details.boundingBoxWGS84 if details else []
    
    def set_extent(self):
        ext = self.get_extent()
        self.bbox = ','.join(map(str,ext))
        self.save(update_fields=('bbox',))
        return ext
    
    def extent(self):
        if not self.bbox:
            return self.set_extent()
        else:
            return list(map(float,self.bbox.split(',')))
            
    class Meta:
        verbose_name = _('Layer')
    