# Generated by Django 2.2.5 on 2019-09-11 22:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('maps', '0018_userconfig'),
    ]

    operations = [
        migrations.RenameField(
            model_name='userconfig',
            old_name='visibility',
            new_name='visible',
        ),
    ]
