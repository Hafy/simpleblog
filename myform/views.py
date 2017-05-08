#encoding:utf-8
from django.shortcuts import render
from .forms import LoginForm,MailForm,ArticleForm,AuthorForm,SiginForm
from django.core.mail import send_mail
from  django.http import HttpResponseRedirect
from .models import Article,Author,Comment,Theme
import json
from django.contrib.auth.models import User
from django.contrib.auth import authenticate,login,logout
from  django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger
# Create your views here.
'''def login(request):
	username=request.POST['username']'''
def mylogout(request):
	logout(request)
	return HttpResponseRedirect("/login")

def mylogin(request):
	if request.method=='POST':
		username=request.POST['username']
		password=request.POST['password']
		user=authenticate(username=username,password=password)
		#user=User.objects.filter(username=username).filter(password=password).filter(email=email)
		if  user is None:
			return render(request,"index.html",{'error_message':'username or password or email incorrect...'})
		else:
			if user.is_active:
				login(request, user)
				return HttpResponseRedirect("/")
			else:
				return render(request,"index.html",{"error_message":'the user is disable'})
	else:
	  	return render(request,"index.html",{'login':True})

def sigin(request):
	if request.method=='POST':
		username=request.POST['username']
		password=request.POST['password']
		is_exsists=len(User.objects.filter(username=username))
		if is_exsists:
			return render(request,'index.html',{'error_message':'sorry the user has already exsists...'})
		else:
			user=User.objects.create_user(username=username,password=password)
			user.save()
			return  HttpResponseRedirect("/login")
	else:
		return render(request,'index.html')

def my_sendmail(request):
	'''msg=EmailMessage('Request CallBack','Here is THE MESSAGE',to=['18734131050@163.com'])
	msg.send()'''
	send_mail("it\'s phf\'s email",'hello phf','18734131050@163.com',['your email@163.com','your email@qq.com'],auth_user='your email@163.com',auth_password='your password')
	return render(request,'login.html')
@login_required
def  sendmail(request):
	if request.method=='POST':
		form=MailForm(request.POST)
		if form.is_valid():
		                subject=form.cleaned_data['subject']
		                message=form.cleaned_data['message']
		                sender=form.cleaned_data['sender']
		                password=form.cleaned_data['password']
		                received=form.cleaned_data['received']
		                send_mail(subject,message,sender,[received],auth_user=sender,auth_password=password)
		                return render(request,'sendmail.html')
	else:
		form=MailForm()
	return render(request,'sendmail.html',{'form':form})

def Home(request):
	articles=Article.objects.all()
	themes=Theme.objects.all()	
	comments=Comment.objects.order_by('-comment_date')[3:6]
	authors=Author.objects.all()
	user=request.user
	page=request.GET.get('page')
	paginator=Paginator(articles,5)
	#paginator
	try:
		posts=paginator.page(page)
	except PageNotAnInteger:
		posts=paginator.page(1)
	except EmptyPage:
		posts=paginator.page(paginator.num_pages)
	return render(request,'home.html',{'articles':articles,'user':user,'comments':comments,'themes':themes,'posts':posts})

def theme_articles(request,theme_id):
	theme=Theme.objects.get(pk=theme_id)
	articles=theme.article_set.all()
	return render(request,'theme_articles.html',{'articles':articles})


@login_required
def drafts(request):
	articles=Article.objects.filter(is_published=False)
	return render(request,'drafts.html',{'articles':articles})
@login_required
def Add_Article(request):
	if request.method=='POST':
		form=ArticleForm(request.POST)
		if form.is_valid():
			form.save()
			return HttpResponseRedirect('/')
	else:
		form=ArticleForm()
	return  render(request,'article.html',{'article_form':form})
@login_required
def Add_Author(request):
	if request.method=='POST':
		form=AuthorForm(request.POST)
		if form.is_valid():
			form.save()
			return HttpResponseRedirect('/')
	else:
		form=AuthorForm()
	return  render(request,'home.html',{'author_form':form})


def show_comments(request,article_id):
	if request.method=='POST':
		comment=request.POST.get('comment')
		pub_username=request.user.username
		article=Article.objects.get(pk=article_id)
		Comment.objects.create(pub_username=pub_username,content=comment,article=article)
		comments=article.comment_set.all()
		return render(request,'article.html',{'article':article,'comments':comments})
	else:
		article=Article.objects.get(pk=article_id)
		comments=article.comment_set.all()
	return render(request,'article.html',{'article':article,'comments':comments})

def show_articles(request):
	articles=Article.objects.all()
	return  render(request,'article.html',{'articles':articles})


@login_required
def edit(request,article_id):
	if request.method=='POST':
		article=Article.objects.get(pk=article_id)	 
		article.headline=request.POST.get('headline')
		article.writer=request.POST.get('writer')
		article.content=request.POST.get('content')
		if  not request.POST.get('is_published'):
			article.is_published=False
		else:
			article.is_published=True
		article.save()
		return HttpResponseRedirect("/article/"+article_id)
	else:
		article=Article.objects.get(pk=article_id)
		#form=ArticleForm()
	return render(request,'drafts.html',{'article':article,'edit':True})


def mybootrap(request):
	return render(request,'index.html')
