# -*- coding: utf-8 *-*
from codex.web.models import *

from django.http import HttpResponse
from django.shortcuts import render_to_response, get_object_or_404

from codex.web import tools
import re
from django.shortcuts import render_to_response

m = __import__("web")

def SimpleSearchView(request, searchfilter, searchterm=""):

    keywords = split_query_into_keywords(searchterm)

    results = []
    allobjects = {}

    validsearchfilters = ["object","location","character","creature","adventure","chronicle","spell","rule"]

    if searchfilter in validsearchfilters:

        allobjects[searchfilter] = getattr(m.models,searchfilter.capitalize()).objects.all()

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

    else:
        sresults = []

    object_list = sresults

    jsonobject_list = [item.toJSON() for item in object_list]

    resultjson = "".join(jsonobject_list)

    return HttpResponse(resultjson, content_type="application/json")


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
