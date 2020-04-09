from django.db import models
from django.utils.translation import gettext_lazy as _

class Server(models.Model):
    ''' OGC server '''
    name = models.CharField(_('name'), max_length=100, unique=True)
    url = models.URLField(_('url'), max_length=255)
    service_type = models.CharField(_('type'), max_length=4)
    version = models.CharField(_('version'), max_length=10)
    
    def __str__(self):
        return self.name

    def service(self):
        raise NotImplementedError

    def layerDetails(self, layername = None):
        service = self.service
        if layername is None:
            # return details of all layers
            return {layer: service[layer] for layer in service.contents}
        else:
            # single layer
            return {layername: service[layername]}
    
    def enumLayers(self):
        for layer in self.service.contents:
            yield layer

    def updateLayers(self):

        # delete layers that are not reported in service contents
        newLayers = set(self.enumLayers())
        self.layer_set.exclude(layername__in=newLayers).delete()

        # create new layers if necessary
        numCreated = 0
        for layername, details in self.layerDetails().items():
            _layer, created = self.layer_set.get_or_create(layername=layername,defaults = {
                'title': details.title or layername
            })
            if created:
                numCreated += 1
        return numCreated
                
    class Meta:
        abstract = True
        verbose_name = _('OGC-Server')
        
class Layer(models.Model):
    ''' Layer in an OCG server '''
    layername = models.CharField(_('layername'), max_length=100)
    title = models.CharField(_('title'), max_length=100)
    server = models.ForeignKey(Server,models.CASCADE,verbose_name=_('WMS Server'))
    bbox = models.CharField(_('extent'),max_length=100,null=True,blank=True)

    def __str__(self):
        return '{}:{}'.format(self.server, self.title or self.layername)

    def details(self):
        for _key, value in self.server.layerDetails(self.layername).items():
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
        abstract = True
        verbose_name = _('WFS-Layer')
    