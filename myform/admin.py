from django.contrib import admin
from myform.models import Article
# Register your models here.
class ArticleAdmin(admin.ModelAdmin):
	list_display=('headline','writer',)
admin.site.register(Article,ArticleAdmin)
