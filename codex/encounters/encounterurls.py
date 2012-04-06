# -*- coding: utf-8 *-*
from django.conf.urls.defaults import patterns

from encounters import views as encounterviews

urlpatterns = patterns('',
    (r'^$', encounterviews.EncounterIndex),
    )
