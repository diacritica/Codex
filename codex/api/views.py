# -*- coding: utf-8 -*-
# Create your views here.
from django.http import HttpResponse
from django.shortcuts import render_to_response, get_object_or_404
from codex.web.models import *

from codex.settings import MEDIA_URL,STATIC_URL
from decimal import *

from django.template import Context, Template, RequestContext

from apisearchviews import *

m = __import__("web")

def GenericDetailView(request, category, slug):

    validcategories = ["object","location","character","creature","adventure","chronicle","spell","rule"]
    
    if category in validcategories:

        try:
            result = getattr(m.models, category.capitalize()).objects.get(slug=slug)
            resultjson = result.toJSON()
        
        except:
            resultjson = '{ "success": false }'

    else:
        resultjson = '{ "success": false }'

    return HttpResponse(resultjson, content_type="application/json")


def APIIndex(request):

    return HttpResponse("API OK")

