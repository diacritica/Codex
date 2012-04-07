# -*- coding: utf-8 -*-
# Create your views here.

from django.shortcuts import render_to_response, get_object_or_404

from codex.web.models import *

from django.utils.translation import ugettext_lazy as _

from codex.settings import MEDIA_URL, STATIC_URL

from decimal import *

from django.template import RequestContext

from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from searchviews import *

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
    return render_to_response('web/index.html', {'index_list': index_list})

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

