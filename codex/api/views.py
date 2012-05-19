# -*- coding: utf-8 -*-
# Create your views here.
from django.http import HttpResponse
from django.shortcuts import render_to_response, get_object_or_404
from codex.web.models import *

from codex.settings import MEDIA_URL,STATIC_URL
from decimal import *

from django.template import Context, Template, RequestContext

from apisearchviews import *

def APIIndex(request):

    return HttpResponse("API OK")


def LocationDetailView(request, slug):

    result = Location.objects.get(slug=slug)
    resultjson = result.toJSON()

    return HttpResponse(resultjson, content_type="text/plain")


def ObjectDetailView(request, slug):

    result = Object.objects.get(slug=slug)
    resultjson = result.toJSON()

    return HttpResponse(resultjson, content_type="text/plain")


def CharacterDetailView(request, slug):

    result = Character.objects.get(slug=slug)
    resultjson = result.toJSON()

    return HttpResponse(resultjson, content_type="text/plain")


def CreatureDetailView(request, slug):

    result = Creature.objects.get(slug=slug)
    resultjson = result.toJSON()

    return HttpResponse(resultjson, content_type="text/plain")


def ChronicleDetailView(request, slug):

    result = Chronicle.objects.get(slug=slug)
    resultjson = result.toJSON()

    return HttpResponse(resultjson, content_type="text/plain")


def AdventureDetailView(request, slug):

    result = Adventure.objects.get(slug=slug)
    resultjson = result.toJSON()

    return HttpResponse(resultjson, content_type="text/plain")



