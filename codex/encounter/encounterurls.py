# -*- coding: utf-8 *-*
from django.conf.urls.defaults import patterns

from encounter import views as encounterviews

urlpatterns = patterns('',
    (r'^$', encounterviews.EncounterIndex),
    (r'^test/$', encounterviews.EncounterIndex),
    (r'^test/(?P<canon>.+)/(?P<align>.+)/(?P<players_level>.+)/(?P<chosen_difficulty>.+)/$',encounterviews.EncounterTest),
    )
