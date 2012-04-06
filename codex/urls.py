from django.conf.urls.defaults import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin, databrowse

from web.models import *
from web import views
from django.views.generic import  DetailView, ListView
from django.views.generic.edit import FormView

from django.views.generic.simple import direct_to_template
from django.views.generic.simple import redirect_to

from web.feeds import LatestEntriesFeed
from django.conf import settings

#from taggit

import logging
databrowse.site.register(Character)
databrowse.site.register(CharacterRelationship)
databrowse.site.register(Creature)
databrowse.site.register(CreatureRelationship)
databrowse.site.register(Object)
databrowse.site.register(ObjectRelationship)
databrowse.site.register(Author)
databrowse.site.register(Location)
databrowse.site.register(Image)
databrowse.site.register(Language)
databrowse.site.register(Religion)
databrowse.site.register(Adventure)
databrowse.site.register(Chronicle)
#databrowse.site.register(Tags)
#databrowse.site.register(TaggableManager)

admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'codex.views.home', name='home'),
    # url(r'^codex/', include('codex.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^scriptorium/', include(admin.site.urls)),
    (r'^rss/$', LatestEntriesFeed()),
    #(r'^db/(.*)', databrowse.site.root),
#    (r'^grappelli/', include('grappelli.urls')),

    (r'^character/all/$',views.CharacterListingView),
    (r'^character/(?P<slug>.+)/$',views.CharacterDetailView),
    (r'^character/$',views.CharacterSectionView),

    (r'^creature/all/$',views.CreatureListingView),
    (r'^creature/(?P<slug>.+)/$',views.CreatureDetailView),
    (r'^creature/$',views.CreatureSectionView),

    (r'^location/all/$',views.LocationListingView),
    (r'^location/(?P<slug>.+)/$',views.LocationDetailView),
    (r'^location/$',views.LocationSectionView),

    (r'^adventure/all/$',views.AdventureListingView),
    (r'^adventure/(?P<slug>.+)/$',views.AdventureDetailView),
    (r'^adventure/$',views.AdventureSectionView),

    (r'^chronicle/all/$',views.ChronicleListingView),
    (r'^chronicle/(?P<slug>.+)/$',views.ChronicleDetailView),
    (r'^chronicle/$',views.ChronicleSectionView),

    (r'^object/all/$',views.ObjectListingView),
    (r'^object/(?P<slug>.+)/$',views.ObjectDetailView),
    (r'^object/$',views.ObjectSectionView),

    (r'^search/all/$', redirect_to, {'url': '/advancedsearch/'}),
    (r'^search/$',views.SearchRedirectView),
    (r'^search/None/None/$',redirect_to, {'url': '/advancedsearch/'}),
    (r'^search/(?P<searchfilter>all|object|character|creature|location|adventure|chronicle)/(?P<canonlvl>ALL|NEW|AP|APC|C)/(?P<searchterm>.*)/$',views.SimpleSearchView),
    (r'^search/(?P<searchfilter>all|object|character|creature|location|adventure|chronicle)/(?P<searchterm>.*)/$',views.SimpleSearchView),
    (r'^search/(?P<searchfilter>all|object|character|creature|location|adventure|chronicle)/$',views.SimpleSearchView),
    (r'^contact/$',views.ContactView),
    (r'^send_info/$',views.SendinfoView),

#    (r'^search/',views.AdvancedSearchView),
    (r'^advancedsearch/$',views.AdvancedSearchView),
    (r'^resadvancedsearch/$',views.ResultsAdvancedSearchView),

    (r'^$', views.IndexView),
    (r'^rss.xml$', LatestEntriesFeed()),

)

if settings.ENVIRONMENT=="TEST":
    urlpatterns += patterns('',
        url(r'^css/(?P<path>.*)$', 'django.views.static.serve', {
            'document_root': "/home/elfo/SVN/codex-svn/codex/templates/web/css/",
        }),
        url(r'^ima/(?P<path>.*)$', 'django.views.static.serve', {
            'document_root': "/home/elfo/SVN/codex-svn/codex/templates/web/ima/",
        }),
        url(r'^js/(?P<path>.*)$', 'django.views.static.serve', {
            'document_root': "/home/elfo/SVN/codex-svn/codex/templates/web/js/",
        }),
        url(r'^rotativo/(?P<path>.*)$', 'django.views.static.serve', {
            'document_root': "/home/elfo/SVN/codex-svn/codex/templates/web/rotativo/",
        }),
        url(r'^media/img/(?P<path>.*)$', 'django.views.static.serve', {
            'document_root': "/home/elfo/SVN/codex-svn/codex/media/img/",
        }),
        url(r'^media/files/(?P<path>.*)$', 'django.views.static.serve', {
            'document_root': "/home/elfo/SVN/codex-svn/codex/media/files/",
        }),
   )

handler404 = 'codex.web.views.NotFoundView'
handler500 = 'codex.web.views.InternalErrorView'


