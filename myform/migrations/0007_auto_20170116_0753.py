# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-01-16 07:53
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myform', '0006_auto_20170110_1400'),
    ]

    operations = [
        migrations.AlterField(
            model_name='theme',
            name='theme_name',
            field=models.CharField(default='no theme', max_length=30),
        ),
    ]
