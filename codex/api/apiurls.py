# -*- coding: utf-8 *-*
from django.conf.urls.defaults import patterns

from api import views as apiviews

urlpatterns = patterns('',
    (r'^$', apiviews.APIIndex),



#    (r'^location/(?P<slug>.+)/$', apiviews.LocationDetailView),
#    (r'^object/(?P<slug>.+)/$', apiviews.ObjectDetailView),
#    (r'^character/(?P<slug>.+)/$', apiviews.CharacterDetailView),
#    (r'^creature/(?P<slug>.+)/$', apiviews.CreatureDetailView),
#    (r'^chronicle/(?P<slug>.+)/$', apiviews.ChronicleDetailView),
#    (r'^adventure/(?P<slug>.+)/$', apiviews.AdventureDetailView),


    (r'^search/(?P<searchfilter>all|object|character|creature|location|adventure|chronicle|rule|spell|fanart)/(?P<searchterm>.*)/$',apiviews.SimpleSearchView),
    (r'^search/(?P<searchfilter>all|object|character|creature|location|adventure|chronicle|rule|spell|fanart)/$',apiviews.SimpleSearchView),

    (r'^(?P<category>.+)/(?P<slug>.+)/$', apiviews.GenericDetailView),

    )
