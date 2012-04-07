# -*- coding: utf-8 *-*
from django.conf.urls.defaults import patterns

from encounter import views as encounterviews

urlpatterns = patterns('',
    (r'^$', encounterviews.EncounterIndex),
    )
