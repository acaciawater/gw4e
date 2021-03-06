# Generated by Django 2.2.12 on 2020-07-30 08:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('maps', '0035_group_open'),
    ]

    operations = [
        migrations.AddField(
            model_name='document',
            name='order',
            field=models.PositiveSmallIntegerField(default=1),
        ),
        migrations.AddField(
            model_name='documentgroup',
            name='order',
            field=models.PositiveSmallIntegerField(default=1),
        ),
        migrations.AlterField(
            model_name='document',
            name='url',
            field=models.URLField(blank=True),
        ),
    ]
