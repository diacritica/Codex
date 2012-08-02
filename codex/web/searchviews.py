# -*- coding: utf-8 *-*
from django.http import HttpResponseRedirect

from codex.web.models import *

import tools.stopwords
import re
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render_to_response

m = __import__("web")


def SearchRedirectView(request):

    searchfilter = request.GET.get('option')
    searchterm = request.GET.get('searchterm')

    return HttpResponseRedirect("/search/%s/%s" % (searchfilter, searchterm))


def SimpleSearchView(request, searchfilter="", searchterm=""):

<<<<<<< HEAD
    validsearchfilters = ["object","location","character","creature","adventure","chronicle"]
=======
    validsearchfilters = ["object","location","character","creature","adventure","chronicle","rule", "spell",]
>>>>>>> newcats

    results = []
    allobjects = {}


    if searchfilter in validsearchfilters:

        allobjects[searchfilter] = getattr(m.models,searchfilter.capitalize()).objects.all()

<<<<<<< HEAD
    elif searchfilter == "all":

        allobjects = {'object':Object.objects.all(),'character':Character.objects.all(),'creature':Creature.objects.all(),'chronicle':Chronicle.objects.all(),'adventure':Adventure.objects.all(),'location':Location.objects.all()}
=======
    elif searchfilter == "fanart": allobjects["fanart"] = FanArt.objects.all() #OH PLEASE FIX THIS MESS!
    elif searchfilter == "all":

        allobjects = {'object':Object.objects.all(),'character':Character.objects.all(), \
        'creature':Creature.objects.all(),'chronicle':Chronicle.objects.all(), \
        'adventure':Adventure.objects.all(),'location':Location.objects.all(),'rule':Rule.objects.all(),\
        'spell':Spell.objects.all(),'fanart':FanArt.objects.all()}
>>>>>>> newcats


    if searchterm != "":
        keywords = split_query_into_keywords(searchterm)
    else:
        keywords = []


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
    locations_options = {'locations': Location.objects.all()}
    character_options = {"ALIGN_CHOICES": ALIGN_CHOICES, "PROFESSION_CHOICES":PROFESSION_CHOICES, "SPECIES_CHOICES":SPECIES_CHOICES, "LEVEL_CHOICES":LEVEL_CHOICES}
    creature_options = {"CRE_ALIGN_CHOICES": CRE_ALIGN_CHOICES}
    location_options = {"LOC_STATUS_CHOICES": LOC_STATUS_CHOICES,"ALIGN_CHOICES":ALIGN_CHOICES,"LOC_TYPE_CHOICES":LOC_TYPE_CHOICES}
    object_options = {"OBJ_STATUS_CHOICES": OBJ_STATUS_CHOICES,"ALIGN_CHOICES":ALIGN_CHOICES,"OBJ_RARITY_CHOICES":OBJ_RARITY_CHOICES,"OBJ_TYPE_CHOICES":OBJ_TYPE_CHOICES}
    adventure_options = {"PRICE_RANGES": PRICE_RANGES}
    range_options = {"lownum": range(1,11),"highnum": range(1,26)}
    adventures_options = {'adventures':Adventure.objects.all()}
    rules_options = {'rulesections':RuleSection.objects.all()}
    spell_options = {'classraces':ClassRace.objects.all()}
    fanart_options = {'fanart_authors':Author.objects.all(),"FANART_LICENSE_CHOICES":FANART_LICENSE_CHOICES,\
    "FANART_CATEGORY_CHOICES":FANART_CATEGORY_CHOICES, "FANART_TYPE_CHOICES":FANART_TYPE_CHOICES}

    choices_dict.update(character_options)
    choices_dict.update(creature_options)
    choices_dict.update(location_options)
    choices_dict.update(object_options)
    choices_dict.update(locations_options)
    choices_dict.update(adventure_options)
    choices_dict.update(range_options)
    choices_dict.update(adventures_options)
    choices_dict.update(rules_options)
    choices_dict.update(spell_options)
    choices_dict.update(fanart_options)

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
<<<<<<< HEAD
            chain(Object.objects.all() , Character.objects.all() , Creature.objects.all() , Chronicle.objects.all() , Adventure.objects.all() , Location.objects.all()),key=lambda instance: instance.last_updated)
=======
            chain(Object.objects.all() , Character.objects.all() , Creature.objects.all() , Chronicle.objects.all() , Adventure.objects.all() , Location.objects.all(), Rule.objects.all(), FanArt.objects.all()), key=lambda instance: instance.last_updated)
>>>>>>> newcats
            objects.reverse()
        else:

            objects = sorted(
<<<<<<< HEAD
            chain(Object.objects.filter(canon_level=objectcanon) , Character.objects.filter(canon_level=objectcanon) , Creature.objects.filter(canon_level=objectcanon) , Chronicle.objects.filter(canon_level=objectcanon) , Adventure.objects.filter(canon_level=objectcanon) , Location.objects.filter(canon_level=objectcanon)),key=lambda instance: instance.last_updated)
=======
            chain(Object.objects.filter(canon_level=objectcanon) , Character.objects.filter(canon_level=objectcanon) , Creature.objects.filter(canon_level=objectcanon) , Chronicle.objects.filter(canon_level=objectcanon) , Adventure.objects.filter(canon_level=objectcanon) , Location.objects.filter(canon_level=objectcanon),Rule.objects.filter(canon_level=objectcanon),FanArt.objects.filter(canon_level=objectcanon)),key=lambda instance: instance.last_updated)
>>>>>>> newcats

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
                            elif type(ob)==type(Rule()):
                                objecttype="rule"
                            elif type(ob)==type(Spell()):
                                objecttype="spell"
                            elif type(ob)==type(FanArt()):
                                objecttype="fanart"
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
                 elif type(ob)==type(Rule()):
                            objecttype="rule"
                 elif type(ob)==type(Spell()):
                            objecttype="spell"
                 elif type(ob)==type(FanArt()):
                            objecttype="fanart"
                 ob.objecttype = objecttype
                 results.append(ob)




        return render_to_response("web/listado.html",{'objecttype':'none','keywords':keywords,'results':results})

    if objecttype == 'fanart':


        chosencategory = request.GET.get('chosencategory') or None
        chosentype = request.GET.get('chosentype') or None
        chosenlicense = request.GET.get('chosenlicense') or None
        author = request.GET.get('author') or None

        objects = FanArt.objects.all()

        if chosencategory!="ALL" and chosencategory:
            objects = objects.filter(chosencategory=chosencategory)
        if chosentype!="ALL" and chosentype:
            objects = objects.filter(chosentype=chosentype)
        if chosenlicense!="ALL" and chosenlicense:
            objects = objects.filter(chosenlicense=chosenlicense)
        if author!="ALL" and author:
            objects = objects.filter(author=author)


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

    if objecttype == 'spell':

        classrace = request.GET.get('classrace') or None

        level = request.GET.get('level') or None
        reversible = request.GET.get('reversible') or None #FIXME!


        objects = Spell.objects.all()

        if classrace!="ALL" and classrace:
            objects = objects.filter(affectedclassrace=classrace)

        if level!="ALL" and level:
            objects = objects.filter(level=level)

        if reversible!="ALL" and reversible:
            objects = objects.filter(reversible=reversible)


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

    if objecttype == 'rule':

        affectedsection = request.GET.get('affectedsection') or None

        objects = Rule.objects.all()

        if affectedsection!="ALL" and affectedsection:
            objects = objects.filter(affectedsections=affectedsection)

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
