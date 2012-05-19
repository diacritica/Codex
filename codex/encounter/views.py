# -*- coding: utf-8 -*-
# Create your views here.
from django.http import HttpResponse
from django.shortcuts import render_to_response, get_object_or_404
from codex.web.models import *

from codex.settings import MEDIA_URL,STATIC_URL
from decimal import *

from django.template import Context, Template, RequestContext

from random import randint

def EncounterIndex(request):

    return HttpResponse("Encounter OK")

def getCreature(creature_list, hitdice):
    new_creature_list = creature_list.filter(hitdice = hitdice)
    print hitdice, new_creature_list
    if len(new_creature_list) > 0:
        return new_creature_list[randint(0, len(new_creature_list)-1)]
    else:
        return False

def getTreasure():
    pass

#def EncounterTest(request):
def EncounterTest(dif):
    canon = "C"
    align = "C"
    players_level = 40
    arbitrary_num = 4
    difficulty = dif #normal
   
    #probs = {1:range(20), 2:range(20,30), 3:range(30,45), 4:range(45,70), 5:range(70,85), 6:range(85,100)}
    
    dungeon_probs = {20:{'numrange':(1,1)}, 30:{'numrange':(2,2)}, 45:{'numrange':(3,3)}, 70:{'numrange':(4,4)}, 85:{'numrange':(5,5)}, \
                                   96:{'numrange':(6,7)}, 100:{'numrange':(8,20)}}

    region = dungeon_probs

    # 1. filter available creatures by canon level
    creature_list = Creature.objects.filter(canon_level = canon)
    # 2. filter available creatures by alignment
    creature_list = creature_list.filter(alignment = align)
    # 3. Possible encounters
    encounter_list = {}
    base_encounterHD = players_level/arbitrary_num
  
    # One creature
    creature = getCreature(creature_list, base_encounterHD)
    if creature:
        encounter_list[1] = [base_encounterHD,creature]
    #print "encounter_list: ", encounter_list
    # Group of creatures
    encounterHD = int(base_encounterHD * difficulty)

    for ncreatures in range(2,20):
        print "encounterHD/ncreatures: ", encounterHD, ncreatures
        hitdice = encounterHD/ncreatures #rounded, two ints
        # To ensure that for low levels it does not continue
        if hitdice >= 1:
            creature = getCreature(creature_list, hitdice)
            if creature:
                encounter_list[ncreatures] = [hitdice,creature]
            #print "encounter_list: ", encounter_list
        else:
            break

    probs = dungeon_probs.keys()
    probs.sort()
    found = False
    #print 'probs: ', probs
    while found == False:
        # Select range creatures
        selection = randint(1,100)
        #print 'selection: ', selection
        i = 0
        for k in probs:
            if selection < k:
                selected = region[probs[i]]
                break
            i += 1
        # Select num creatures
        numcreatures = randint(selected['numrange'][0], selected['numrange'][-1])
        print 'numcreatures, selected: ', numcreatures, selected
        try:
            encounter = encounter_list[numcreatures]
            found = True
            #print 'encounter: ', encounter
        except:
            #print 'Except'
            pass
            
    #return HttpResponse(encounter)
    return encounter
