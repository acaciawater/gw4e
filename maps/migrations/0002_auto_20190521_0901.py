# Generated by Django 2.2.1 on 2019-05-21 09:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('maps', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='project',
            name='timeseries',
            field=models.ManyToManyField(blank=True, null=True, to='maps.Timeseries', verbose_name='timeseries'),
        ),
    ]
