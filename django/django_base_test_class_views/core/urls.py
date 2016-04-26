# -*- coding: utf8 -*-

from django.conf.urls import patterns, url


urlpatterns = patterns('core.views',

   url(r'^$','posts'),
   # url(r'^page(?P<page>\d+)/$', 'post'),

   # Список всех активных статей
   url(r'^index/$', 'index_posts', name='index_posts'),
   url(r'^posts/(?P<pk>\d+)/$', 'post_detail', name='post_detail'),


)


