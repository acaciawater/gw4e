from django.db import models
from django.utils.translation import gettext_lazy as _
from colorsys import hsv_to_rgb
from ogc.models.layer import Layer

def hsv2hex(h,s=1,v=1):
    h = 0.6667 * (1.0 - h) # reverse colors and clip at 245 degrees (blue)
    r,g,b = map(lambda c: int(c*255), hsv_to_rgb(h,s,v))
    return '#%02x%02x%02x' % (r,g,b)
    

class Legend(models.Model):
    ''' provide a legend for a property on a WFS layer '''
    layer = models.ForeignKey(Layer, on_delete=models.CASCADE, related_name='legends', limit_choices_to={'server__service_type': 'WFS'})
    property = models.CharField(_('property'), max_length=30)
    title = models.CharField(_('title'),max_length=40,default=_('legend'))

    def __str__(self):
        return '%s.%s.%s' % (self.title, self.layer.layername, self.property)

    def lookup(self, value):
        if hasattr(self, 'range_set'):
            for entry in self.range_set.all():
                if entry.hi > value:
                    return {self.property: {'low': entry.lo, 'high': entry.hi, 'color': entry.color, 'label': entry.label}}
        elif hasattr(self, 'value_set'):
            for entry in self.value_set.all():
                if entry.value == value:
                    return {self.property: {'value': value, 'color': entry.color, 'label': entry.label}}
        raise ValueError(f'No legend entry found for {self.property}={value}')

#     @classmethod
#     def classify(cls, app_label, model_name, property_name):
#         ''' create default legend for app.model.property '''
#         title = ' '.join(re.split(r'\.|_{2}',property_name)).title()
#         legend, _created = cls.objects.get_or_create(app=app_label, model=model_name, prop=property_name, defaults = {'title':title})
#         values = get_model_property_values(app_label, model_name, property_name)
#         index, data = zip(*values)
#         series = pd.Series(index=index, data=data).dropna()
# 
#         if series.size > 1:
#             try:
#                 # try to classify numeric values (or dates) first
#                 q = series.quantile([0,0.2,0.4,0.6,0.8,1.0])
#                 limits = q.values
#                 lo = limits[0]
#                 limits = limits[1:]
#                 legend.range_set.all().delete()
#                 for index, hi in enumerate(limits):
#                     color = hsv2hex(float(index) / float(len(limits)-1))
#                     legend.range_set.create(lo=lo, hi=hi, color=color, label = '%g - %g' % (lo,hi))
#                     lo = hi
#             except:
#                 # probably text
#                 series = series.unique()
#                 if series.size > 1:
#                     if series.size > 20:
#                         raise ValueError('Too many values to classify')
#                     legend.value_set.all().delete()
#                     for index, value in enumerate(series):
#                         color = hsv2hex(float(index) / float(series.size-1))
#                         legend.value_set.create(value=value, color = color, label = str(value))
# 
#         return legend
    
class Entry(models.Model):
    legend = models.ForeignKey(Legend,on_delete=models.CASCADE)
    color = models.CharField(max_length=20)    
    label = models.CharField(max_length=40,null=True,blank=True)

    class Meta:
        abstract = True
        
class Range(Entry):
    lo = models.FloatField()
    hi = models.FloatField()
    
    class Meta:
        ordering = ('lo','hi')
        
class Value(Entry):
    value = models.CharField(max_length=40)
    class Meta:
        ordering = ('value',)
            