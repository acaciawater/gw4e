# Generated by Django 2.2.12 on 2020-04-15 19:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('maps', '0033_delete_userconfig'),
    ]

    operations = [
        migrations.AddField(
            model_name='documentgroup',
            name='open',
            field=models.BooleanField(default=False),
        ),
    ]
