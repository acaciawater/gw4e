# Generated by Django 2.2.1 on 2019-05-21 09:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('maps', '0002_auto_20190521_0901'),
    ]

    operations = [
        migrations.AlterField(
            model_name='project',
            name='map',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='maps.Map', verbose_name='map'),
        ),
        migrations.RemoveField(
            model_name='project',
            name='timeseries',
        ),
        migrations.AddField(
            model_name='project',
            name='timeseries',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='maps.Timeseries', verbose_name='timeseries'),
        ),
    ]
