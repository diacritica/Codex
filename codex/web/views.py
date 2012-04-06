# -*- coding: utf-8 -*-
# Create your views here.
from django.http import HttpResponse
from django.shortcuts import render_to_response, get_object_or_404
from django.forms.models import modelformset_factory
from codex.web.models import *

from django.utils.translation import ugettext_lazy as _

from django.core import validators
from django.http import HttpResponseRedirect
from codex.settings import MEDIA_URL,STATIC_URL
from decimal import *

from django.template import Context, Template, RequestContext

from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

import re
import tools.stopwords

CHAR_RELATIONSHIP_CHOICES = (
        ('SON', _(u'Hijo')),
        ('FATHER', _(u'Padre')),
        ('BROTHER', _(u'Hermano')),
        ('SUBDIT', _(u'Súbdito')),
        ('GROUP', _(u'Grupo')),
        ('FELLOW', _(u'Compañero')),
        ('NEMESIS', _(u'Némesis')),
        ('ENEMY', _(u'Enemigo')),
        ('FRIEND', _(u'Amigo')),
        ('MASTER', _(u'Maestro')),
        ('APPRENTICE', _(u'Aprendiz')),
        ('FAMILIAR', _(u'Familiar (animal)')),
        ('EMPLOYEE', _(u'Empleado')),
        ('LORD', _(u'Señor')),
        ('UNDERLING', _(u'Subalterno')),
        ('COUSIN', _(u'Primo')),
        ('NEPHEW', _(u'Sobrino')),
        ('UNCLE', _(u'Tío')),
        ('GRAND', _(u'Abuelo')),
        ('CREATOR', _(u'Creador')),
)


def ContactView(request):

    return render_to_response('web/contact.html',{})

def SendinfoView(request):

    return render_to_response('web/sendinfo.html',{})


def IndexView(request):
    chars = Character.objects.all().order_by('-last_updated')[:3]
    objects = Object.objects.all().order_by('-last_updated')[:3]
    creatures = Creature.objects.all().order_by('-last_updated')[:3]
    chronicles = Chronicle.objects.all().order_by('-last_updated')[:3]
    locations = Location.objects.all().order_by('-last_updated')[:3]
    adventures = Adventure.objects.all().order_by('-last_updated')[:3]
    index_list = {'characters':chars, 'objects':objects, 'creatures':creatures, 'chronicles':chronicles, 'locations':locations, 'adventures':adventures}
    return render_to_response('web/index.html', {'index_list':index_list})

def NotFoundView(request):
    return render_to_response('web/404.html')

def InternalErrorView(request):
    return render_to_response('web/500.html')

def getCharacterRelations(character):

	characterlist1 = CharacterRelationship.objects.filter(character1__name = character.name)
	characterlist2 = CharacterRelationship.objects.filter(character2__name = character.name)

	return (characterlist1,characterlist2)

def CharacterDetailView(request, slug):
    character = get_object_or_404(Character, slug=slug)

    relatedobjectsbytags = getRelatedByTags(character)


    relatedcharacters = getCharacterRelations(character)
    return render_to_response('web/character_detail.html', {
            "object": character, "relatedcharacters1":relatedcharacters[0],"relatedcharacters2":relatedcharacters[1],"relatedobjectsbytags":relatedobjectsbytags,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL},context_instance=RequestContext(request))

def CharacterSectionView(request):
    objects = Character.objects.all()[:3]
    highlightedresult = Character.objects.filter(highlight=True).order_by('?')[0]

    characterSectionView_dict = {}
    locations_options = {'locations':Location.objects.all()}
    character_options = {"ALIGN_CHOICES":ALIGN_CHOICES, "PROFESSION_CHOICES":PROFESSION_CHOICES, "SPECIES_CHOICES":SPECIES_CHOICES, "LEVEL_CHOICES":LEVEL_CHOICES}
    range_options = {"lownum":range(1,11),"highnum":range(1,26)}


    characterSectionView_dict.update(character_options)
    characterSectionView_dict.update(locations_options)
    characterSectionView_dict.update(range_options)
    characterSectionView_dict.update({'results':objects,'highlightedresult':highlightedresult,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL})

    return render_to_response("web/character_section.html",characterSectionView_dict)


def CharacterListingView(request):
    allobjects = Character.objects.all()

    paginator = Paginator(allobjects, 10) # Show 10 contacts per page

    page = request.GET.get('page')
    try:
        objects = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        objects = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        objects = paginator.page(paginator.num_pages)

    #return render_to_response('list.html', {"contacts": contacts})


    return render_to_response("web/character_listing.html",{'results':objects})

def getCreatureRelations(creature):

	creaturelist1 = CreatureRelationship.objects.filter(creature1__name = creature.name)
	creaturelist2 = CreatureRelationship.objects.filter(creature2__name = creature.name)

	return (creaturelist1,creaturelist2)

def CreatureDetailView(request, slug):
    creature = get_object_or_404(Creature, slug=slug)


    relatedobjectsbytags = getRelatedByTags(creature)


    relatedcreatures = getCreatureRelations(creature)
    return render_to_response('web/creature_detail.html', {
            "object": creature, "relatedcreatures1":relatedcreatures[0],"relatedcreatures2":relatedcreatures[1],"relatedobjectsbytags":relatedobjectsbytags,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL,
    },context_instance=RequestContext(request))

def CreatureSectionView(request):
    objects = Creature.objects.all()[:3]
    highlightedresult = Creature.objects.filter(highlight=True).order_by('?')[0]

    creatureSectionView_dict = {}
    locations_options = {'locations':Location.objects.all()}
    creature_options = {"CRE_ALIGN_CHOICES":CRE_ALIGN_CHOICES}
    range_options = {"lownum":range(1,11),"highnum":range(1,26)}


    creatureSectionView_dict.update(creature_options)
    creatureSectionView_dict.update(locations_options)
    creatureSectionView_dict.update(range_options)

    creatureSectionView_dict.update({'results':objects,'highlightedresult':highlightedresult,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL})

    return render_to_response("web/creature_section.html",creatureSectionView_dict)


def CreatureListingView(request):
    allobjects = Creature.objects.all()

    paginator = Paginator(allobjects, 10) # Show 10 contacts per page

    page = request.GET.get('page')
    try:
        objects = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        objects = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        objects = paginator.page(paginator.num_pages)

    #return render_to_response('list.html', {"contacts": contacts})


    return render_to_response("web/creature_listing.html",{'results':objects})

def LocationSectionView(request):
    objects = Location.objects.all()[:3]
    highlightedresult = Location.objects.filter(highlight=True).order_by('?')[0]

    locationSectionView_dict = {}
    locations_options = {'locations':Location.objects.all()}
    location_options = {"LOC_STATUS_CHOICES":LOC_STATUS_CHOICES,"ALIGN_CHOICES":ALIGN_CHOICES,"LOC_TYPE_CHOICES":LOC_TYPE_CHOICES}
    range_options = {"lownum":range(1,11),"highnum":range(1,26)}


    locationSectionView_dict.update(location_options)
    locationSectionView_dict.update(locations_options)
    locationSectionView_dict.update(range_options)
    locationSectionView_dict.update({'results':objects,'highlightedresult':highlightedresult,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL})


    return render_to_response("web/location_section.html",locationSectionView_dict)


def LocationListingView(request):
    allobjects = Location.objects.all()

    paginator = Paginator(allobjects, 10) # Show 10 contacts per page

    page = request.GET.get('page')
    try:
        objects = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        objects = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        objects = paginator.page(paginator.num_pages)

    #return render_to_response('list.html', {"contacts": contacts})


    return render_to_response("web/location_listing.html",{'results':objects})

def ObjectSectionView(request):
    objects = Object.objects.all()[:3]
    highlightedresult = Object.objects.filter(highlight=True).order_by('?')[0]

    objectSectionView_dict = {}
    object_options = {"OBJ_STATUS_CHOICES":OBJ_STATUS_CHOICES,"ALIGN_CHOICES":ALIGN_CHOICES,"OBJ_RARITY_CHOICES":OBJ_RARITY_CHOICES,"OBJ_TYPE_CHOICES":OBJ_TYPE_CHOICES}
    range_options = {"lownum":range(1,11),"highnum":range(1,26)}


    objectSectionView_dict.update(object_options)
    objectSectionView_dict.update(range_options)
    objectSectionView_dict.update({'results':objects,'highlightedresult':highlightedresult,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL})

    return render_to_response("web/object_section.html",objectSectionView_dict)


def ObjectListingView(request):
    allobjects = Object.objects.all()

    paginator = Paginator(allobjects, 10) # Show 10 contacts per page

    page = request.GET.get('page')
    try:
        objects = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        objects = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        objects = paginator.page(paginator.num_pages)

    #return render_to_response('list.html', {"contacts": contacts})


    return render_to_response("web/object_listing.html",{'results':objects})

def AdventureSectionView(request):
    objects = Adventure.objects.all()[:3]
    highlightedresult = Adventure.objects.filter(highlight=True).order_by('?')[0]

    adventureSectionView_dict = {}

    adventure_options = {"PRICE_RANGES":PRICE_RANGES}
    range_options = {"lownum":range(1,11),"highnum":range(1,26)}
    adventures_options = {'adventures':Adventure.objects.all()}

    adventureSectionView_dict.update(adventure_options)
    adventureSectionView_dict.update(range_options)
    adventureSectionView_dict.update(adventures_options)

    adventureSectionView_dict.update({'results':objects,'highlightedresult':highlightedresult,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL})

    return render_to_response("web/adventure_section.html",adventureSectionView_dict)

def AdventureListingView(request):
    allobjects = Adventure.objects.all()

    paginator = Paginator(allobjects, 10) # Show 10 contacts per page

    page = request.GET.get('page')
    try:
        objects = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        objects = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        objects = paginator.page(paginator.num_pages)

    #return render_to_response('list.html', {"contacts": contacts})


    return render_to_response("web/adventure_listing.html",{'results':objects})


def ChronicleSectionView(request):
    objects = Chronicle.objects.all()[:3]
    highlightedresult = Chronicle.objects.filter(highlight=True).order_by('?')[0]

    chronicleSectionView_dict = {}
    range_options = {"lownum":range(1,11),"highnum":range(1,26)}
    adventures_options = {'adventures':Adventure.objects.all()}

    chronicleSectionView_dict.update(range_options)
    chronicleSectionView_dict.update(adventures_options)

    chronicleSectionView_dict.update({'results':objects,'highlightedresult':highlightedresult,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL})

    return render_to_response("web/chronicle_section.html",chronicleSectionView_dict)

def ChronicleListingView(request):
    allobjects = Chronicle.objects.all()

    paginator = Paginator(allobjects, 10) # Show 10 contacts per page

    page = request.GET.get('page')
    try:
        objects = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        objects = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        objects = paginator.page(paginator.num_pages)

    #return render_to_response('list.html', {"contacts": contacts})


    return render_to_response("web/chronicle_listing.html",{'results':objects})

def getRelatedByTags(anObject):

    char_related_by_tags = Character.objects.filter(tags__name__in=anObject.tags.values_list('name',flat=True)).exclude(id=anObject.id).distinct()
    obj_related_by_tags = Object.objects.filter(tags__name__in=anObject.tags.values_list('name',flat=True)).exclude(id=anObject.id).distinct()
    adv_related_by_tags = Adventure.objects.filter(tags__name__in=anObject.tags.values_list('name',flat=True)).exclude(id=anObject.id).distinct()
    loc_related_by_tags = Location.objects.filter(tags__name__in=anObject.tags.values_list('name',flat=True)).exclude(id=anObject.id).distinct()
    chr_related_by_tags = Chronicle.objects.filter(tags__name__in=anObject.tags.values_list('name',flat=True)).exclude(id=anObject.id).distinct()

    relatedobjects = {"characters":char_related_by_tags,"objects":obj_related_by_tags,"adventures":adv_related_by_tags,"locations":loc_related_by_tags, "chronicles":chr_related_by_tags}
    return relatedobjects

def LocationDetailView(request, slug):
    location = get_object_or_404(Location, slug=slug)


    relatedobjectsbytags = getRelatedByTags(location)

    charlocs = CharacterLocationRelationship.objects.filter(location__name = location.name).order_by('relation')
    oc = [o.character for o in charlocs]
    location.orderedchars = oc



    return render_to_response('web/location_detail.html', {
            "object": location, "relatedobjectsbytags":relatedobjectsbytags,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL,
    },context_instance=RequestContext(request))


def AdventureDetailView(request, slug):
    adventure = get_object_or_404(Adventure, slug=slug)


    relatedobjectsbytags = getRelatedByTags(adventure)

    return render_to_response('web/adventure_detail.html', {
            "object": adventure, "relatedobjectsbytags":relatedobjectsbytags,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL,
    },context_instance=RequestContext(request))


def ChronicleDetailView(request, slug):
    chronicle = get_object_or_404(Chronicle, slug=slug)


    relatedobjectsbytags = getRelatedByTags(chronicle)

    return render_to_response('web/chronicle_detail.html', {
            "object": chronicle, "relatedobjectsbytags":relatedobjectsbytags,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL,
    },context_instance=RequestContext(request))


def getObjectRelations(anObject):

	objectlist1 = ObjectRelationship.objects.filter(object1__name = anObject.name)
	objectlist2 = ObjectRelationship.objects.filter(object2__name = anObject.name)

	return (objectlist1,objectlist2)


def ObjectDetailView(request, slug):
    obj = get_object_or_404(Object, slug=slug)

    relatedobjectsbytags = getRelatedByTags(obj)
    relatedobjects = getObjectRelations(obj)

    return render_to_response("web/object_detail.html",{"object":obj, "relatedobjectsbytags":relatedobjectsbytags,"relatedobjects1":relatedobjects[0],"relatedobjects2":relatedobjects[1], 'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL,},context_instance=RequestContext(request))

def SearchRedirectView(request):

    searchfilter = request.GET.get('option')
    searchterm = request.GET.get('searchterm')

    return HttpResponseRedirect("/search/%s/%s"%(searchfilter, searchterm))


def SimpleSearchView(request, searchfilter, searchterm="", canonlvl="ALL"):
    if searchterm in ["ALL","NEW","AP","APC","C"]: searchterm=""

    if searchterm!="": keywords = split_query_into_keywords(searchterm)
    else: keywords = []
    results = []
    allobjects = {}

    if searchfilter == 'object' and canonlvl=="ALL":
        allobjects[searchfilter] = Object.objects.all()
    elif searchfilter == 'object' and canonlvl!="ALL":
        allobjects[searchfilter] = Object.objects.filter(canon_level=canonlvl)

    elif searchfilter == 'character' and canonlvl=="ALL":
        allobjects[searchfilter] = Character.objects.all()
    elif searchfilter == 'character' and canonlvl!="ALL":
        allobjects[searchfilter] = Character.objects.filter(canon_level=canonlvl)

    elif searchfilter == 'creature'  and canonlvl=="ALL":
        allobjects[searchfilter] = Creature.objects.all()
    elif searchfilter == 'creature'  and canonlvl!="ALL":
        allobjects[searchfilter] = Creature.objects.filter(canon_level=canonlvl)

    elif searchfilter == 'chronicle' and canonlvl=="ALL":
        allobjects[searchfilter] = Chronicle.objects.all()
    elif searchfilter == 'chronicle' and canonlvl!="ALL":
        allobjects[searchfilter] = Chronicle.objects.filter(canon_level=canonlvl)

    elif searchfilter == 'adventure' and canonlvl=="ALL":
        allobjects[searchfilter] = Adventure.objects.all()
    elif searchfilter == 'adventure' and canonlvl!="ALL":
        allobjects[searchfilter] = Adventure.objects.filter(canon_level=canonlvl)

    elif searchfilter == 'location' and canonlvl=="ALL":
        allobjects[searchfilter] = Location.objects.all()
    elif searchfilter == 'location'  and canonlvl!="ALL":
        allobjects[searchfilter] = Location.objects.filter(canon_level=canonlvl)


    else:
        if canonlvl=="ALL":
            allobjects = {'object':Object.objects.all(),'character':Character.objects.all(),'creature':Creature.objects.all(),'chronicle':Chronicle.objects.all(),'adventure':Adventure.objects.all(),'location':Location.objects.all()}
        else:
            allobjects = {'object':Object.objects.filter(canon_level=canonlvl),'character':Character.objects.filter(canon_level=canonlvl),'creature':Creature.objects.filter(canon_level=canonlvl),'chronicle':Chronicle.objects.filter(canon_level=canonlvl),'adventure':Adventure.objects.filter(canon_level=canonlvl),'location':Location.objects.filter(canon_level=canonlvl)}



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
    else: sresults = allobjects.items()

    object_list = sresults
    paginator = Paginator(object_list, 10) # Show 10 contacts per page

    page = request.GET.get('page')
    try:
        objects = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        objects = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        objects = paginator.page(paginator.num_pages)

    #return render_to_response('list.html', {"contacts": contacts})


    return render_to_response("web/listado.html",{'keywords':keywords,'results':objects})


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


def AdvancedSearchView(request):
    choices_dict = {}
    locations_options = {'locations':Location.objects.all()}
    character_options = {"ALIGN_CHOICES":ALIGN_CHOICES, "PROFESSION_CHOICES":PROFESSION_CHOICES, "SPECIES_CHOICES":SPECIES_CHOICES, "LEVEL_CHOICES":LEVEL_CHOICES}
    creature_options = {"CRE_ALIGN_CHOICES":CRE_ALIGN_CHOICES}
    location_options = {"LOC_STATUS_CHOICES":LOC_STATUS_CHOICES,"ALIGN_CHOICES":ALIGN_CHOICES,"LOC_TYPE_CHOICES":LOC_TYPE_CHOICES}
    object_options = {"OBJ_STATUS_CHOICES":OBJ_STATUS_CHOICES,"ALIGN_CHOICES":ALIGN_CHOICES,"OBJ_RARITY_CHOICES":OBJ_RARITY_CHOICES,"OBJ_TYPE_CHOICES":OBJ_TYPE_CHOICES}
    adventure_options = {"PRICE_RANGES":PRICE_RANGES}
    range_options = {"lownum":range(1,11),"highnum":range(1,26)}
    adventures_options = {'adventures':Adventure.objects.all()}


    choices_dict.update(character_options)
    choices_dict.update(creature_options)
    choices_dict.update(location_options)
    choices_dict.update(object_options)
    choices_dict.update(locations_options)
    choices_dict.update(adventure_options)
    choices_dict.update(range_options)
    choices_dict.update(adventures_options)
    return render_to_response("web/advanced-search.html", choices_dict)


def ResultsAdvancedSearchView(request):

    from itertools import chain

    #searchfilter = request.GET.get('option') #HERE WE WILL KNOW THE SPECIFIC OBJECT TYPE
    searchterm = request.GET.get('searchterm') #FIXME cuando null
    keywords = split_query_into_keywords(searchterm) or []
    objects = Location.objects.all()
    objecttype = request.GET.get('option') #FIXME cuando null
    objectcanon = request.GET.get('canon_level') #FIXME cuando null


    if objecttype == 'ALL':

        if objectcanon=="ALL":

            objects = sorted(
            chain(Object.objects.all() , Character.objects.all() , Creature.objects.all() , Chronicle.objects.all() , Adventure.objects.all() , Location.objects.all()),key=lambda instance: instance.last_updated)
            objects.reverse()
        else:

            objects = sorted(
            chain(Object.objects.filter(canon_level=objectcanon) , Character.objects.filter(canon_level=objectcanon) , Creature.objects.filter(canon_level=objectcanon) , Chronicle.objects.filter(canon_level=objectcanon) , Adventure.objects.filter(canon_level=objectcanon) , Location.objects.filter(canon_level=objectcanon)),key=lambda instance: instance.last_updated)

        if len(keywords) != 0:
            results = []
            for ob in objects:
                ks = 0
                for keyword in keywords:
                    if keyword.lower() in ob.searchText().lower():#.split(" "):
                        ks+=5
                        ks+=ob.searchText().lower().count(keyword.lower())

                    if ks>0:
                        if ob in results:
                            ob.hits += ks
                        else:
                            ob.hits = ks
                            if type(ob)==type(Character()):
                                objecttype="character"
                            elif type(ob)==type(Creature()):
                                objecttype="creature"
                            elif type(ob)==type(Location()):
                                objecttype="location"
                            elif type(ob)==type(Object()):
                                objecttype="object"
                            elif type(ob)==type(Chronicle()):
                                objecttype="chronicle"
                            elif type(ob)==type(Adventure()):
                                objecttype="adventure"
                            ob.objecttype = objecttype
                            results.append(ob)

        else:
            results = []
            for ob in objects:
                 if type(ob)==type(Character()):
                            objecttype="character"
                 elif type(ob)==type(Creature()):
                            objecttype="creature"
                 elif type(ob)==type(Location()):
                            objecttype="location"
                 elif type(ob)==type(Object()):
                            objecttype="object"
                 elif type(ob)==type(Chronicle()):
                            objecttype="chronicle"
                 elif type(ob)==type(Adventure()):
                            objecttype="adventure"
                 ob.objecttype = objecttype
                 results.append(ob)




        return render_to_response("web/listado.html",{'objecttype':'none','keywords':keywords,'results':results})


    if objecttype == 'chronicle':

        chr_adventure = request.GET.get('chr_adventure') or None

        objects = Chronicle.objects.all()

        if chr_adventure!="ALL" and chr_adventure:
            objects = objects.filter(adventure=chr_adventure)

        if objectcanon!="ALL" and objectcanon:
            objects = objects.filter(canon_level=objectcanon)

#        for f,ft in filterdict.items():
#            if ft!=None: objects = objects.filter(f=ft)

        if len(keywords) != 0:
            results = []
            for ob in objects:
                ks = 0
                for keyword in keywords:
                    if keyword.lower() in ob.searchText().lower():#.split(" "):
                        ks+=5
                        ks+=ob.searchText().lower().count(keyword.lower())

                    if ks>0:
                        if ob in results:
                            ob.hits += ks
                        else:
                            ob.hits = ks
                            ob.objecttype = objecttype
                            results.append(ob)

        else: results = objects


    if objecttype == 'adventure':

        adv_level = request.GET.get('adv_level') or None
        adv_numplayers = request.GET.get('adv_numplayers') or None
        adv_price = request.GET.get('adv_price') or None
        adv_numsessions = request.GET.get('adv_numsessions') or None

        objects = Adventure.objects.all()

        if adv_level!="ALL" and adv_level:
            objects = objects.filter(minlevel__lte=adv_level).filter(maxlevel__gte=adv_level)

        if adv_numplayers!="ALL" and adv_numplayers:
            objects = objects.filter(minnumplayers__lte=adv_numplayers).filter(maxnumplayers__gte=adv_numplayers)
        if adv_price!="ALL" and adv_price:
            objects = objects.filter(price=adv_price)
        if adv_numsessions!="ALL" and adv_numsessions:
            objects = objects.filter(sessions=adv_numsessions)


        if objectcanon!="ALL" and objectcanon:
            objects = objects.filter(canon_level=objectcanon)

#        for f,ft in filterdict.items():
#            if ft!=None: objects = objects.filter(f=ft)

        if len(keywords) != 0:
            results = []
            for ob in objects:
                ks = 0
                for keyword in keywords:
                    if keyword.lower() in ob.searchText().lower():#.split(" "):
                        ks+=5
                        ks+=ob.searchText().lower().count(keyword.lower())

                    if ks>0:
                        if ob in results:
                            ob.hits += ks
                        else:
                            ob.hits = ks
                            ob.objecttype = objecttype
                            results.append(ob)

        else: results = objects


    if objecttype == 'object':

        obj_type = request.GET.get('obj_type') or None
        obj_rarity = request.GET.get('obj_rarity') or None
        obj_status = request.GET.get('obj_status') or None
        obj_alignment = request.GET.get('obj_alignment') or None
        obj_location = request.GET.get('obj_location') or None


        objects = Object.objects.all()

        if obj_type!="ALL" and obj_type:
            objects = objects.filter(objtype=obj_type)
        if obj_rarity!="ALL" and obj_rarity:
            objects = objects.filter(rarity=obj_rarity)
        if obj_status!="ALL" and obj_status:
            objects = objects.filter(status=obj_status)
        if obj_alignment!="ALL" and obj_alignment:
            objects = objects.filter(alignment=obj_alignment)
        if obj_location!="ALL" and obj_location:
            objects = objects.filter(relatedlocation=obj_location)

        if objectcanon!="ALL" and objectcanon:
            objects = objects.filter(canon_level=objectcanon)

#        for f,ft in filterdict.items():
#            if ft!=None: objects = objects.filter(f=ft)

        if len(keywords) != 0:
            results = []
            for ob in objects:
                ks = 0
                for keyword in keywords:
                    if keyword.lower() in ob.searchText().lower():#.split(" "):
                        ks+=5
                        ks+=ob.searchText().lower().count(keyword.lower())

                    if ks>0:
                        if ob in results:
                            ob.hits += ks
                        else:
                            ob.hits = ks
                            ob.objecttype = objecttype
                            results.append(ob)

        else: results = objects

    if objecttype == 'creature':

        crea_ac = request.GET.get('crea_ac') or None
        crea_minpx = request.GET.get('crea_minpx') or None
        crea_hitdice = request.GET.get('crea_hitdice') or None
        crea_alignment = request.GET.get('crea_alignment') or None
        crea_location = request.GET.get('crea_location') or None


        objects = Creature.objects.all()

        if crea_ac!="ALL" and crea_ac:
            objects = objects.filter(AC__icontains=crea_ac)
        if crea_hitdice!="ALL" and crea_hitdice:
            objects = objects.filter(hitdice__icontains=crea_hitdice)
        if crea_minpx!="ALL" and crea_minpx:
            objects = objects.filter(XPvalue__gte=crea_minpx)
        if crea_alignment!="ALL" and crea_alignment:
            objects = objects.filter(alignment__icontains=crea_alignment)
        if crea_location!="ALL" and crea_location:
            objects = objects.filter(relatedlocation=crea_location)

        if objectcanon!="ALL" and objectcanon:
            objects = objects.filter(canon_level=objectcanon)

#        for f,ft in filterdict.items():
#            if ft!=None: objects = objects.filter(f=ft)

        if len(keywords) != 0:
            results = []
            for ob in objects:
                ks = 0
                for keyword in keywords:
                    if keyword.lower() in ob.searchText().lower():#.split(" "):
                        ks+=5
                        ks+=ob.searchText().lower().count(keyword.lower())

                    if ks>0:
                        if ob in results:
                            ob.hits += ks
                        else:
                            ob.hits = ks
                            ob.objecttype = objecttype
                            results.append(ob)

        else: results = objects



    if objecttype == 'character':

        char_species = request.GET.get('char_species') or None
        char_minlevel = request.GET.get('char_minlevel') or None
        char_profession = request.GET.get('char_profession') or None
        char_alignment = request.GET.get('char_alignment') or None
        char_location = request.GET.get('char_location') or None

        filterdict = {'specie':char_species,'level':char_minlevel,'alignment':char_alignment, 'profession':char_profession, 'location':char_location}


        objects = Character.objects.all()

        if char_species!="ALL" and char_species:
            objects = objects.filter(species=char_species)
        if char_minlevel!="ALL" and char_minlevel:
            objects = objects.filter(level__gte=char_minlevel)
        if char_profession!="ALL" and char_profession:
            objects = objects.filter(profession=char_profession)
        if char_alignment!="ALL" and char_alignment:
            objects = objects.filter(alignment=char_alignment)
        if char_location!="ALL" and char_location:
            objects = objects.filter(relatedlocation=char_location)

        if objectcanon!="ALL" and objectcanon:
            objects = objects.filter(canon_level=objectcanon)

#        for f,ft in filterdict.items():
#            if ft!=None: objects = objects.filter(f=ft)

        if len(keywords) != 0:
            results = []
            for ob in objects:
                ks = 0
                for keyword in keywords:
                    if keyword.lower() in ob.searchText().lower():#.split(" "):
                        ks+=5
                        ks+=ob.searchText().lower().count(keyword.lower())

                    if ks>0:
                        if ob in results:
                            ob.hits += ks
                        else:
                            ob.hits = ks
                            ob.objecttype = objecttype
                            results.append(ob)

        else: results = objects


    if objecttype == 'location':


        loc_type = request.GET.get('loc_type') or None
        loc_status = request.GET.get('loc_status') or None
        loc_alignment = request.GET.get('loc_alignment') or None

        filterdict = {'loctype':loc_type,'status':loc_status,'alignment':loc_alignment}


        objects = Location.objects.all()

        if loc_type!="ALL" and loc_type:
            objects = objects.filter(loctype=loc_type)
        if loc_status!="ALL" and loc_status:
            objects = objects.filter(status=loc_status)
        if loc_alignment!="ALL" and loc_alignment:
            objects = objects.filter(alignment=loc_alignment)

        if objectcanon!="ALL" and objectcanon:
            objects = objects.filter(canon_level=objectcanon)

#        for f,ft in filterdict.items():
#            if ft!=None: objects = objects.filter(f=ft)

        if len(keywords) != 0:
            results = []
            for ob in objects:
                ks = 0
                for keyword in keywords:
                    if keyword.lower() in ob.searchText().lower():#.split(" "):
                        ks+=5
                        ks+=ob.searchText().lower().count(keyword.lower())

                    if ks>0:
                        if ob in results:
                            ob.hits += ks
                        else:
                            ob.hits = ks
                            ob.objecttype = objecttype
                            results.append(ob)

        else: results = objects



    return render_to_response("web/advancedlisting.html",{'objecttype':objecttype,'keywords':keywords,'results':results})



