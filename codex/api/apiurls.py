# -*- coding: utf-8 *-*
from django.conf.urls.defaults import patterns

from api import views as apiviews

urlpatterns = patterns('',
    (r'^$', apiviews.APIIndex),
    (r'^location/(?P<slug>.+)/$', apiviews.LocationDetailView),
    )
