# Generated by Django 2.2.12 on 2020-04-10 10:33

from django.db import migrations

def copy_layers(apps, schema_editor):
    ''' add copy of layer as ogc_layer '''
    MapLayer = apps.get_model('maps', 'Layer')
    OwsLayer = apps.get_model('ogc', 'Layer')

    for ml in MapLayer.objects.all():
        l = ml.layer
        ol = OwsLayer.objects.get(layername = l.layername, server__name=l.server.name)
        ml.ogc_layer = ol
        ml.save(update_fields=('ogc_layer',))

def undo(apps, schema_editor):
    pass
            
class Migration(migrations.Migration):

    dependencies = [
        ('maps', '0026_layer_ogc_layer'),
    ]

    operations = [
        migrations.RunPython(copy_layers, undo)
    ]