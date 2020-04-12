from django.utils.text import gettext_lazy as _
from django.contrib import admin
from django.contrib.admin.decorators import register
from ogc.models import Layer, Server, VERSIONS
from django.forms.models import ModelForm
from django.core.exceptions import ValidationError
from django.contrib import messages
from django.forms.widgets import TextInput, Select
from ogc.models.legend import Range, Value, Legend

@register(Layer)    
class LayerAdmin(admin.ModelAdmin):
    model = Layer
    list_display = ('server','title', 'layername')
    list_filter = ('server',)

class LayerInline(admin.TabularInline):
    model = Layer
    extra = 0

class ServerForm(ModelForm):
    model = Server
    
    def clean(self):
        ''' check for valid service version '''
        cleaned_data = ModelForm.clean(self)
        service = cleaned_data['service_type']
        versions = map(lambda x: x[0], dict(VERSIONS).get(service))
        version = cleaned_data['version']
        if version not in versions:
            raise ValidationError(_('Invalid version (%(version)s) for %(service)s server'), 
                                  code='invalid', 
                                  params={'version': version, 'service': service})
        return cleaned_data

@register(Server)    
class ServerAdmin(admin.ModelAdmin):
    model = Server
    actions = ['updateLayers']
    inlines = [LayerInline]
    form = ServerForm
    
    def updateLayers(self, request, queryset):
        numCreated = 0
        for server in queryset:
            try:
                numCreated += server.update_layers()
            except Exception as e:
                messages.error(request, e)
        messages.success(request, _('{} new layers discovered.').format(numCreated))
    updateLayers.short_description=_('update layer list of selected servers')


class ColorInline(admin.TabularInline):
    ''' replaces widget for color field with html5 color picker '''
    def formfield_for_dbfield(self, db_field, request, **kwargs):
        if db_field.name == 'color':
            kwargs['widget'] = TextInput(attrs={'type': 'color'})
        return admin.TabularInline.formfield_for_dbfield(self, db_field, request, **kwargs)

class RangeInline(ColorInline):
    model = Range
    fields = ('label','color','lo','hi')
    extra = 0

class ValueInline(ColorInline):
    model = Value
    fields = ('label','color','value')
    extra = 0
    
class LegendForm(ModelForm):
    class Meta:
        model = Legend
        exclude = []
        widgets = {
            'property': Select
            }
    
@register(Legend)
class LegendAdmin(admin.ModelAdmin):
    list_display = ('title', 'property', 'layer')
    list_filter = ('layer', 'layer__server')
    search_fields = ('title', 'property', 'layer__layername', 'layer__title')
    inlines = [RangeInline, ValueInline]
    form = LegendForm
       
    class Media:
        js = ('js/wfsproperties.js',)
