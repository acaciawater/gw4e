# Generated by Django 2.2.12 on 2020-04-16 15:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ogc', '0006_auto_20200414_1524'),
    ]

    operations = [
        migrations.AlterField(
            model_name='legend',
            name='property',
            field=models.CharField(max_length=40, verbose_name='property'),
        ),
    ]
