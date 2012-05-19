# -*- coding: utf-8 *-*
from codex.web.models import *

from django.http import HttpResponse
from django.shortcuts import render_to_response, get_object_or_404

from codex.web import tools
import re
from django.shortcuts import render_to_response


def SimpleSearchView(request, searchfilter, searchterm=""):

    keywords = split_query_into_keywords(searchterm)

    results = []
    allobjects = {}

    if searchfilter == 'object':
        allobjects[searchfilter] = Object.objects.all()

    elif searchfilter == 'character':
        allobjects[searchfilter] = Character.objects.all()

    elif searchfilter == 'creature':
        allobjects[searchfilter] = Creature.objects.all()

    elif searchfilter == 'chronicle':
        allobjects[searchfilter] = Chronicle.objects.all()

    elif searchfilter == 'adventure':
        allobjects[searchfilter] = Adventure.objects.all()

    elif searchfilter == 'location':
        allobjects[searchfilter] = Location.objects.all()

    if len(keywords) != 0:
        for objecttype, objectlist in allobjects.items():

            for ob in objectlist:
                ks = 0
                for keyword in keywords:
                    if keyword.lower() in ob.searchText().lower():
                        ks+=5
                        ks+=ob.searchText().lower().count(keyword.lower())
                    if ks>0:
                        if ob in results:
                            ob.hits += ks
                        else:
                            ob.hits = ks
                            ob.objecttype = objecttype
                            results.append(ob)
        sresults = sorted(results, key=lambda anobject: anobject.hits, reverse=True)
    else:
        sresults = allobjects[searchfilter]

    object_list = sresults

    jsonobject_list = [item.toJSON() for item in object_list]

    resultjson = "".join(jsonobject_list)

    return HttpResponse(resultjson, content_type="text/plain")


def split_query_into_keywords(query):
    """Split the query into keywords,
    where keywords are double quoted together,
    use as one keyword."""
    keywords = []
    if type(query) == type(None): return keywords
    # Deal with quoted keywords
    while '"' in query:
        first_quote = query.find('"')
        second_quote = query.find('"', first_quote + 1)
        quoted_keywords = query[first_quote:second_quote + 1]
        keywords.append(quoted_keywords.strip('"'))
        query = query.replace(quoted_keywords, ' ')
    # Delete common words
    stopwordsre = "|".join(tools.stopwords.stop_words_list)
    stopre = re.compile("\\b(%s)\\W"%(stopwordsre),re.I)
    query = re.sub(stopre, "", query)
    # Split the rest by spaces
    keywords.extend(query.split())
    return keywords
