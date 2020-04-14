from django.db import models
from django.utils.translation import gettext_lazy as _
from ogc.models.server import Server
        
class Layer(models.Model):
    ''' Layer in an OWS server '''
    layername = models.CharField(_('layername'), max_length=100)
    title = models.CharField(_('title'), max_length=100)
    server = models.ForeignKey(Server,models.CASCADE,verbose_name=_('server'))
    bbox = models.CharField(_('extent'),max_length=100,null=True,blank=True)
    attribution = models.CharField(_('attribution'),max_length=200,blank=True,null=True)

    # WMS options
    tiled = models.BooleanField(_('tiled'), default=True)
    tiled.Boolean=True
    legend = models.URLField(_('legend_url'), null=True, blank=True)

    def _update_legend(self, style='default'):
        url = self.details().styles[style]['legend']
        if url:
            url += '&LAYERTITLE=FALSE' 
        self.legend = url
        self.save(update_fields=('legend',))
        return url
    
    def _try_update_legend(self, style='default'):
        try:
            return self._update_legend(style)
        except:
            return self.legend
        
    def legend_url(self, style='default'):
        return self._try_update_legend(style) if self.legend is None else self.legend
    # ---------------------------------------------------------------------------
    
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
