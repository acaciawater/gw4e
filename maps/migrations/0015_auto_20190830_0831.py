# Generated by Django 2.2.1 on 2019-08-30 08:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('maps', '0014_auto_20190830_0657'),
    ]

    operations = [
        migrations.AlterField(
            model_name='map',
            name='bbox',
            field=models.CharField(blank=True, max_length=100, null=True, verbose_name='extent'),
        ),
    ]
