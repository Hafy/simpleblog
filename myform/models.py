from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Theme(models.Model):
	theme_name=models.CharField(max_length=30,default='null')
	class Meta:
		db_table="theme"
	def __str__(self):
		return self.theme_name
class Article(models.Model):
	themes=models.ManyToManyField(Theme,blank=True,null=True)
	pub_date=models.DateField(auto_now=True)
	headline=models.CharField(max_length=100)
	content=models.TextField()
	#modify_time=models.DateTimeField(auto_now_add=True)
	writer=models.CharField(max_length=20)
	is_published=models.BooleanField(default=True)
	class Meta:
		db_table='Article'

	def __unicode__(self):
		return self.headline


class Comment(models.Model):
	article=models.ForeignKey(Article)
	pub_username=models.CharField(max_length=20)
	content=models.TextField()
	comment_date=models.DateTimeField(auto_now=True)
	class Meta:
		db_table='Comment'
	def __str__(self):
		return self.content

class Author(models.Model):
	GENDER=(('F','Female'),
		('M','Male'),
		)
	articles=models.ManyToManyField(Article,default=None)
	gender=models.CharField(max_length=1,default='F',choices=GENDER)
	name=models.CharField(max_length=20)

	class Meta:
		db_table='Author'
	def __str__(self):
		return self.name

