# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-01-16 08:03
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myform', '0008_auto_20170116_0754'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='themes',
            field=models.ManyToManyField(blank=True, null=True, to='myform.Theme'),
        ),
        migrations.AlterField(
            model_name='theme',
            name='theme_name',
            field=models.CharField(default='null', max_length=30),
        ),
    ]
