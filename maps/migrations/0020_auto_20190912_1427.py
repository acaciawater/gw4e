# Generated by Django 2.2.5 on 2019-09-12 14:27

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('maps', '0019_auto_20190911_2224'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='userconfig',
            options={'verbose_name': 'User preference', 'verbose_name_plural': 'User preferences'},
        ),
        migrations.AlterField(
            model_name='userconfig',
            name='layer',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='maps.Layer', verbose_name='layer'),
        ),
        migrations.AlterField(
            model_name='userconfig',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='user'),
        ),
    ]
