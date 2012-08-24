# -*- coding: utf-8 -*-
# Create your views here.
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render_to_response, get_object_or_404
from codex.web.models import *

from codex.settings import MEDIA_URL,STATIC_URL
from decimal import *

from django.template import Context, Template, RequestContext

from random import randint

def EncounterIndex(request):
    settings_list = EncounterSetting.objects.filter(deactivated=False)
    try:
        canon = request.GET['canon']
        align = request.GET['align']
        setting = request.GET['setting']
        players_level = request.GET['players_level']
        chosen_difficulty = request.GET['chosen_difficulty']
        return HttpResponseRedirect('/encounter/%s/%s/%s/%s/%s' % (canon, align, setting, players_level, chosen_difficulty))
    except:    
        return render_to_response('encounter/encounter_index.html', {'settings_list': settings_list})

def getCreature(creature_list, hitdice):
    new_creature_list = creature_list.filter(hitdice__regex=r'^%s(\+\w|\/(\w)*)*$'%(hitdice)) #expresión regular que da OK con 1+1, 12, etc 
    #print hitdice, new_creature_list
    if len(new_creature_list) > 0:
        return new_creature_list[randint(0, len(new_creature_list)-1)]
    else:
        return False

def getTreasure():
    pass

def getParty(encounter):
    # Two possibilities: the chosen creature is a leader or it is leader
    # no difference in treatment
    try:
        # get all the creatures with a leadership relation 
        creatureleaderrelation = encounter.getAllRelationTitles('LEADER')
        #print "Lista de líderes asociadas", creatureleaderrelation
        # prev returns a tuple where creature1 is LEADER of creature2
        if creatureleaderrelation:
            new_encounter = creatureleaderrelation[randint(0, len(creatureleaderrelation) - 1)]
            return new_encounter
        else:
            return False
    except Exception, e:
        #print "exception ", e
        return False


def Encounter(request, canon, align, setting, players_level, chosen_difficulty):
    #def EncounterTest(canon, align, players_level, chosen_difficulty):
    # Store the values of the incoming request to populate the form with the current search

    form = {'canon': canon, 'align': align, 'setting': int(setting), 'players_level': str(players_level), 'chosen_difficulty': str(chosen_difficulty)}
    
    players_level = int(players_level)
    chosen_difficulty = int(chosen_difficulty)
    arbitrary_num = 4.0
    
    # Difficulty is based on the number of creatures
    difficulty = {"one": [0.5, 1, 1.5, 2], "n": [1, 1.5, 2, 3]}
    
    # This should get the probs from the setting object.
    dungeon_probs = {20:{'numrange':(1,1)}, 30:{'numrange':(2,2)}, 45:{'numrange':(3,3)}, 70:{'numrange':(4,4)}, 85:{'numrange':(5,5)}, \
                                   96:{'numrange':(6,7)}, 100:{'numrange':(8,20)}}

    region = dungeon_probs

    # A list of all the available settings must be sent to the HTML to generate the drop down list
    settings_list = EncounterSetting.objects.filter(deactivated=False)

    # Create a list with all the creatures available:
    creature_list = Creature.objects.all()

    # 1. filter available creatures by setting
    if setting == '0':
        pass
    else:
        creature_list = creature_list.filter(relatedencountersetting = setting)

    # 2. filter available creatures by canon level
    if canon == 'ALL':
        pass
    else:
        creature_list = creature_list.filter(canon_level = canon)
    # 3. filter available creatures by alignment
    if align == 'ALL':
        pass
    else:
        creature_list = creature_list.filter(alignment = align)
      
    # We first create a list of the possible encounters. The reason is to
    # have the list ready not to repeat everything if the roll yields an
    # invalid encounter
    
    # 3. Possible encounters
    encounter_list = {}
    base_encounterHD = players_level/arbitrary_num
    
    for ncreatures in range(1,20):
        
        if ncreatures == 1:
            encounterHD = base_encounterHD * difficulty["one"][chosen_difficulty]
        else:
            encounterHD = base_encounterHD * difficulty["n"][chosen_difficulty]
        #print "encounterHD/ncreatures: ", encounterHD, ncreatures
        hitdice = int(round(encounterHD/ncreatures)) #rounded, two ints
        # To ensure that for low levels it does not continue
        if hitdice >= 1:
            creature = getCreature(creature_list, hitdice)
            if creature:
                encounter_list[ncreatures] = [hitdice,creature]
            #print "encounter_list: ", encounter_list
        else:
            break

    # Check if there is something inside the encounter_list
    # (important for low level characters)

    #print "encounter_list: ", encounter_list
    leader = False
    if encounter_list.keys():
        probs = region.keys() #FIXME!
        probs.sort()
        found = False
    
        while found == False:
            # Select range for number of creatures
            selection = randint(1,100)
            #print 'selection: ', selection
            i = 0
            for k in probs:
                if selection < k:
                    selected = region[probs[i-1]]
                    break
                elif selection == k:
                    selected = region[probs[i]]
                    break
                i += 1
            # Select num creatures
            numcreatures = randint(selected['numrange'][0], selected['numrange'][-1])
            try:
                
                encounter = encounter_list[numcreatures][1]
                found = True

                # generate an encounter with a party leader
                if numcreatures > 2 and randint(0,4) < 3:
                    #print "Tenemos que buscar un lider"
                    encounter_with_leader = getParty(encounter)
                    if encounter_with_leader:
                        numcreatures -= 1
                        leader = True
                        encounter = encounter_with_leader
                #print 'encounter: ', encounter
            except:
                #print 'Except'
                pass
    else:
        # if the encounters list is empty. Might happen (feature)
        numcreatures = False
        encounter = ''
#    print 'encounter: ', numcreatures, encounter, leader

    if leader:
        return render_to_response('encounter/encounter_gen.html', {'numcreatures': numcreatures, 'leader': encounter[0], 'encounter':encounter[1], 'form':form, 'settings_list': settings_list})
    else:
        return render_to_response('encounter/encounter_gen.html', {'numcreatures': numcreatures, 'leader': False, 'encounter':encounter, 'form':form, 'settings_list': settings_list})

