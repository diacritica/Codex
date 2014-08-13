# -*- coding: utf-8 -*-
# Create your views here.

from django.shortcuts import render_to_response, get_object_or_404
from django.http import Http404

from codex.web.models import *
from codex.web.modelschoices import *

from django.utils.translation import ugettext_lazy as _

from codex.settings import MEDIA_URL, STATIC_URL

from decimal import *

from django.template import RequestContext
from django.core.context_processors import csrf

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

def DiceGeneratorView(request):

    return render_to_response('web/dice-generator.html',{})


def SendinfoView(request):

    return render_to_response('web/sendinfo.html',{})

def SendAdventureView(request):
    c = {}
    c.update(csrf(request))
    adventure_options = {"PRICE_RANGES":mc.PRICE_RANGES}
    c.update(adventure_options)

    # Get all authors to check if the author already exists
    authors = Author.objects.all().order_by('-name')
    c['authors'] = authors

    return render_to_response('web/send-info-adventure.html', c)

def SendChronicleView(request):
    c = {}
    c.update(csrf(request))

    # Get all authors to check if the author already exists
    authors = Author.objects.all().order_by('-name')
    c['authors'] = authors
    # Get all adventures in the codex
    adventures = Adventure.objects.all().order_by('-name')
    c['adventures'] = adventures

    return render_to_response('web/send-info-chronicle.html', c)

def SendSpellView(request):
    c = {}
    c.update(csrf(request))

    # Get all authors to check if the author already exists
    authors = Author.objects.all().order_by('-name')
    c['authors'] = authors

    return render_to_response('web/send-info-spell.html', c)

def SendSuccess(request):
    return render_to_response('web/send-info-ok.html', {})

def SendFormView(request):
    print request.POST
    print request.FILES

        # for adventure
    if request.POST['entry_type'] == 'adventure':
        addNewAdventure(request)
    elif request.POST['entry_type'] == 'chronicle':
        addNewChronicle(request)
    return render_to_response('web/sendinfo.html',{})

def addAuthor(request, category = 'main'):
    if category == 'main':
        if request.POST['author_list'] == 0:
            try:
                existing = Author.objects.get(name=request.POST['author_name'])
                return existing
            except:
                name = request.POST['author_name']
                url = request.POST['author_url']
        else:
            return Author.objects.get(name=request.POST['author_list'])
    elif category == 'image':
        if request.POST['image_author_list'] == 0:
            try:
                existing = Author.objects.get(name=request.POST['image_author'])
                return existing
            except:
                name = request.POST['image_author']
                url = request.POST['image_author_url']
        else:
            return Author.objects.get(name=request.POST['image_author_list'])
    author = Author()
    author.name = name
    author.url = url
    author.save()
    print("author id", author.id)
    return author

def addAttachFile(request):
    try:
        attachfile = AttachFile()
        attachfile.name = request.FILES["file"].name
        attachfile.content = request.FILES["file"]
        attachfile.save()
        return attachfile
    except:
        return None

def addImage(request):
    try:
        image = Image()
        image.name = request.FILES["datafile"].name
        image.image = request.FILES["datafile"]
        img_author = addAuthor(request, 'image')
        image.save()
        image.author.add(img_author)
        image.save()
        return image
    except:
        return None

def addAdventure(request):
    # Add adventure to a chronicle
    if request.POST['adventure_list'] != 0:
        existing = Adventure.objects.get(name=request.POST['adventure_list'])
        return existing
    else:
        return None


def addNewAdventure(request):
    # Adv Author
    adv_author = addAuthor(request)
    # Image
    image = addImage(request)
    # Attachments
    attachfile = addAttachFile(request)

    adventure = Adventure()
    adventure.deactivated = True
    adventure.canon_level = 'NEW'
    adventure.name = request.POST['adv_name']
    adventure.description = request.POST['adv_description']
    adventure.comments = request.POST['adv_comments']
    adventure.price = request.POST['adv_price']
    adventure.sessions = request.POST['adv_sessions']
    adventure.minnumplayers = request.POST['adv_min_players']
    adventure.maxnumplayers = request.POST['adv_max_players']
    adventure.minlevel = request.POST['adv_min_level']
    adventure.maxlevel = request.POST['adv_max_level']
    adventure.maxlevel = request.POST['adv_max_level']
    adventure.url = request.POST['adv_url']
    adventure.save()
    adventure.author.add(adv_author)
    if image != None:
        adventure.image.add(image)
    if attachfile != None:
        adventure.attachments.add(attachfile)
    adventure.save()
    print 'Adventure added'

def addNewChronicle(request):
    # Chr Author
    chr_author = addAuthor(request)
    # Image
    image = addImage(request)
    # Adventure
    adventure = addAdventure(request)
    # Attachments
    attachfile = addAttachFile(request)

    chronicle = Chronicle()
    chronicle.deactivated = True
    chronicle.canon_level = 'NEW'
    chronicle.name = request.POST['chr_name']
    chronicle.description = request.POST['chr_description']
    chronicle.comments = request.POST['chr_comments']
    chronicle.url = request.POST['chr_url']
    chronicle.save()
    chronicle.author.add(chr_author)
    if adventure != None:
        chronicle.adventure.add(adventure)
    if image != None:
        chronicle.image.add(image)
    if attachfile != None:
        chronicle.attachments.add(attachfile)
    chronicle.save()


def IndexView(request):
    chars = Character.objects.exclude(deactivated=True).order_by('-last_updated')[:3]
    objects = Object.objects.exclude(deactivated=True).order_by('-last_updated')[:3]
    creatures = Creature.objects.exclude(deactivated=True).order_by('-last_updated')[:3]
    chronicles = Chronicle.objects.all().order_by('-last_updated')[:3]
    locations = Location.objects.exclude(deactivated=True).order_by('-last_updated')[:3]
    adventures = Adventure.objects.all().order_by('-last_updated')[:3]
    rules = Rule.objects.all().order_by('-last_updated')[:3]
    spells = Spell.objects.all().order_by('-last_updated')[:3]
    fanarts = Fanart.objects.all().order_by('-last_updated')[:3]

    index_list = {'characters':chars, 'objects':objects, 'creatures':creatures,\
     'chronicles':chronicles, 'locations':locations, 'adventures':adventures,\
     'rules':rules,'spells':spells,'fanarts':fanarts}
    return render_to_response('web/index.html', {'index_list': index_list,'MEDIA_URL':MEDIA_URL})

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

    if character.deactivated:
        raise Http404

    relatedobjectsbytags = getRelatedByTags(character)


    relatedcharacters = getCharacterRelations(character)
    return render_to_response('web/character_detail.html', {
            "object": character, "relatedcharacters1":relatedcharacters[0],"relatedcharacters2":relatedcharacters[1],"relatedobjectsbytags":relatedobjectsbytags,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL},context_instance=RequestContext(request))

def CharacterSectionView(request):
    objects = Character.objects.exclude(deactivated=True)[:3]
    try:
        highlightedresult = Character.objects.filter(highlight=True).order_by('?')[0]
    except:
        highlightedresult = None

    characterSectionView_dict = {}
    locations_options = {'locations':Location.objects.exclude(deactivated=True)}
    character_options = {"ALIGN_CHOICES":ALIGN_CHOICES, "PROFESSION_CHOICES":PROFESSION_CHOICES, "SPECIES_CHOICES":SPECIES_CHOICES, "LEVEL_CHOICES":LEVEL_CHOICES}
    range_options = {"lownum":range(1,11),"highnum":range(1,26)}


    characterSectionView_dict.update(character_options)
    characterSectionView_dict.update(locations_options)
    characterSectionView_dict.update(range_options)
    characterSectionView_dict.update({'results':objects,'highlightedresult':highlightedresult,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL})

    return render_to_response("web/character_section.html",characterSectionView_dict)


def CharacterListingView(request):
    allobjects = Character.objects.exclude(deactivated=True)

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

    if creature.deactivated:
        raise Http404


    relatedobjectsbytags = getRelatedByTags(creature)


    relatedcreatures = getCreatureRelations(creature)
    return render_to_response('web/creature_detail.html', {
            "object": creature, "relatedcreatures1":relatedcreatures[0],"relatedcreatures2":relatedcreatures[1],"relatedobjectsbytags":relatedobjectsbytags,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL,
    },context_instance=RequestContext(request))

def CreatureSectionView(request):
    objects = Creature.objects.exclude(deactivated=True)[:3]
    try:
        highlightedresult = Creature.objects.filter(highlight=True).order_by('?')[0]
    except:
        highlightedresult = None

    creatureSectionView_dict = {}
    locations_options = {'locations':Location.objects.exclude(deactivated=True)}
    creature_options = {"CRE_ALIGN_CHOICES":CRE_ALIGN_CHOICES}
    range_options = {"lownum":range(1,11),"highnum":range(1,26)}


    creatureSectionView_dict.update(creature_options)
    creatureSectionView_dict.update(locations_options)
    creatureSectionView_dict.update(range_options)

    creatureSectionView_dict.update({'results':objects,'highlightedresult':highlightedresult,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL})

    return render_to_response("web/creature_section.html",creatureSectionView_dict)


def CreatureListingView(request):
    allobjects = Creature.objects.exclude(deactivated=True)

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
    objects = Location.objects.exclude(deactivated=True)[:3]
    try:
        highlightedresult = Location.objects.filter(highlight=True).order_by('?')[0]
    except:
        highlightedresult = None

    locationSectionView_dict = {}
    locations_options = {'locations':Location.objects.exclude(deactivated=True)}
    location_options = {"LOC_STATUS_CHOICES":LOC_STATUS_CHOICES,"ALIGN_CHOICES":ALIGN_CHOICES,"LOC_TYPE_CHOICES":LOC_TYPE_CHOICES}
    range_options = {"lownum":range(1,11),"highnum":range(1,26)}


    locationSectionView_dict.update(location_options)
    locationSectionView_dict.update(locations_options)
    locationSectionView_dict.update(range_options)
    locationSectionView_dict.update({'results':objects,'highlightedresult':highlightedresult,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL})


    return render_to_response("web/location_section.html",locationSectionView_dict)


def LocationListingView(request):
    allobjects = Location.objects.exclude(deactivated=True)

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
    objects = Object.objects.exclude(deactivated=True)[:3]
    try:
        highlightedresult = Object.objects.filter(highlight=True).order_by('?')[0]
    except:
        highlightedresult = None

    objectSectionView_dict = {}
    object_options = {"OBJ_STATUS_CHOICES":OBJ_STATUS_CHOICES,"ALIGN_CHOICES":ALIGN_CHOICES,"OBJ_RARITY_CHOICES":OBJ_RARITY_CHOICES,"OBJ_TYPE_CHOICES":OBJ_TYPE_CHOICES}
    range_options = {"lownum":range(1,11),"highnum":range(1,26)}


    objectSectionView_dict.update(object_options)
    objectSectionView_dict.update(range_options)
    objectSectionView_dict.update({'results':objects,'highlightedresult':highlightedresult,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL})

    return render_to_response("web/object_section.html",objectSectionView_dict)


def ObjectListingView(request):
    allobjects = Object.objects.exclude(deactivated=True)

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
    #objects = Adventure.objects.all()[:3]
    objects = Adventure.objects.filter(deactivated = False)[:3]
    try:
        highlightedresult = Adventure.objects.filter(highlight=True).order_by('?')[0]
    except:
        highlightedresult = None
    adventureSectionView_dict = {}

    adventure_options = {"PRICE_RANGES":mc.PRICE_RANGES}
    range_options = {"lownum":range(1,11),"highnum":range(1,26)}
    adventures_options = {'adventures':Adventure.objects.all()}

    adventureSectionView_dict.update(adventure_options)
    adventureSectionView_dict.update(range_options)
    adventureSectionView_dict.update(adventures_options)

    adventureSectionView_dict.update({'results':objects,'highlightedresult':highlightedresult,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL})

    return render_to_response("web/adventure_section.html",adventureSectionView_dict)

def AdventureListingView(request):
    #allobjects = Adventure.objects.all()
    allobjects = Adventure.objects.filter(deactivated = False)

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
    try:
        highlightedresult = Chronicle.objects.filter(highlight=True).order_by('?')[0]
    except:
        highlightedresult = None

    chronicleSectionView_dict = {}
    range_options = {"lownum":range(1,11),"highnum":range(1,26)}
    #adventures_options = {'adventures':Adventure.objects.all()}
    adventures_options = {'adventures':Adventure.objects.filter(deactivated = False)}

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

    #FIXME for deactivated objects

    char_related_by_tags = Character.objects.filter(tags__name__in=anObject.tags.values_list('name',flat=True)).exclude(id=anObject.id).distinct()
    obj_related_by_tags = Object.objects.filter(tags__name__in=anObject.tags.values_list('name',flat=True)).exclude(id=anObject.id).distinct()
    adv_related_by_tags = Adventure.objects.filter(tags__name__in=anObject.tags.values_list('name',flat=True)).exclude(id=anObject.id).distinct()
    loc_related_by_tags = Location.objects.filter(tags__name__in=anObject.tags.values_list('name',flat=True)).exclude(id=anObject.id).distinct()
    chr_related_by_tags = Chronicle.objects.filter(tags__name__in=anObject.tags.values_list('name',flat=True)).exclude(id=anObject.id).distinct()
    fa_related_by_tags = Fanart.objects.filter(tags__name__in=anObject.tags.values_list('name',flat=True)).exclude(id=anObject.id).distinct()
    rul_related_by_tags = Rule.objects.filter(tags__name__in=anObject.tags.values_list('name',flat=True)).exclude(id=anObject.id).distinct()
    spe_related_by_tags = Spell.objects.filter(tags__name__in=anObject.tags.values_list('name',flat=True)).exclude(id=anObject.id).distinct()

    relatedobjects = {"characters":char_related_by_tags,"objects":obj_related_by_tags,"adventures":adv_related_by_tags,"locations":loc_related_by_tags, "chronicles":chr_related_by_tags,"fanarts":fa_related_by_tags,"rules":rul_related_by_tags,"spells":spe_related_by_tags}
    return relatedobjects

def LocationDetailView(request, slug):
    location = get_object_or_404(Location, slug=slug)

    if location.deactivated:
        raise Http404


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


#--------------
def SpellListingView(request):
    allobjects = Spell.objects.all()

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


    return render_to_response("web/spell_listing.html",{'results':objects})

def SpellSectionView(request):
    objects = Spell.objects.all()[:3]
    try:
        highlightedresult = Spell.objects.filter(highlight=True).order_by('?')[0]
    except:
        highlightedresult = None
    range_options = {"lownum": range(1,11),"highnum": range(1,26)}
    spellSectionView_dict = {}
    spellSectionView_dict.update(range_options)

    spellSectionView_dict.update({'results':objects,'highlightedresult':highlightedresult,'affectedclasses':ClassRace.objects.all(),'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL})

    return render_to_response("web/spell_section.html",spellSectionView_dict)

def SpellDetailView(request, slug):
    rule = get_object_or_404(Spell, slug=slug)
    relatedobjectsbytags = getRelatedByTags(rule)

    return render_to_response('web/spell_detail.html', {
            "object": rule, "relatedobjectsbytags":relatedobjectsbytags,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL,
    },context_instance=RequestContext(request))

#------------

def RuleListingView(request):
    allobjects = Rule.objects.all()

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


    return render_to_response("web/rule_listing.html",{'results':objects})

def RuleSectionView(request):
    objects = Rule.objects.all()[:3]
    try:
      highlightedresult = Rule.objects.filter(highlight=True).order_by('?')[0]
    except:
      highlightedresult = None
    ruleSectionView_dict = {}

    ruleSectionView_dict.update({'results':objects,'highlightedresult':highlightedresult,'rulesections':RuleSection.objects.all(),'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL})

    return render_to_response("web/rule_section.html",ruleSectionView_dict)

def RuleDetailView(request, slug):
    rule = get_object_or_404(Rule, slug=slug)


    relatedobjectsbytags = getRelatedByTags(rule)

    return render_to_response('web/rule_detail.html', {
            "object": rule, "relatedobjectsbytags":relatedobjectsbytags,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL,
    },context_instance=RequestContext(request))

def FanartListingView(request):
    allobjects = Fanart.objects.all()

    paginator = Paginator(allobjects, 12) # Show 12 contacts per page

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


    return render_to_response("web/fanart_listing.html",{'results':objects,'MEDIA_URL':MEDIA_URL})

def FanartDetailView(request, slug):
    fanart = get_object_or_404(Fanart, slug=slug)


    relatedobjectsbytags = getRelatedByTags(fanart)

    return render_to_response('web/fanart_detail.html', {
            "object": fanart, "relatedobjectsbytags":relatedobjectsbytags,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL,
    },context_instance=RequestContext(request))

def FanartSectionView(request):
    objects = Fanart.objects.all()[:3]
    try:
        highlightedresult = Fanart.objects.filter(highlight=True).order_by('?')[0]
    except:
        highlightedresult = None
    fanartSectionView_dict = {}


    fanart_options = {'fanarts':Fanart.objects.all(),"FANART_LICENSE_CHOICES":FANART_LICENSE_CHOICES,\
    "FANART_CATEGORY_CHOICES":FANART_CATEGORY_CHOICES,\
    "FANART_TYPE_CHOICES":FANART_TYPE_CHOICES}

    fanart_authors = {'fanart_authors':Author.objects.all()}

    fanartSectionView_dict.update(fanart_options)
    fanartSectionView_dict.update(fanart_authors)
    fanartSectionView_dict.update({'results':objects,'highlightedresult':highlightedresult,'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL})


    return render_to_response("web/fanart_section.html",fanartSectionView_dict)


def getObjectRelations(anObject):

	objectlist1 = ObjectRelationship.objects.filter(object1__name = anObject.name)
	objectlist2 = ObjectRelationship.objects.filter(object2__name = anObject.name)

	return (objectlist1,objectlist2)


def ObjectDetailView(request, slug):
    obj = get_object_or_404(Object, slug=slug)

    if obj.deactivated:
        raise Http404


    relatedobjectsbytags = getRelatedByTags(obj)
    relatedobjects = getObjectRelations(obj)

    return render_to_response("web/object_detail.html",{"object":obj, "relatedobjectsbytags":relatedobjectsbytags,"relatedobjects1":relatedobjects[0],"relatedobjects2":relatedobjects[1], 'MEDIA_URL':MEDIA_URL,'STATIC_URL':STATIC_URL,},context_instance=RequestContext(request))
