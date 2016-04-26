from django.contrib import admin
from core.models import Post, Comment
# Register your models here.


class PostAdmin(admin.ModelAdmin):
    list_display = ('name', 'author', 'created_at')

admin.site.register(Post, PostAdmin)
admin.site.register(Comment)
