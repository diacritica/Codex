# -*- coding: utf-8 *-*
from django.conf.urls.defaults import patterns

from codexmap import views as codexmapviews

urlpatterns = patterns('',
    (r'^$', codexmapviews.CodexMapIndex),
    )
