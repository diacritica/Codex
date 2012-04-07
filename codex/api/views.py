# -*- coding: utf-8 -*-
# Create your views here.
from django.http import HttpResponse
from django.shortcuts import render_to_response, get_object_or_404
from codex.web.models import *

from codex.settings import MEDIA_URL,STATIC_URL
from decimal import *

from django.template import Context, Template, RequestContext


def APIIndex(request):

    return HttpResponse("API OK")


def LocationDetailView(request, slug):

    result = Location.objects.get(slug=slug)
    resultjson = result.toJSON()

    return HttpResponse(resultjson, content_type="text/plain")


