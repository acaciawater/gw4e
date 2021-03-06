# Generated by Django 2.2.1 on 2019-05-23 12:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('maps', '0004_auto_20190523_1117'),
    ]

    operations = [
        migrations.AddField(
            model_name='project',
            name='title',
            field=models.CharField(default='title', help_text='Title on browser page', max_length=100, verbose_name='tile'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='project',
            name='name',
            field=models.CharField(help_text='Descriptive name of project', max_length=100, unique=True, verbose_name='name'),
        ),
        migrations.AlterField(
            model_name='project',
            name='slug',
            field=models.SlugField(help_text='Short name for url'),
        ),
    ]
