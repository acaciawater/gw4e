from django.db import models
from django.utils.translation import gettext_lazy as _
from ogc.models.server import Server
import os
from tempfile import TemporaryDirectory
import zipfile

import fiona
from fiona.collection import BytesCollection
import rasterio as rio
from rasterio.io import MemoryFile
from io import BytesIO
        
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

            
    class Meta:
        verbose_name = _('Layer')


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
    
    def __str__(self):
        return '{}:{}'.format(self.server, self.layername)

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

    def download(self, **options):
        '''
        download layer from server
        options:
        - srs: srs of output. default=32737 (WGS84/UTM 37N)
        - bbox: bounding box in srs units
        - width: output width in pixels
        - height: output width in pixels
        - scale desired output scale in srs units. Note that scale overrides width/height parameters 
        '''
        service = self.server.service
    
        # TODO: implement bbox and custom srs (defaults to WGS84/UTM 37N)
        if self.server.service_type == 'WMS':
            # TODO: implement custom scale
            
            details = self.details()
    #         scale = int(options.get('scale',0)) 
    #         srs = options.get('srs','32737')
    #         if srs:
    #             try:
    #                 bbox = next(filter(lambda b: b[-1] == srs, details.crs_list))
    #             except StopIteration:
    #                 return HttpResponseBadRequest(f'SRS not supported: {srs}') 
    #         else:
            # default SRS
            bbox = details.boundingBox
            srs = bbox[-1]
            
            size = (bbox[2]-bbox[0], abs(bbox[3]-bbox[1]))
            height = int(options.get('height',0))
            width = int(options.get('width',0))
            if height == 0 and width == 0:
                # default size is 400 pix high and auto width
                height = 400
            if width == 0:
                width = int((height * size[0]) / size[1])
            elif height == 0:
                height = int((width * size[1]) / size[0])
                
            image = service.getmap(layers = [self.layername], 
                                bbox = bbox[:-1],
                                format = 'image/png',
                                srs = srs,
                                size = (width, height),
                                transparent = True
                                )
            # QGIS server does not support geoTIFF output
            # user rasterio to convert PNG output to geoTIFF
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
                    return (f'{self.layername}.tif', tif.read(), 'image/tiff')
        
        elif self.server.service_type == 'WFS':
            
            def zipdir(folder):
                io = BytesIO()
                with zipfile.ZipFile(io, mode="w",compression=zipfile.ZIP_DEFLATED) as zf:
                    for root, _dirs, files in os.walk(folder):
                        for fname in files:
                            zf.write(os.path.join(root, fname), fname)
                return io.getvalue()
            
    
            features = service.getfeature(typename=self.layername, outputFormat='GeoJSON')
            # QGIS server does not support ESRI shapefile output
            # Use fiona to convert geojson to shp
            with BytesCollection(features.read()) as source:
                # save features as shapefile in temp dir, return zipped dir as attachment in response
                with TemporaryDirectory() as tempdir:
                    with fiona.open(os.path.join(tempdir,f'{self.layername}.shp'), 
                                    mode = 'w', 
                                    driver='ESRI Shapefile',
                                    crs=source.crs,
                                    schema=source.schema) as sink:
                        for feature in source:
                            sink.write(feature)
                            
                    return (f'{self.layername}.zip', zipdir(tempdir), 'application/zip')
        
