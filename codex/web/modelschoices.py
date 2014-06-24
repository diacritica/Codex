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

#FIXME translate
SPECIES_CHOICES = (
        ('Spd', _(u'Spider')),
        ('Bsk', _(u'Basilisk')),
        ('Gd', _(u'God')),
        ('Drg', _(u'Dragon')),
        ('Ele', _(u'Elemental')),
        ('Elf', _(u'Elfo')),
        ('Dwf', _(u'Enano')),
        ('Gnm', _(u'Gnomo')),
        ('Hfg', _(u'Halfling')),
        ('Fae', _(u'Hada')),
        ('Skm', _(u'Hombre serpiente')),
        ('Cbm', _(u'Hombre cobra')),
        ('Hum', _(u'Humano')),
        ('Lch', _(u'Liche')),
        ('Orc', _(u'Orco')),
        ('NA', _(u'N/A')),
)


CHAR_STATUS_CHOICES = (
        ('Al', _(u'Alive')),
        ('Dth', _(u'Dead')),
        ('Dis', _(u'Dissapeared')),
        ('Un', _(u'Undead')),
        ('OPl', _(u'In other plane')),
)

#FIXME translate
LOC_STATUS_CHOICES = (
        ('Ac', _(u'Active')),
        ('R', _(u'Ruins')),
        ('D', _(u'Destroyed')),
        ('A', _(u'Abandonado')),
        ('RC', _(u'En reconstrucción')),
        ('Ds', _(u'Desaparecido')),
        ('NA', _(u'N/A')),
)
#FIXME translate
OBJ_STATUS_CHOICES = (
        ('D', _(u'Destruido')),
        ('Ds', _(u'Desconocido')),
        ('Cr', _(u'Correcto')),
        ('Fg', _(u'Fragmentado')),
        ('NA', _(u'N/A')),
)
#FIXME translate
PNJ_CHOICES = (
        ('NA', _(u'N/A')),
        ('NPC', _(u'ANJ')),
        ('PC', _(u'AJ')),
)
#FIXME translate
LOC_TYPE_CHOICES = (
        ('Co', _(u'Continente')),
        ('Tv', _(u'Taberna')),
        ('Inn', _(u'Posada')),
        ('Vg', _(u'Pueblo')),
        ('C', _(u'Ciudad')),
        ('K', _(u'Reino')),
        ('Cy', _(u'País')),
        ('T', _(u'Templo')),
        ('Cs', _(u'Castillo')),
        ('FB', _(u'Fortaleza')),
        ('PB', _(u'Edifico Público')),
        ('Op', _(u'Puesto avanzado')),
        ('Pl', _(u'Palacio')),
        ('Mn', _(u'Mina')),
        ('Lk', _(u'Lago')),
        ('Sw', _(u'Pantano')),
        ('Mn', _(u'Montaña')),
        ('Wl', _(u'Muralla')),
        ('Cp', _(u'Ciudad Capital')),
        ('Rv', _(u'Río')),
        ('Is', _(u'Isla')),
        ('Wd', _(u'Bosque')),
        ('Shp', _(u'Comercio')),
        ('Hm', _(u'Vivienda')),
        ('Prt', _(u'Puerto')),
        ('Scn', _(u'Paraje')),
        ('Unk', _(u'Desconocido')),
)

#FIXME needes?
CHARLOC_RELATIONSHIP_CHOICES = (
        ('1', _('Nivel 1')),
        ('2', _('Nivel 2')),
        ('3', _('Nivel 3')),
)

#FIXME translate
OBJ_TYPE_CHOICES = (
        ('W', _(u'Arma')),
        ('S', _(u'Pergamino')),
        ('A', _(u'Armadura')),
        ('J', _(u'Joya')),
        ('C', _(u'Moneda')),
        ('Fr', _(u'Mobiliario')),
        ('Trp', _(u'Transporte')),
        ('Fd', _(u'Comida')),
        ('Dk', _(u'Bebida')),
        ('Hrb', _(u'Hierba')),
        ('Tls', _(u'Herramienta')),
        ('Clt', _(u'Tela/Vestimenta')),
        ('Ven', _(u'Veneno')),
        ('Pot', _(u'Poción')),
        ('Ani', _(u'Animal')),
        ('Rcp', _(u'Recipiente')),
        ('N/A', _(u'N/A')),

)

#FIXME translate
OBJ_RARITY_CHOICES = (
        ('C', _(u'Común')),
        ('R', _(u'Raro')),
        ('U', _(u'Único')),
        ('L', _(u'Legendario')),
        ('N/A', _(u'N/A')),
)

#FIXME translate
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
        ('STEPFATHER', _(u'Padrastro')),
        ('STEPSON', _(u'Hijastro')),

)

#FIXME translate
CRE_RELATIONSHIP_CHOICES = (
        ('GROUP', _(u'Grupo')),
        ('NEMESIS', _(u'Némesis')),
        ('CREATOR', _(u'Creador')),
        ('LEADER', _(u'Líder')),
        ('UNDERLING', _(u'Esbirro')),
)

#FIXME translate
OBJ_RELATIONSHIP_CHOICES = (
        ('PAIR', _(u'Pareja')),
        ('ORIGIN', _(u'Origen')),
        ('NEMESIS', _(u'Némesis')),
        ('PIECE', _(u'Fragmento')),
        ('TREASURE', _(u'Tesoro')),

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
#FIXME translate
FANART_CATEGORY_CHOICES = (
        ('Scn', _(u'Paisaje')),
        ('Prs', _(u'Personas')),
        ('Cre', _(u'Criaturas')),
        ('Obj', _(u'Objeto')),
        ('Bld', _(u'Edificio')),
        ('Evn', _(u'Evento')),
        ('N/A', _(u'N/A')),
)
#FIXME translate
FANART_TYPE_CHOICES = (
        ('Drw', _(u'Ilustración')),
        ('Pnt', _(u'Pintura')),
        ('Ph', _(u'Fotografía')),
        ('Scp', _(u'Escultura')),
        ('Hm', _(u'Manualidad')),
        ('Oth', _(u'Otros')),
        ('N/A', _(u'N/A')),
)


