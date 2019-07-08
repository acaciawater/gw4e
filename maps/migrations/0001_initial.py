# Generated by Django 2.2.1 on 2019-05-21 08:59

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('wms', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Map',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, unique=True, verbose_name='name')),
            ],
        ),
        migrations.CreateModel(
            name='Timeseries',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, unique=True, verbose_name='name')),
                ('server', models.URLField(verbose_name='server')),
                ('locations', models.CharField(default='locs/', max_length=100, verbose_name='locations')),
                ('popup', models.CharField(default='pop/{id}/', max_length=100, verbose_name='popup')),
                ('chart', models.CharField(default='net/chart/{id}/', max_length=100, verbose_name='chart')),
            ],
        ),
        migrations.CreateModel(
            name='Project',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('slug', models.SlugField()),
                ('name', models.CharField(max_length=100, unique=True, verbose_name='name')),
                ('map', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='maps.Map', verbose_name='map')),
                ('timeseries', models.ManyToManyField(to='maps.Timeseries', verbose_name='timeseries')),
            ],
        ),
        migrations.CreateModel(
            name='Layer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('order', models.SmallIntegerField(verbose_name='order')),
                ('visible', models.BooleanField(default=True, verbose_name='visible')),
                ('format', models.CharField(default='image/png', max_length=50, verbose_name='format')),
                ('minzoom', models.SmallIntegerField(blank=True, null=True, verbose_name='maxzoom')),
                ('maxzoom', models.SmallIntegerField(blank=True, null=True, verbose_name='minzoom')),
                ('transparent', models.BooleanField(default=True, verbose_name='transparent')),
                ('opacity', models.DecimalField(decimal_places=1, default=1.0, max_digits=4, verbose_name='opacity')),
                ('layer', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='wms.Layer', verbose_name='WMS layer')),
                ('map', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='maps.Map', verbose_name='map')),
            ],
        ),
    ]