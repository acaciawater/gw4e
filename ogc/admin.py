from django.utils.text import gettext_lazy as _
from django.contrib import admin
from django.contrib.admin.decorators import register
from ogc.models import Layer, Server, VERSIONS
from django.forms.models import ModelForm
from django.core.exceptions import ValidationError
from django.contrib import messages

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
