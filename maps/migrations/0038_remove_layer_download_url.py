# Generated by Django 2.2.12 on 2020-09-25 09:35

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('maps', '0037_auto_20200819_1248'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='layer',
            name='download_url',
        ),
    ]
