"""mytest URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from myform import views
urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^login/$',views.mylogin),
    url(r'^logout/$',views.mylogout),
    url(r'^sigin/$',views.sigin),
    url(r'^home',views.Home),
    url(r'^add_articles/$',views.Add_Article),
    url(r'^articles/$',views.show_articles),
    url(r'^drafts/$',views.drafts),
    url(r'^accounts/login/$',views.mylogin),
    url(r'^article/(\d+)',views.show_comments),
    url(r'^postedit/(\d+)/$',views.edit),
    url(r'^sendmail/$',views.sendmail),
    url(r'^theme/(\d+)',views.theme_articles),
    #url(r'^remove/(\d+)/$',views.remove),
   # url(r'^authors/$',views.Add_Author),
   # url(r'^articles/$',views.show ),
]
