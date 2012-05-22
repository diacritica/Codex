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
    try:
        canon = request.GET['canon']
        align = request.GET['align']
        players_level = request.GET['players_level']
        chosen_difficulty = request.GET['chosen_difficulty']
        return HttpResponseRedirect('/encounter/test/%s/%s/%s/%s' % (canon, align, players_level, chosen_difficulty))
    except:    
        return render_to_response('encounters/encounter_gen.html')

def getCreature(creature_list, hitdice):
    new_creature_list = creature_list.filter(hitdice = hitdice)
    print hitdice, new_creature_list
    if len(new_creature_list) > 0:
        return new_creature_list[randint(0, len(new_creature_list)-1)]
    else:
        return False

def getTreasure():
    pass

def EncounterTest(request, canon, align, players_level, chosen_difficulty):
    #def EncounterTest(chosen_difficulty):
    
    # FIXME: It is needed to control when the result is an empty list
    players_level = int(players_level)
    chosen_difficulty = int(chosen_difficulty)
    arbitrary_num = 4.0
    
    # Difficulty is based on the number of creatures
    difficulty = {"one": [0.5, 1, 1.5, 2], "n": [1, 1.5, 2, 3]}
    
    dungeon_probs = {20:{'numrange':(1,1)}, 30:{'numrange':(2,2)}, 45:{'numrange':(3,3)}, 70:{'numrange':(4,4)}, 85:{'numrange':(5,5)}, \
                                   96:{'numrange':(6,7)}, 100:{'numrange':(8,20)}}

    region = dungeon_probs

    # Create a list with all the creatures available:
    creature_list = Creature.objects.all()
    # 1. filter available creatures by canon level
    if canon == 'ALL':
        pass
    else:
        creature_list = creature_list.filter(canon_level = canon)
    # 2. filter available creatures by alignment
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
        print "encounterHD/ncreatures: ", encounterHD, ncreatures
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
    # important for low level characters

    print "encounter_list: ", encounter_list

    if encounter_list.keys():
        probs = dungeon_probs.keys()
        probs.sort()
        found = False
    
        while found == False:
            # Select range creatures
            selection = randint(1,100)
            print 'selection: ', selection
            i = 0
            for k in probs:
                if selection <= k:
                    selected = region[probs[i]]
                    break
                i += 1
            # Select num creatures
            numcreatures = randint(selected['numrange'][0], selected['numrange'][-1])
            print 'numcreatures, selected: ', numcreatures, selected
            try:
                encounter = encounter_list[numcreatures][1]
                found = True
                #print 'encounter: ', encounter
            except:
                #print 'Except'
                pass
    else:
        # if the encounters list is empty. Might happen (feature)
        numcreatures = False
        encounter = ''
    
    return render_to_response('encounters/encounter_gen.html', {'numcreatures': numcreatures, 'encounter':encounter})
