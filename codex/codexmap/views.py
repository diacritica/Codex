# -*- coding: utf-8 -*-
# Create your views here.
from django.http import HttpResponse
from django.shortcuts import render_to_response, get_object_or_404
from codex.web.models import *

from codex.settings import MEDIA_URL,STATIC_URL
from decimal import *

from django.template import Context, Template, RequestContext



def CodexMapIndex(request):

    return HttpResponse("CodexMap OK")
