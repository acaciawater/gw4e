# Generated by Django 2.2.12 on 2020-04-17 12:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('maps', '0034_documentgroup_open'),
    ]

    operations = [
        migrations.AddField(
            model_name='group',
            name='open',
            field=models.BooleanField(default=False, verbose_name='open'),
        ),
    ]