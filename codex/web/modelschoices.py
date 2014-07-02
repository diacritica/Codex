#!/usr/bin/python
# -*- coding: utf-8 -*-

from django.utils.translation import ugettext_lazy as _

GENDER_CHOICES = (
    ('F', _('Female')),
    ('M', _('Male')),
    ('N', _('N/A')),
)

MINLEVEL = 1
MAXLEVEL = 20

LEVEL_CHOICES = (('{level}'.format(level=level) ,'{level}'.format(level=level)) for level in range(MINLEVEL,MAXLEVEL+1)  )

PROFESSION_DESCRIPTOR = {
    'Cl':(u'Cleric',20),
    'El':(u'Elf',10),
    'Dw':(u'Dwarf',12),
    'Ex':(u'Explorer',20),
    'Wr':(u'Warrior',20),
    'Hl':(u'Halfling',8),
    'Rg':(u'Rogue',20),
    'Mg':(u'Mage',20),
    'Pl':(u'Paladin',20),
    'As':(u'Assassin',15),
    'Br':(u'Barbarian',15),
    'Bd':(u'Bard',20),
    'Dr':(u'Druid',14),
    'De':(u'Dark elf',10),
    'Gn':(u'Gnome',10),
    'My':(u'Mystic (Monk)',16),
    'Ni':(u'Ninja',20),
    'Sa':(u'Samurai',20),
    'He':(u'Half-elf',15),
    'Ho':(u'Half-orc',12),
}

PROFESSION_CHOICES = ( (profession[0],profession[1][0]) 
                       for profession in PROFESSION_DESCRIPTOR.items()
)

SAVE_CHOICES = ( (profession[0] , "{0}: level {1}".format(profession[1][0],level) ) 


                 for profession in PROFESSION_DESCRIPTOR.items()
                 for level in range(MINLEVEL,profession[1][1]+1) 
)

CRE_SAVE_CHOICES = ( (profession[0] , "{0}: level {1}".format(profession[1][0],level) ) 


                 for profession in PROFESSION_DESCRIPTOR.items()
                 for level in range(MINLEVEL,profession[1][1]+1) 
)


MINMORAL = 1
MAXMORAL = 12

MORALE_CHOICES = (('{moral}'.format(moral=moral) ,'{moral}'.format(moral=moral)) for moral in range(MINMORAL,MAXMORAL+1)  )

CRE_MORALE_CHOICES = (('{moral}'.format(moral=moral) ,'{moral}'.format(moral=moral)) for moral in range(MINMORAL,MAXMORAL+1)  )

ALIGN_CHOICES = (
        ('L', _(u'Legal')),
        ('N', _(u'Neutral')),
        ('C', _(u'Chaotic')),
        ('NA', _(u'N/A')),
        ('ANY', _(u'Anyone')),
)

CRE_ALIGN_CHOICES = (
        ('L', _(u'Legal')),
        ('N', _(u'Neutral')),
        ('C', _(u'Chaotic')),
        ('LN', _(u'Legal or Neutral')),
        ('LC', _(u'Legal or Chaotic')),
        ('NC', _(u'Neutral or Chaotic')),
        ('ANY', _(u'Anyone')),
        ('NA', _(u'N/A')),
)

SPECIES_CHOICES = (
        ('Spd', _(u'Spider')),
        ('Bsk', _(u'Basilisk')),
        ('Gd', _(u'God')),
        ('Drg', _(u'Dragon')),
        ('Ele', _(u'Elemental')),
        ('Elf', _(u'Elf')),
        ('Dwf', _(u'Dwarf')),
        ('Gnm', _(u'Gnom')),
        ('Hfg', _(u'Halfling')),
        ('Fae', _(u'Fairy')),
        ('Skm', _(u'Serpent men')),
        ('Cbm', _(u'Cobra men')),
        ('Hum', _(u'Human')),
        ('Lch', _(u'Lich')),
        ('Orc', _(u'Orc')),
        ('NA', _(u'N/A')),
)


CHAR_STATUS_CHOICES = (
        ('Al', _(u'Alive')),
        ('Dth', _(u'Dead')),
        ('Dis', _(u'Dissapeared')),
        ('Un', _(u'Undead')),
        ('OPl', _(u'In other plane')),
)

LOC_STATUS_CHOICES = (
        ('Ac', _(u'Active')),
        ('R', _(u'Ruins')),
        ('D', _(u'Destroyed')),
        ('A', _(u'Derelict')),
        ('RC', _(u'Being rebuilded')),
        ('Ds', _(u'Disappeared')),
        ('NA', _(u'N/A')),
)

OBJ_STATUS_CHOICES = (
        ('D', _(u'Destroyed')),
        ('Ds', _(u'Unknown')),
        ('Cr', _(u'Good condition')),
        ('Fg', _(u'Fragmented')),
        ('NA', _(u'N/A')),
)

PNJ_CHOICES = (
        ('NA', _(u'N/A')),
        ('NPC', _(u'NPC')),
        ('PC', _(u'PC')),
)

LOC_TYPE_CHOICES = (
        ('Co', _(u'Continent')),
        ('Tv', _(u'Tavern')),
        ('Inn', _(u'Inn')),
        ('Vg', _(u'Village')),
        ('C', _(u'City')),
        ('K', _(u'Kingdom')),
        ('Cy', _(u'Country')),
        ('T', _(u'Temple')),
        ('Cs', _(u'Castle')),
        ('FB', _(u'Fortress')),
        ('PB', _(u'Public building')),
        ('Op', _(u'Outpost')),
        ('Pl', _(u'Palace')),
        ('Mn', _(u'Mine')),
        ('Lk', _(u'Lake')),
        ('Sw', _(u'Swamp')),
        ('Mn', _(u'Mountain')),
        ('Wl', _(u'Wall')),
        ('Cp', _(u'Capital city')),
        ('Rv', _(u'River')),
        ('Is', _(u'Island')),
        ('Wd', _(u'Wood')),
        ('Shp', _(u'Shop')),
        ('Hm', _(u'Home')),
        ('Prt', _(u'Port')),
        ('Scn', _(u'Scenery')),
        ('Dng', _(u'Dungeon')),
        ('Unk', _(u'Unknown')),
)

CHARLOC_RELATIONSHIP_CHOICES = (
        ('1', _('Level 1')),
        ('2', _('Level 2')),
        ('3', _('Level 3')),
)

OBJ_TYPE_CHOICES = (
        ('W', _(u'Weapon')),
        ('S', _(u'Parchment')),
        ('A', _(u'Armor')),
        ('J', _(u'Jewel')),
        ('C', _(u'Coin')),
        ('Fr', _(u'Furniture')),
        ('Trp', _(u'Transport')),
        ('Fd', _(u'Food')),
        ('Dk', _(u'Drink')),
        ('Hrb', _(u'Herb')),
        ('Tls', _(u'Tool')),
        ('Clt', _(u'Cloth/Clothing')),
        ('Ven', _(u'Poison')),
        ('Pot', _(u'Potion')),
        ('Ani', _(u'Animal')),
        ('Rcp', _(u'Recipient')),
        ('N/A', _(u'N/A')),

)

OBJ_RARITY_CHOICES = (
        ('C', _(u'Common')),
        ('R', _(u'Rare')),
        ('U', _(u'Unique')),
        ('L', _(u'Legendary')),
        ('N/A', _(u'N/A')),
)

CHAR_RELATIONSHIP_CHOICES = (
        ('SON', _(u'Child')),
        ('FATHER', _(u'Parent')),
        ('BROTHER', _(u'Sibling')),
        ('SUBDIT', _(u'Subject')),
        ('GROUP', _(u'Gruop')),
        ('FELLOW', _(u'Fellow')),
        ('NEMESIS', _(u'Nemesis')),
        ('ENEMY', _(u'Enemy')),
        ('FRIEND', _(u'Friend')),
        ('MASTER', _(u'Master')),
        ('APPRENTICE', _(u'Apprentice')),
        ('FAMILIAR', _(u'Familiar (animal)')),
        ('EMPLOYEE', _(u'Employee')),
        ('LORD', _(u'Lord')),
        ('UNDERLING', _(u'Underling')),
        ('COUSIN', _(u'Cousin')),
        ('NEPHEW', _(u'Niece/Nephew')),
        ('UNCLE', _(u'Uncle/Aunt')),
        ('GRAND', _(u'Grand')),
        ('CREATOR', _(u'Creator')),
        ('STEPFATHER', _(u'Stepparent')),
        ('STEPSON', _(u'Stepchild')),

)

CRE_RELATIONSHIP_CHOICES = (
        ('GROUP', _(u'Gruop')),
        ('NEMESIS', _(u'Nemesis')),
        ('CREATOR', _(u'Creator')),
        ('LEADER', _(u'Leader')),
        ('UNDERLING', _(u'Minion')),
)

OBJ_RELATIONSHIP_CHOICES = (
        ('PAIR', _(u'Pair')),
        ('ORIGIN', _(u'Origin')),
        ('NEMESIS', _(u'Nemesis')),
        ('PIECE', _(u'Fragment')),
        ('TREASURE', _(u'Treasure')),

)

CANON_LEVEL_CHOICES = (
    ('NEW', _(u'New')),
    ('AP', _(u'Apocryphal')),
    ('APC', _(u'Under study')),
    ('C', _(u'Canon')),
)

PRICE_RANGES = (
    ('FREE', _(u'Free')),
    ('1-10', _(u'1-10')),
    ('11-20', _(u'11-20')),
    ('21-30', _(u'21-30')),
    ('31-40', _(u'31-40')),
    ('41-50', _(u'41-50')),
    ('51-60', _(u'51-60')),
    ('60+', _(u'60+')),
    ('N/A', _(u'N/A')),
)


FANART_LICENSE_CHOICES = (
        ('R', _(u'All rights reserved')),
        ('CCBY', _(u'CC BY')),
        ('CCBYSA', _(u'CC BY SA')),
        ('CCBYSANC', _(u'CC BY SA NC')),
        ('N/A', _(u'N/A')),
)

FANART_CATEGORY_CHOICES = (
        ('Scn', _(u'Scenery')),
        ('Prs', _(u'People')),
        ('Cre', _(u'Creatures')),
        ('Obj', _(u'Object')),
        ('Bld', _(u'Building')),
        ('Evn', _(u'Event')),
        ('N/A', _(u'N/A')),
)

FANART_TYPE_CHOICES = (
        ('Drw', _(u'Ilustration')),
        ('Pnt', _(u'Painting')),
        ('Ph', _(u'Photo')),
        ('Scp', _(u'Sculpture')),
        ('Hm', _(u'Craft')),
        ('Oth', _(u'Other')),
        ('Dgt', _(u'Digital art')),
        ('N/A', _(u'N/A')),
)


