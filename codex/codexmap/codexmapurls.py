# -*- coding: utf-8 *-*
from django.conf.urls.defaults import patterns
from django.conf.urls.defaults import patterns, include, url
from django.conf import settings
from codexmap import views as codexmapviews

urlpatterns = patterns('',
    (r'^test/$', codexmapviews.CodexMapTest),
    (r'^$', codexmapviews.CodexMapIndex),

    )

if settings.ENVIRONMENT=="TEST":
    urlpatterns += patterns('',
        url(r'^data/(?P<path>.*)$', 'django.views.static.serve', {
            'document_root': "/home/elfo/GIT/CODEX//codex/codexmap/data/",
        }),

   )
