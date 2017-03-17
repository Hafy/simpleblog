#coding=utf-8
from django import forms
from myform.models import Article,Author,Comment
from django.contrib.auth.models import User

'''class Comment(forms.ModelForm):
		class Meta:
		model=Comment
		fields=['pub_user','article','content']
'''
class LoginForm(forms.ModelForm):
	class Meta:
		model=User
		fields=['username','password','email']

class SiginForm(forms.ModelForm):
	class Meta:
		model=User
		fields=['username','password','email']
	
class MailForm(forms.Form):
	subject=forms.CharField(max_length=100)
	message=forms.CharField(widget=forms.Textarea)
	sender=forms.EmailField(label='from')
	password=forms.CharField(max_length=30)
	received=forms.EmailField(label="to")
	
class ArticleForm(forms.ModelForm):

	class Meta:
		model=Article
		fields=['headline','writer','content','is_published','themes']
class AuthorForm(forms.ModelForm):

	class Meta:
		model=Author
		fields=['name','gender','articles']