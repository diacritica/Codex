# -*- coding: utf-8 *-*
from django.conf.urls.defaults import patterns

from encounter import views as encounterviews

urlpatterns = patterns('',
    (r'^$', encounterviews.EncounterIndex),
    (r'^(?P<canon>.+)/(?P<align>.+)/(?P<players_level>.+)/(?P<chosen_difficulty>.+)/$',encounterviews.Encounter),
    )
