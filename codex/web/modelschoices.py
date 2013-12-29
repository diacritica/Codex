#!/usr/bin/python
# -*- coding: utf-8 -*-

from django.utils.translation import ugettext_lazy as _

GENDER_CHOICES = (
        ('F', _('Female')),
        ('M', _('Male')),
        ('N', _('N/A')),
)

MINLEVEL = 0
MAXLEVEL = 20

LEVEL_CHOICES = (('{level}'.format(level=level) ,'{level}'.format(level=level)) for level in range(MINLEVEL,MAXLEVEL+1)  )



SAVE_CHOICES = (
    ('G1', _(u'Guerrero nivel 1')),
    ('G2', _(u'Guerrero nivel 2')),
    ('G3', _(u'Guerrero nivel 3')),
    ('G4', _(u'Guerrero nivel 4')),
    ('G5', _(u'Guerrero nivel 5')),
    ('G6', _(u'Guerrero nivel 6')),
    ('G7', _(u'Guerrero nivel 7')),
    ('G8', _(u'Guerrero nivel 8')),
    ('G9', _(u'Guerrero nivel 9')),
    ('G10', _(u'Guerrero nivel 10')),
    ('G11', _(u'Guerrero nivel 11')),
    ('G12', _(u'Guerrero nivel 12')),
    ('G13', _(u'Guerrero nivel 13')),
    ('G14', _(u'Guerrero nivel 14')),
    ('G15', _(u'Guerrero nivel 15')),
    ('G16', _(u'Guerrero nivel 16')),
    ('G17', _(u'Guerrero nivel 17')),
    ('G18', _(u'Guerrero nivel 18')),
    ('G19', _(u'Guerrero nivel 19')),
    ('G20', _(u'Guerrero nivel 20')),
    ('C1', _(u'Clérigo nivel 1')),
    ('C2', _(u'Clérigo nivel 2')),
    ('C3', _(u'Clérigo nivel 3')),
    ('C4', _(u'Clérigo nivel 4')),
    ('C5', _(u'Clérigo nivel 5')),
    ('C6', _(u'Clérigo nivel 6')),
    ('C7', _(u'Clérigo nivel 7')),
    ('C8', _(u'Clérigo nivel 8')),
    ('C9', _(u'Clérigo nivel 9')),
    ('C10', _(u'Clérigo nivel 10')),
    ('C11', _(u'Clérigo nivel 11')),
    ('C12', _(u'Clérigo nivel 12')),
    ('C13', _(u'Clérigo nivel 13')),
    ('C14', _(u'Clérigo nivel 14')),
    ('C15', _(u'Clérigo nivel 15')),
    ('C16', _(u'Clérigo nivel 16')),
    ('C17', _(u'Clérigo nivel 17')),
    ('C18', _(u'Clérigo nivel 18')),
    ('C19', _(u'Clérigo nivel 19')),
    ('C20', _(u'Clérigo nivel 20')),
    ('L1', _(u'Ladrón nivel 1')),
    ('L2', _(u'Ladrón nivel 2')),
    ('L3', _(u'Ladrón nivel 3')),
    ('L4', _(u'Ladrón nivel 4')),
    ('L5', _(u'Ladrón nivel 5')),
    ('L6', _(u'Ladrón nivel 6')),
    ('L7', _(u'Ladrón nivel 7')),
    ('L8', _(u'Ladrón nivel 8')),
    ('L9', _(u'Ladrón nivel 9')),
    ('L10', _(u'Ladrón nivel 10')),
    ('L11', _(u'Ladrón nivel 11')),
    ('L12', _(u'Ladrón nivel 12')),
    ('L13', _(u'Ladrón nivel 13')),
    ('L14', _(u'Ladrón nivel 14')),
    ('L15', _(u'Ladrón nivel 15')),
    ('L16', _(u'Ladrón nivel 16')),
    ('L17', _(u'Ladrón nivel 17')),
    ('L18', _(u'Ladrón nivel 18')),
    ('L19', _(u'Ladrón nivel 19')),
    ('L20', _(u'Ladrón nivel 20')),
    ('M1', _(u'Mago nivel 1')),
    ('M2', _(u'Mago nivel 2')),
    ('M3', _(u'Mago nivel 3')),
    ('M4', _(u'Mago nivel 4')),
    ('M5', _(u'Mago nivel 5')),
    ('M6', _(u'Mago nivel 6')),
    ('M7', _(u'Mago nivel 7')),
    ('M8', _(u'Mago nivel 8')),
    ('M9', _(u'Mago nivel 9')),
    ('M10', _(u'Mago nivel 10')),
    ('M11', _(u'Mago nivel 11')),
    ('M12', _(u'Mago nivel 12')),
    ('M13', _(u'Mago nivel 13')),
    ('M14', _(u'Mago nivel 14')),
    ('M15', _(u'Mago nivel 15')),
    ('M16', _(u'Mago nivel 16')),
    ('M17', _(u'Mago nivel 17')),
    ('M18', _(u'Mago nivel 18')),
    ('M19', _(u'Mago nivel 19')),
    ('M20', _(u'Mago nivel 20')),
    ('P1', _(u'Paladín nivel 1')),
    ('P2', _(u'Paladín nivel 2')),
    ('P3', _(u'Paladín nivel 3')),
    ('P4', _(u'Paladín nivel 4')),
    ('P5', _(u'Paladín nivel 5')),
    ('P6', _(u'Paladín nivel 6')),
    ('P7', _(u'Paladín nivel 7')),
    ('P8', _(u'Paladín nivel 8')),
    ('P9', _(u'Paladín nivel 9')),
    ('P10', _(u'Paladín nivel 10')),
    ('P11', _(u'Paladín nivel 11')),
    ('P12', _(u'Paladín nivel 12')),
    ('P13', _(u'Paladín nivel 13')),
    ('P14', _(u'Paladín nivel 14')),
    ('P15', _(u'Paladín nivel 15')),
    ('P16', _(u'Paladín nivel 16')),
    ('P17', _(u'Paladín nivel 17')),
    ('P18', _(u'Paladín nivel 18')),
    ('P19', _(u'Paladín nivel 19')),
    ('P20', _(u'Paladín nivel 20')),
    ('E1', _(u'Elfo nivel 1')),
    ('E2', _(u'Elfo nivel 2')),
    ('E3', _(u'Elfo nivel 3')),
    ('E4', _(u'Elfo nivel 4')),
    ('E5', _(u'Elfo nivel 5')),
    ('E6', _(u'Elfo nivel 6')),
    ('E7', _(u'Elfo nivel 7')),
    ('E8', _(u'Elfo nivel 8')),
    ('E9', _(u'Elfo nivel 9')),
    ('E10', _(u'Elfo nivel 10')),
    ('D1', _(u'Enano nivel 1')),
    ('D2', _(u'Enano nivel 2')),
    ('D3', _(u'Enano nivel 3')),
    ('D4', _(u'Enano nivel 4')),
    ('D5', _(u'Enano nivel 5')),
    ('D6', _(u'Enano nivel 6')),
    ('D7', _(u'Enano nivel 7')),
    ('D8', _(u'Enano nivel 8')),
    ('D9', _(u'Enano nivel 9')),
    ('D10', _(u'Enano nivel 10')),
    ('D11', _(u'Enano nivel 11')),
    ('D12', _(u'Enano nivel 12')),
    ('R1', _(u'Explorador nivel 1')),
    ('R2', _(u'Explorador nivel 2')),
    ('R3', _(u'Explorador nivel 3')),
    ('R4', _(u'Explorador nivel 4')),
    ('R5', _(u'Explorador nivel 5')),
    ('R6', _(u'Explorador nivel 6')),
    ('R7', _(u'Explorador nivel 7')),
    ('R8', _(u'Explorador nivel 8')),
    ('R9', _(u'Explorador nivel 9')),
    ('R10', _(u'Explorador nivel 10')),
    ('R11', _(u'Explorador nivel 11')),
    ('R12', _(u'Explorador nivel 12')),
    ('R13', _(u'Explorador nivel 13')),
    ('R14', _(u'Explorador nivel 14')),
    ('R15', _(u'Explorador nivel 15')),
    ('R16', _(u'Explorador nivel 16')),
    ('R17', _(u'Explorador nivel 17')),
    ('R18', _(u'Explorador nivel 18')),
    ('R19', _(u'Explorador nivel 19')),
    ('R20', _(u'Explorador nivel 20')),
    ('H1', _(u'Halfling nivel 1')),
    ('H2', _(u'Halfling nivel 2')),
    ('H3', _(u'Halfling nivel 3')),
    ('H4', _(u'Halfling nivel 4')),
    ('H5', _(u'Halfling nivel 5')),
    ('H6', _(u'Halfling nivel 6')),
    ('H7', _(u'Halfling nivel 7')),
    ('H8', _(u'Halfling nivel 8')),

)

MORAL_CHOICES = (
    ('01', '01'),
    ('02', '02'),
    ('03', '03'),
    ('04', '04'),
    ('05', '05'),
    ('06', '06'),
    ('07', '07'),
    ('08', '08'),
    ('09', '09'),
    ('10', '10'),
    ('11', '11'),
    ('12', '12'),
)

ALIGN_CHOICES = (
        ('L', _(u'Legal')),
        ('N', _(u'Neutral')),
        ('C', _(u'Caótico')),
        ('NA', _(u'N/A')),
        ('ANY', _(u'Cualquiera')),
)

CRE_ALIGN_CHOICES = (
        ('L', _(u'Legal')),
        ('N', _(u'Neutral')),
        ('C', _(u'Caótico')),
        ('LN', _(u'Legal o Neutral')),
        ('LC', _(u'Legal o Caótico')),
        ('NC', _(u'Neutral o Caótico')),
        ('ANY', _(u'Cualquiera')),
        ('NA', _(u'N/A')),
)


SPECIES_CHOICES = (
        ('Spd', _(u'Araña')),
        ('Bsk', _(u'Basilisco')),
        ('Gd', _(u'Dios')),
        ('Drg', _(u'Dragón')),
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

PROFESSION_CHOICES = (
        ('Pl', _(u'Paladín')),
        ('Ex', _(u'Explorador')),
        ('As', _(u'Asesino')),
        ('Rg', _(u'Ladrón')),
        ('Wz', _(u'Mago')),
        ('Cl', _(u'Clérigo')),
        ('Wr', _(u'Guerrero')),
        ('Hf', _(u'Halfling')),
        ('El', _(u'Elfo')),
        ('NA', _(u'N/A')),
)


CHAR_STATUS_CHOICES = (
        ('Al', _(u'Vivo')),
        ('Dth', _(u'Muerto')),
        ('Dis', _(u'Desaparecido')),
        ('Un', _(u'No muerto')),
        ('OPl', _(u'En otro plano')),
)

LOC_STATUS_CHOICES = (
        ('Ac', _(u'Activo')),
        ('R', _(u'Ruinas')),
        ('D', _(u'Destruido')),
        ('A', _(u'Abandonado')),
        ('RC', _(u'En reconstrucción')),
        ('Ds', _(u'Desaparecido')),
        ('NA', _(u'N/A')),
)

OBJ_STATUS_CHOICES = (
        ('D', _(u'Destruido')),
        ('Ds', _(u'Desconocido')),
        ('Cr', _(u'Correcto')),
        ('Fg', _(u'Fragmentado')),
        ('NA', _(u'N/A')),
)

PNJ_CHOICES = (
        ('NA', _(u'N/A')),
        ('NPC', _(u'ANJ')),
        ('PC', _(u'AJ')),
)

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

CHARLOC_RELATIONSHIP_CHOICES = (
        ('1', _('Nivel 1')),
        ('2', _('Nivel 2')),
        ('3', _('Nivel 3')),
)

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

OBJ_RARITY_CHOICES = (
        ('C', _(u'Común')),
        ('R', _(u'Raro')),
        ('U', _(u'Único')),
        ('L', _(u'Legendario')),
        ('N/A', _(u'N/A')),
)

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

CRE_RELATIONSHIP_CHOICES = (
        ('GROUP', _(u'Grupo')),
        ('NEMESIS', _(u'Némesis')),
        ('CREATOR', _(u'Creador')),
        ('LEADER', _(u'Líder')),
        ('UNDERLING', _(u'Esbirro')),
)


OBJ_RELATIONSHIP_CHOICES = (
        ('PAIR', _(u'Pareja')),
        ('ORIGIN', _(u'Origen')),
        ('NEMESIS', _(u'Némesis')),
        ('PIECE', _(u'Fragmento')),
        ('TREASURE', _(u'Tesoro')),

)

CANON_LEVEL_CHOICES = (
    ('NEW', _(u'Nuevo')),
    ('AP', _(u'Apócrifo')),
    ('APC', _(u'En estudio')),
    ('C', _(u'Canon')),
)

PRICE_RANGES = (
    ('FREE', _(u'Gratis')),
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
        ('Scn', _(u'Paisaje')),
        ('Prs', _(u'Personas')),
        ('Cre', _(u'Criaturas')),
        ('Obj', _(u'Objeto')),
        ('Bld', _(u'Edificio')),
        ('Evn', _(u'Evento')),
        ('N/A', _(u'N/A')),
)

FANART_TYPE_CHOICES = (
        ('Drw', _(u'Ilustración')),
        ('Pnt', _(u'Pintura')),
        ('Ph', _(u'Fotografía')),
        ('Scp', _(u'Escultura')),
        ('Hm', _(u'Manualidad')),
        ('Oth', _(u'Otros')),
        ('N/A', _(u'N/A')),
)


if __name__=="__main__":
    pass
