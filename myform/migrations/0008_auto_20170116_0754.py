# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-01-16 07:54
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myform', '0007_auto_20170116_0753'),
    ]

    operations = [
        migrations.AlterField(
            model_name='theme',
            name='theme_name',
            field=models.CharField(blank=True, max_length=30, null=True),
        ),
    ]
