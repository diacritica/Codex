# -*- coding: utf-8 *-*
from django.conf.urls.defaults import patterns

from mobile import views as mobileviews

urlpatterns = patterns('',
    (r'^$', mobileviews.MobileIndex),
    )
