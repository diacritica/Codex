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
def EncounterTest():
    canon = "C"
    align = "C"
    players_level = 40
    difficulty = 1.5 #normal

    probs = {1:range(20), 2:range(20,30), 3:range(30,45), 4:range(45,70), 5:range(70,85), 6:range(85,100)}

    # 1. filter available creatures by canon level
    creature_list = Creature.objects.filter(canon_level = canon)
    # 2. filter available creatures by alignment
    creature_list = creature_list.filter(alignment = align)
    # 3. Possible encounters
    encounter_list = {}
    base_encounterHD = players_level/4

    # One creature
    creature = getCreature(creature_list, base_encounterHD)
    if creature:
        encounter_list[1] = [base_encounterHD,creature]
    print "encounter_list: ", encounter_list
    # Group of creatures
    encounterHD = int(base_encounterHD * difficulty)

    for ncreatures in range(2,7):
        print "encounterHD/ncreatures: ", encounterHD, ncreatures
        hitdice = encounterHD/ncreatures #rounded, two ints
        # To ensure that for low levels it does not continue
        if hitdice >= 1:
            creature = getCreature(creature_list, hitdice)
            if creature:
                encounter_list[ncreatures] = [hitdice,creature]
            print "encounter_list: ", encounter_list
        else:
            break

    selection = randint(0,99)
    
    for ncreatures, prob in probs.items():
        if selection in prob:
            try:
                encounter = ncreatures, encounter_list[ncreatures]
                break
            except:
                selection = randint(0,99)

    #return HttpResponse(encounter)
    return encounter
