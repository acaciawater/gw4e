# Generated by Django 2.2.12 on 2020-04-09 21:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('wfs', '0002_auto_20200408_2030'),
    ]

    operations = [
        migrations.AddField(
            model_name='layer',
            name='bbox',
            field=models.CharField(blank=True, max_length=100, null=True, verbose_name='extent'),
        ),
        migrations.AlterField(
            model_name='server',
            name='version',
            field=models.CharField(choices=[('1.0.0', '1.0.0'), ('1.1.0', '1.1.0'), ('2.0.0', '2.0.0'), ('3.0.0', '3.0.0')], default='1.1.0', max_length=10, verbose_name='version'),
        ),
    ]
