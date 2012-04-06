# -*- coding: utf-8 -*-
# Create your views here.
from django.http import HttpResponse
from django.shortcuts import render_to_response, get_object_or_404
from django.forms.models import modelformset_factory
from codex.web.models import *

from django.core import validators
from django.http import HttpResponseRedirect
from codex.settings import MEDIA_URL,STATIC_URL
from decimal import *

from django.template import Context, Template, RequestContext

from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger


def EncounterIndex(request):

    return HttpResponse("OK")
