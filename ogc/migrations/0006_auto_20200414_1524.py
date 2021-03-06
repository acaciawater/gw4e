# Generated by Django 2.2.12 on 2020-04-14 15:24

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('ogc', '0005_auto_20200413_0903'),
    ]

    operations = [
        migrations.AlterField(
            model_name='layer',
            name='server',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ogc.Server', verbose_name='server'),
        ),
        migrations.AlterField(
            model_name='range',
            name='label',
            field=models.CharField(blank=True, max_length=80, null=True),
        ),
        migrations.AlterField(
            model_name='value',
            name='label',
            field=models.CharField(blank=True, max_length=80, null=True),
        ),
    ]
