from django.contrib import admin
from django.contrib import messages
from django.contrib.admin.decorators import register
from django.db.models import Max
from django.db.models.fields import TextField
from django.db.utils import IntegrityError
from django.forms.widgets import Textarea
from django.shortcuts import render
from django.utils.translation import gettext_lazy as _

from ogc.models import Layer as OGCLayer

from .forms import LayerPropertiesForm, SelectMapForm
from .models import Map, Layer, Group, DocumentGroup, Document


admin.site.site_header = 'GW4E Administration'

@register(Group)
class GroupAdmin(admin.ModelAdmin):
    fields = ('name', 'map')
    list_display = ('name', 'map', 'layer_count')
    list_filter = ('map',)


@register(Layer)
class LayerAdmin(admin.ModelAdmin):
    fields = (('layer', 'map', 'group'),
              ('order', 'visible', 'use_extent'),
              ('opacity', 'transparent'),
              ('minzoom', 'maxzoom'),
              ('properties', 'clickable'),
              'stylesheet',
              ('download_url', 'allow_download'),
              )
    list_filter = ('visible', 'map', 'group',
                   'layer__server', 'allow_download')
    list_display = ('layer', 'map', 'group', 'extent', 'use_extent')
    search_fields = ('layer__title',)
    actions = ['update_layer_properties', 'add_layers_to_map']

    def update_layer_properties(self, request, queryset):
        if 'apply' in request.POST:
            form = LayerPropertiesForm(request.POST)
            if form.is_valid():
                # filter null items from cleaned_data
                data = {k: v for k, v in form.cleaned_data.items()
                        if v is not None}
                ret = queryset.update(**data)
                messages.success(request, 'Properties updated successfully for {} layers'.format(ret))
            else:
                # warn about the problem
                messages.error(request, _(
                    'Properties were not updated: error in form'))
        elif 'cancel' in request.POST:
            messages.warning(request, _(
                'Action to update layer properties was cancelled'))
        else:
            form = LayerPropertiesForm()
            return render(request, 'maps/layer_properties.html', context={
                'form': form, 'meta': self.model._meta, 'queryset': queryset
            })

    update_layer_properties.short_description = _('Update layer properties')

    def add_layers_to_map(self, request, queryset):
        if 'apply' in request.POST:
            form = SelectMapForm(request.POST)
            if form.is_valid():
                selected_map = form.cleaned_data['map']
                if selected_map is None:
                    messages.warning(request, _(
                        'No map was selected. Action to add layers to map was cancelled.'))
                    return
                added = 0
                skipped = 0
                order = selected_map.layer_set.aggregate(max=Max('order'))['max'] or 0
                for layer in queryset:
                    if selected_map.layer_set.filter(layer=layer.layer).exists():
                        skipped += 1
                    else:
                        layer.pk = None
                        layer.map = selected_map
                        layer.order = order
                        try:
                            layer.save()
                            order += 1
                            added += 1
                        except:
                            skipped += 1
                if added:
                    messages.success(request, '{} layers were added to map {}.'.format(added, selected_map))
                if skipped:
                    messages.warning(request, '{} layers were not added to map {}.'.format(skipped, selected_map))
            else:
                # warn about the problem
                messages.error(request, _(
                    'No layers were added: error in form.'))
        elif 'cancel' in request.POST:
            messages.warning(request, _(
                'Action to add layers to map was cancelled.'))
        else:
            form = SelectMapForm()
            return render(request, 'maps/add_layers.html',
                          context={'form': form, 'meta': self.model._meta, 'queryset': queryset})

    add_layers_to_map.short_description = _('Add selected layers to a map')


class LayerInline(admin.TabularInline):
    model = Layer
    fields = ('layer', 'order', 'group', 'visible',
              'clickable', 'allow_download', 'opacity')
    extra = 0

    def get_queryset(self, request):
        return admin.TabularInline.get_queryset(self, request).order_by('order').prefetch_related('layer')
    
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'layer':
            kwargs['queryset'] = OGCLayer.objects.order_by('server__name','layername')
        return admin.TabularInline.formfield_for_foreignkey(self, db_field, request, **kwargs)

@register(Map)
class MapAdmin(admin.ModelAdmin):
    list_display = ('name','user')
    list_filter = ('user',)
    search_fields = ('name',)
    inlines = [LayerInline]
    actions = ['update_extent', 'clone_map']

    def update_extent(self, request, queryset):
        count = 0
        for instance in queryset:
            instance.set_extent()
            count += 1
        messages.success(request, '{} extents were updated successfully.'.format(count))
    
    update_extent.short_description = _('Update extent of selected maps')
    
    def clone_map(self, request, queryset):
        success = 0
        errors = 0
        for instance in queryset:
            try:
                instance.clone(request.user)
                success += 1
            except IntegrityError:
                errors += 1
        if success:
            messages.success(request, '{} maps were cloned successfully for user {}.'.format(success, request.user))
        if errors:
            messages.error(request, '{} maps already exist for user {}.'.format(errors, request.user))
    
    clone_map.short_description=_('Clone selected maps for current user')
                
class DocumentInline(admin.TabularInline):
    model = Document
    formfield_overrides = {TextField: {'widget': Textarea(attrs={'rows':1})}}
    
@register(Document)
class DocumentAdmin(admin.ModelAdmin):
    list_display = ('name','cluster','group','doc','url')
    list_filter = ('group','cluster')

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'group':
            kwargs['queryset'] = DocumentGroup.objects.order_by('parent__name','name')
        return admin.ModelAdmin.formfield_for_foreignkey(self, db_field, request, **kwargs)

@register(DocumentGroup)
class DocumentGroupAdmin(admin.ModelAdmin):
    inlines = [DocumentInline]

