# Generated by Django 2.2.1 on 2019-07-08 14:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('wms', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='server',
            name='version',
            field=models.CharField(choices=[('1.1.1', '1.1.1'), ('1.3.0', '1.3.0')], default='1.3.0', max_length=10, verbose_name='version'),
        ),
    ]