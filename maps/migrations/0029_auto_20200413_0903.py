# Generated by Django 2.2.12 on 2020-04-13 09:03

from django.db import migrations, models

class Migration(migrations.Migration):

    dependencies = [
        ('maps', '0028_remove_layer_wms_layer'),
    ]

    operations = [
        migrations.AddField(
            model_name='group',
            name='order',
            field=models.SmallIntegerField(default=1, verbose_name='order'),
        ),
        migrations.AlterField(
            model_name='layer',
            name='order',
            field=models.SmallIntegerField(default=1, verbose_name='order'),
        ),
    ]
