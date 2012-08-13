#!/usr/bin/python
# -*- coding: utf-8 -*-

from django.contrib.syndication.views import Feed
from web.models import *
from itertools import chain
class LatestEntriesFeed(Feed):
    title = u"Codex de la Marca"
    #link = u"http://codex.ithilien.eu/rss/"
    link = u"http://codexdelamarca.com/rss/"
    description = u"Cambios y añadidos en Codex de la Marca."

    def items(self):

        objects = sorted(
            chain(Object.objects.all() , Character.objects.all() , Creature.objects.all() , Chronicle.objects.all() , Adventure.objects.all() , Location.objects.all(), FanArt.objects.all(), Spell.objects.all(), Rule.objects.all()),key=lambda instance: instance.last_updated)
        objects.reverse()
        return objects[:10]

    def item_title(self, item):
        return item.name

    def item_description(self, item):
        return item.description

    def item_link(self,item):
        #return u"http://codex.ithilien.eu" + item.get_absolute_url()
        return u"http://codexdelamarca.com" + item.get_absolute_url()
