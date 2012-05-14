#!/usr/bin/python
# -*- coding: utf-8 -*-

from django.db import models

from django.utils.translation import ugettext_lazy as _
#from django.utils.translation import ugettext
#from django.contrib.auth.models import User, UserManager
#from django.template.defaultfilters import slugify
#from tagging.fields import TagField
#from tagging.utils import parse_tag_input
#from djangoratings.fields import RatingField
from taggit.managers import TaggableManager
from twitter import Api

from django.utils.encoding import force_unicode

# Create your models here.

GENDER_CHOICES = (
        ('F', _('Femenino')),
        ('M', _('Masculino')),
        ('N', _('N/A')),
)

LEVEL_CHOICES = (
    ('00', '00'),
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
    ('13', '13'),
    ('14', '14'),
    ('15', '15'),
    ('16', '16'),
    ('17', '17'),
    ('18', '18'),
    ('19', '19'),
    ('21', '21'),
    ('22', '22'),
    ('23', '23'),
    ('24', '24'),
    ('25', '25'),
)

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
        ('Gnm',  _(u'Gnomo')),
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
        ('Dwf', _(u'Enano')),
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
        ('Tow', _(u'Torre')),
        ('Unk', _(u'Desconocido')),
)

CHARLOC_RELATIONSHIP_CHOICES =(
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
        ('Mus', _(u'Instrumento musical')),
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
        ('STEPSON', _(u'Hijastro')),
        ('FATHER', _(u'Padre')),
        ('STEPFATHER', _(u'Padrastro')),
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

CRE_RELATIONSHIP_CHOICES = (
        ('GROUP', _(u'Grupo')),
        ('NEMESIS', _(u'Némesis')),
        ('CREATOR', _(u'Creador')),
        ('LEADER', _(u'Líder')),
        ('FOLLOWER', _(u'Seguidor')),
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
    ('AP',_(u'Apócrifo')),
    ('APC',_(u'En estudio')),
    ('C',_(u'Canon')),
)

PRICE_RANGES = (
    ('FREE', _(u'Gratis')),
    ('1-10',_(u'1-10')),
    ('11-20',_(u'11-20')),
    ('21-30',_(u'21-30')),
    ('31-40',_(u'31-40')),
    ('41-50',_(u'41-50')),
    ('51-60',_(u'51-60')),
    ('60+',_(u'60+')),
    ('N/A',_(u'N/A')),
)





class Character(models.Model):

    name = models.CharField(max_length=100, blank=False, null=False, verbose_name=_('Nombre completo'))
    gender = models.CharField(max_length=2, blank=True, null=True, choices=GENDER_CHOICES, verbose_name=_('Sexo'))
    level = models.CharField(max_length=3, blank=True, null=True, choices=LEVEL_CHOICES, verbose_name=_('Nivel'))
    age = models.CharField(max_length=10, blank=True, null=True, verbose_name=_('Edad'))
    AC = models.CharField(max_length=100, blank=True, null=True, verbose_name=_('CA'))
    move = models.CharField(max_length=100, blank=True, null=True, verbose_name=_('Movimiento'))
    moral = models.CharField(max_length=2, blank=True, null=True, choices=MORAL_CHOICES, verbose_name=_('Moral'))
    saveroll = models.CharField(max_length=20, blank=True, null=True, choices=SAVE_CHOICES, verbose_name=_('Tirada de salvacion'))
    hitpoints = models.CharField(max_length=100, blank=True, null=True, verbose_name=_('Puntos de golpe'))
    alignment = models.CharField(max_length=3, blank=True, null=True, choices=ALIGN_CHOICES, verbose_name=_('Alineamiento'))
    description = models.TextField(blank=True, null=True, verbose_name=_('Descripcion'))
    quote = models.TextField(blank=True, null=True, verbose_name=_('Cita'))
    species = models.CharField(max_length=30, blank=True, null=True, choices=SPECIES_CHOICES, verbose_name=_('Especie'))
    profession = models.CharField(max_length=30, blank=True, null=True, choices=PROFESSION_CHOICES, verbose_name=_('Profesion'))
    startdate = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Primera aparicion'))
    enddate = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Anyo de desaparicion'))

    strengthstat = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Fuerza'))
    dexteritystat = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Destreza'))
    constitutionstat = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Contitucion'))
    intelligencestat = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Inteligencia'))
    wisdomstat = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Sabiduria'))
    charismastat = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Carisma'))

    religion = models.ManyToManyField("Religion", blank=True, null=True, related_name=_("Character's Religions"))

    treasurevalue = models.CharField(max_length=100, blank=True, null=True, verbose_name=_("Character's Treasure value"))

    status = models.CharField(max_length=5, blank=True, null=True, choices=CHAR_STATUS_CHOICES, verbose_name=_('Estado'))

    weapons = models.TextField(blank=True, null=True, verbose_name=_('Ataques'))
    pncorpc = models.CharField(max_length=3, blank=True, null=True, choices=PNJ_CHOICES, verbose_name=_('ANJ/AJ'))

    languages = models.ManyToManyField("Language", blank=True, null=True, related_name=_("Character's Known languages"))

    relatedlocation = models.ManyToManyField('Location', blank=True, null=True, related_name=_('Ubicacion'))
    relatedobject = models.ManyToManyField('Object', blank=True, null=True, related_name=_('Objetos'))

    deactivated = models.BooleanField(blank=True,  verbose_name=_('Desactivado'))

    image = models.ManyToManyField('Image', blank=True, null=True,  related_name=_("Character's image"))
    attachments = models.ManyToManyField('AttachFile', blank=True, null=True,  related_name=_("Character's attachments"))

    relatedcharacter = models.ManyToManyField("Character", blank=True, null=True,  verbose_name=_("Character Relationship"), through='CharacterRelationship')

    tags = TaggableManager(blank=True)
    #Generic to all objects

    slug = models.SlugField(blank=True,null=True,max_length=200,help_text="A short label, generally used in URLs. AUTOMATICALLY ADDED!")

    comments = models.TextField(blank=True, null=True, verbose_name=_('Comments'))
    author = models.ManyToManyField("Author", blank=True, null=True,  verbose_name=_("Character's authorship"))
    canon_level = models.CharField(max_length=5, blank=True, null=True, choices=CANON_LEVEL_CHOICES, verbose_name=_('Canon Level'))
    highlight = models.BooleanField(blank=True, verbose_name=_(u'Destacado en categoría'))
    send_tweet = models.BooleanField(blank=True, verbose_name=_('Tweet nuevo personaje'))

    creation_date = models.DateTimeField(null=True, verbose_name=_('Creation date'))
    last_updated = models.DateTimeField(null=True, verbose_name=_('Last updated'))

    def save(self, *args, **kwargs):
        unique_slug(self, slug_source='name', slug_field='slug')
        if self.send_tweet:
            twitter_config = TwitterConfig.objects.filter(isActive=True)
            for tc in twitter_config:
                text = tc.createTweet(self)
                status = tc.sendTweet(text)
        self.send_tweet = False
        super(Character, self).save(*args, **kwargs)

    def searchText(self):
        return unicode("%s %s %s" % (self.name, self.description, self.comments))

    def __unicode__(self):
        return unicode("%s -%s-%s-%s-%s" % (self.slug, self.name, self.gender, self.level, self.pncorpc))

    def get_absolute_url(self):
        return unicode(u"%s/%s"%(u"/character",self.slug))

    class Meta:
        db_table = u'character'
        verbose_name = _(u'Character')
        get_latest_by = 'last_updated'
        ordering = ['-last_updated','id']
        #unique_together = ('name', 'parent')


class Creature(models.Model):

    name = models.CharField(max_length=100, blank=False, null=False, verbose_name=_('Nombre completo'))
    gender = models.CharField(max_length=2, blank=True, null=True, choices=GENDER_CHOICES, verbose_name=_('Sexo'))
    hitdice = models.CharField(max_length=100, blank=True, null=True, verbose_name=_('Dados de golpe'))
    AC = models.CharField(max_length=10,blank=True, null=True, verbose_name=_('CA'))
    treasurevalue = models.CharField(max_length=100, blank=True, null=True, verbose_name=_('Tesoro'))
    XPvalue = models.SmallIntegerField(blank=True, null=True, verbose_name=_('Valor PX'))
    move = models.CharField(max_length=100, blank=True, null=True, verbose_name=_('Movimiento'))
    moral = models.CharField(max_length=2, blank=True, null=True, choices=MORAL_CHOICES, verbose_name=_('Moral'))
    saveroll = models.CharField(max_length=20, blank=True, null=True, choices=SAVE_CHOICES, verbose_name=_('TS'))
    alignment = models.CharField(max_length=3, blank=True, null=True, choices=CRE_ALIGN_CHOICES, verbose_name=_('Alineamiento'))
    description = models.TextField(blank=True, null=True, verbose_name=_('Descripcion'))
    languages = models.ManyToManyField("Language", blank=True, null=True, related_name=_('Known languages'))

    attacks = models.TextField(blank=True, null=True, verbose_name=_('Ataques'))

    relatedlocation = models.ManyToManyField('Location', blank=True, null=True, related_name=_('Ubicacion de la criatura'))
    relatedobject = models.ManyToManyField('Object', blank=True, null=True, related_name=_('Objetos de la criatura'))

    deactivated = models.BooleanField(blank=True,  verbose_name=_('Desactivado'))

    image = models.ManyToManyField('Image', blank=True, null=True,  related_name=_("Creature's image"))
    attachments = models.ManyToManyField('AttachFile', blank=True, null=True,  related_name=_("Creature's attachments"))

    relatedcreature = models.ManyToManyField("Creature", blank=True, null=True,  verbose_name=_("Creature Relationship"), through='CreatureRelationship')

    tags = TaggableManager(blank=True)
    #Generic to all objects

    slug = models.SlugField(blank=True,null=True,max_length=200,help_text="A short label, generally used in URLs. AUTOMATICALLY ADDED!")

    comments = models.TextField(blank=True, null=True, verbose_name=_('Comments'))
    author = models.ManyToManyField("Author", blank=True, null=True,  verbose_name=_("Creature's authroship"))
    canon_level = models.CharField(max_length=5, blank=True, null=True, choices=CANON_LEVEL_CHOICES, verbose_name=_('Canon Level'))
    highlight = models.BooleanField(blank=True, verbose_name=_(u'Destacado en categoría'))
    send_tweet = models.BooleanField(blank=True, verbose_name=_('Tweet nueva criatura'))
    creation_date = models.DateTimeField(null=True, verbose_name=_('Creation date'))
    last_updated = models.DateTimeField(null=True, verbose_name=_('Last updated'))

    def save(self, *args, **kwargs):
        unique_slug(self, slug_source='name', slug_field='slug')

        if self.send_tweet:
            twitter_config = TwitterConfig.objects.filter(isActive=True)
            for tc in twitter_config:
                text = tc.createTweet(self)
                status = tc.sendTweet(text)
        self.send_tweet = False
        super(Creature, self).save(*args, **kwargs)


    def searchText(self):
        return unicode("%s %s %s" % (self.name, self.description, self.comments))


    def __unicode__(self):
        return unicode("%s -%s" % (self.name, self.hitdice,))
    def get_absolute_url(self):
        return unicode(u"%s/%s"%(u"/creature",self.slug))
    class Meta:
        db_table = u'creature'
        verbose_name = _(u'Creature')
        get_latest_by = 'order_name'
        ordering = ['-last_updated','id']
        #unique_together = ('name', 'parent')


class Author(models.Model):

    name = models.CharField(max_length='100', blank=False, null=False, verbose_name=_('Nombre completo'))
    nickname =  models.CharField(max_length='100', blank=True, null=True, verbose_name=_('Pseudonimo'))
    otherdata =  models.TextField(blank=True, null=True, verbose_name=_('Otros datos'))
    url =  models.URLField(blank=True, null=True, verify_exists=False, max_length=200, verbose_name=_("Author's web page"))
    photo = models.ManyToManyField('Image', blank=True, null=True,  related_name=_("Author's photos"))

    slug = models.SlugField(blank=True,null=True,max_length=200,help_text="A short label, generally used in URLs. AUTOMATICALLY ADDED!")

    def __unicode__(self):
        return unicode("%s -%s-" % (self.name, self.nickname))
    class Meta:
#        db_table = u'author'
        verbose_name = _(u'Author')
        get_latest_by = 'order_name'
        ordering = ['-name']
        #unique_together = ('name', 'parent')


class CharacterRelationship(models.Model):

    character1 = models.ForeignKey("Character", related_name=_(u"charrelation1"))
    character2 = models.ForeignKey("Character", related_name=_(u"charrelation2"))
    relation12 = models.CharField(max_length=10, blank=True, null=True, choices=CHAR_RELATIONSHIP_CHOICES, verbose_name=_(u'Relationship 1 -> 2'))
    relation21 = models.CharField(max_length=10, blank=True, null=True, choices=CHAR_RELATIONSHIP_CHOICES, verbose_name=_(u'Relationship 2 -> 1'))

    #Generic to all objects

    slug = models.SlugField(blank=True,null=True,max_length=200,help_text="A short label, generally used in URLs. AUTOMATICALLY ADDED!")

    comments = models.TextField(blank=True, null=True, verbose_name=_(u'Comments'))
    author = models.ManyToManyField("Author", blank=True, null=True,  verbose_name=_(u"Character's authroship"))
    canon_level = models.CharField(max_length=5, blank=True, null=True, choices=CANON_LEVEL_CHOICES, verbose_name=_(u'Canon Level'))


    def __unicode__(self):
        return unicode(u"%s -%s- %s -%s- %s" % (self.character1, self.relation12, self.character2, self.relation21, self.character1))
    class Meta:
        db_table = u'character_relationship'
        verbose_name = _(u"Character's Relationship")
        get_latest_by = 'order_character1'
        ordering = ['-character1']
        unique_together = (u'character1', u'character2')


class CreatureRelationship(models.Model):

    creature1 = models.ForeignKey("Creature", related_name=_("crerelation1"))
    creature2 = models.ForeignKey("Creature", related_name=_("crerelation2"))
    relation12 = models.CharField(max_length=10, blank=True, null=True, choices=CRE_RELATIONSHIP_CHOICES, verbose_name=_('Relationship 1 -> 2'))
    relation21 = models.CharField(max_length=10, blank=True, null=True, choices=CRE_RELATIONSHIP_CHOICES, verbose_name=_('Relationship 2 -> 1'))

#Generic to all objects
    comments = models.TextField(blank=True, null=True, verbose_name=_('Comments'))
    author = models.ManyToManyField("Author", blank=True, null=True,  verbose_name=_("Creature's authroship"))
    canon_level = models.CharField(max_length=5, blank=True, null=True, choices=CANON_LEVEL_CHOICES, verbose_name=_('Canon Level'))


    def __unicode__(self):
        return unicode(u"%s -%s- %s -%s- %s" % (self.creature1, self.relation12, self.creature2, self.relation21, self.creature1))
    class Meta:
        db_table = u'creature_relationship'
        verbose_name = _(u"Creature's Relationship")
        get_latest_by = 'order_creature1'
        ordering = ['-creature1']
        unique_together = ('creature1', 'creature2')




class Location(models.Model):
    name = models.CharField(max_length='100', blank=False, null=False, verbose_name=_('Nombre completo'))
    location = models.TextField(blank=True, null=True, verbose_name=_('Ubicacion'))
    description = models.TextField(blank=True, null=True, verbose_name=_('Descripcion'))
    startdate = models.SmallIntegerField(blank=True, null=True, verbose_name=_('Primera aparicion'))
    enddate = models.SmallIntegerField(blank=True, null=True, verbose_name=_('Anyo de desaparicion'))
    status = models.CharField(max_length=5, blank=True, null=True, choices=LOC_STATUS_CHOICES, verbose_name=_('Estado'))
    alignment = models.CharField(max_length=3, blank=True, null=True, choices=ALIGN_CHOICES, verbose_name=_('Alineamiento'))
    loctype = models.CharField(max_length=5, blank=True, null=True, choices=LOC_TYPE_CHOICES, verbose_name=_('Tipo'))
    population = models.IntegerField(blank=True, null=True, verbose_name=_('Population'))
    languages = models.ManyToManyField("Language", blank=True, null=True, related_name=_("Spoken languages"))
    religion = models.ManyToManyField("Religion", blank=True, null=True, related_name=_("Wordshipped Religions"))


    relatedobject = models.ManyToManyField('Object', blank=True, null=True, related_name=_('Objetos en la localizacion'))

    deactivated = models.BooleanField(blank=True, verbose_name=_('Desactivado'))
    image = models.ManyToManyField('Image', blank=True, null=True,  related_name=_("Location's photos"))
    attachments = models.ManyToManyField('AttachFile', blank=True, null=True,  related_name=_("Location's attachments"))

    tags = TaggableManager(blank=True)

    #Generic to all objects

    slug = models.SlugField(blank=True,null=True,max_length=200,help_text="A short label, generally used in URLs. AUTOMATICALLY ADDED!")

    comments = models.TextField(blank=True, null=True, verbose_name=_('Comments'))
    author = models.ManyToManyField("Author", blank=True, null=True,  verbose_name=_("Location's authroship"))
    canon_level = models.CharField(max_length=5, blank=True, null=True, choices=CANON_LEVEL_CHOICES, verbose_name=_('Canon Level'))
    highlight = models.BooleanField(blank=True, verbose_name=_(u'Destacado en categoría'))
    send_tweet = models.BooleanField(blank=True, verbose_name=_(u'Tweet nueva localización'))
    creation_date = models.DateTimeField(null=True, verbose_name=_('Creation date'))
    last_updated = models.DateTimeField(null=True, verbose_name=_('Last updated'))

    def save(self, *args, **kwargs):
        unique_slug(self, slug_source='name', slug_field='slug')
        if self.send_tweet:
            twitter_config = TwitterConfig.objects.filter(isActive=True)
            for tc in twitter_config:
                text = tc.createTweet(self)
                status = tc.sendTweet(text)
        self.send_tweet = False
        super(Location, self).save(*args, **kwargs)

    def searchText(self):
        return unicode(u"%s %s %s" % (self.name, self.description, self.comments))

    def __unicode__(self):
        return unicode(u"%s -%s-%s-%s" % (self.name, self.loctype, self.status, self.alignment))
    def get_absolute_url(self):
        return unicode(u"%s/%s"%(u"/location",self.slug))
    class Meta:
        db_table = u'location'
        verbose_name = _(u"Location")
        get_latest_by = 'order_name'
        ordering = ['-last_updated','id']
        #unique_together = ('name')


class CharacterLocationRelationship(models.Model):

    character = models.ForeignKey("Character", related_name=_("charlocation"))
    location = models.ForeignKey("Location", related_name=_("loccharacter"))
    relation = models.CharField(max_length=10, blank=True, null=True, choices=CHARLOC_RELATIONSHIP_CHOICES, verbose_name=_('CharLocRelationship'))

#Generic to all objects
    comments = models.TextField(blank=True, null=True, verbose_name=_('Comments'))
    author = models.ManyToManyField("Author", blank=True, null=True,  verbose_name=_("Relation authorship"))
    canon_level = models.CharField(max_length=5, blank=True, null=True, choices=CANON_LEVEL_CHOICES, verbose_name=_('Canon Level'))


    def __unicode__(self):
        return unicode(u"%s -%s- %s" % (self.character, self.location, self.relation))
    class Meta:
        db_table = u'charloc_relationship'
        verbose_name = _(u"Character-Location Relationship")
        get_latest_by = 'order_character'
        ordering = ['-character']
        unique_together = ('character', 'location')


class Object(models.Model):
    name = models.CharField(max_length='100', blank=False, null=False, verbose_name=_('Nombre completo'))
    description = models.TextField(blank=True, null=True, verbose_name=_('Descripcion'))
    status = models.CharField(max_length=5, blank=True, null=True, choices=OBJ_STATUS_CHOICES, verbose_name=_('Estado'))
    alignment = models.CharField(max_length=3, blank=True, null=True, choices=ALIGN_CHOICES, verbose_name=_('Alineamiento'))
    objtype = models.CharField(max_length=5, blank=True, null=True, choices=OBJ_TYPE_CHOICES, verbose_name=_('Tipo'))
    rarity = models.CharField(max_length=3, blank=True, null=True, choices=OBJ_RARITY_CHOICES, verbose_name=_('Rareza'))
    properties = models.TextField(blank=True, null=True, verbose_name=_('Propiedades'))
    ppvalue = models.SmallIntegerField(blank=True, null=True, default=0, verbose_name=_('Valor platino'))
    gpvalue = models.SmallIntegerField(blank=True, null=True, default=0,verbose_name=_('Valor oro'))
    spvalue = models.SmallIntegerField(blank=True, null=True, default=0,verbose_name=_('Valor plata'))
    cpvalue = models.SmallIntegerField(blank=True, null=True, default=0,verbose_name=_('Valor cobre'))
    fabvalue = models.BooleanField(blank=True,  verbose_name=_('Valor incalculable'))

    deactivated = models.BooleanField(blank=True,verbose_name=_('Desactivado'))

    image = models.ManyToManyField('Image', blank=True, null=True,  related_name=_("Object's photos"))
    attachments = models.ManyToManyField('AttachFile', blank=True, null=True,  related_name=_("Object's attachments"))


    relatedobject = models.ManyToManyField("Object", through='ObjectRelationship')

    tags = TaggableManager(blank=True)

    #Generic to all objects

    slug = models.SlugField(blank=True,null=True,max_length=200,help_text="A short label, generally used in URLs. AUTOMATICALLY ADDED!")

    comments = models.TextField(blank=True, null=True, verbose_name=_('Comments'))
    author = models.ManyToManyField("Author", blank=True, null=True,  verbose_name=_("Object's authroship"))
    canon_level = models.CharField(max_length=5, blank=True, null=True, choices=CANON_LEVEL_CHOICES, verbose_name=_('Canon Level'))
    highlight = models.BooleanField(blank=True, verbose_name=_(u'Destacado en categoría'))
    send_tweet = models.BooleanField(blank=True, verbose_name=_('Tweet nuevo objeto'))
    creation_date = models.DateTimeField(null=True, verbose_name=_('Creation date'))
    last_updated = models.DateTimeField(null=True, verbose_name=_('Last updated'))


    def save(self, *args, **kwargs):
        unique_slug(self, slug_source='name', slug_field='slug')
        if self.send_tweet:
            twitter_config = TwitterConfig.objects.filter(isActive=True)
            for tc in twitter_config:
                text = tc.createTweet(self)
                status = tc.sendTweet(text)
        self.send_tweet = False

        super(Object, self).save(*args, **kwargs)

    def searchText(self):
        return unicode(u"%s %s %s" % (self.name, self.description, self.comments))

    def getValue(self):
        if self.fabvalue: return _("Incalculable")
        valuestring = ""
        if self.ppvalue: valuestring+="%s mP"%(self.ppvalue)
        if self.gpvalue: valuestring+="%s mo"%(self.gpvalue)
        if self.spvalue: valuestring+="%s mp"%(self.spvalue)
        if self.cpvalue: valuestring+="%s mc"%(self.cpvalue)
        return valuestring#"%i mP %i mo %i mp %i mc"%(self.ppvalue,self.gpvalue,self.spvalue,self.cpvalue)

    def __unicode__(self):
        return unicode(u"%s -%s-%s-%s" % (self.name, self.objtype, self.status, self.alignment))
    def get_absolute_url(self):
        return unicode(u"%s/%s"%(u"/object",self.slug))
    class Meta:
        db_table = u'object'
        verbose_name = _(u"Object")
        get_latest_by = 'order_name'
        ordering = ['-last_updated','id']
        #unique_together = ('name')


class ObjectRelationship(models.Model):

    object1 = models.ForeignKey("Object", related_name=_("objrelation1"))
    object2 = models.ForeignKey("Object", related_name=_("objrelation2"))
    relation12 = models.CharField(max_length=10, blank=True, null=True, choices=OBJ_RELATIONSHIP_CHOICES, verbose_name=_('Relationship 1 -> 2'))
    relation21 = models.CharField(max_length=10, blank=True, null=True, choices=OBJ_RELATIONSHIP_CHOICES, verbose_name=_('Relationship 2 -> 1'))

#Generic to all objects
    comments = models.TextField(blank=True, null=True, verbose_name=_('Comments'))
    author = models.ManyToManyField("Author", blank=True, null=True,  verbose_name=_("Object Relationship's authroship"))
    canon_level = models.CharField(max_length=5, blank=True, null=True, choices=CANON_LEVEL_CHOICES, verbose_name=_('Canon Level'))


    def __unicode__(self):
        return unicode(u"%s -%s- %s -%s- %s" % (self.object1, self.relation12, self.object2, self.relation21, self.object1))
    class Meta:
        db_table = u'object_relationship'
        verbose_name = _(u"Object's Relationship")
        get_latest_by = 'order_object1'
        ordering = ['-object1']
        unique_together = ('object1', 'object2')



class Adventure(models.Model):

    name = models.CharField(max_length='100', blank=False, null=False, verbose_name=_('Nombre completo'))
    description =  models.TextField(blank=True, null=True, verbose_name=_('Descripcion'))
    url =  models.URLField(blank=True, null=True, verify_exists=False, max_length=200, verbose_name=_('URL'))
    price = models.CharField(max_length='50', blank=True, null=True, choices=PRICE_RANGES, verbose_name=_('Price'))
    sessions = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Game sessions'))
    minnumplayers = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Minimum number of players'))
    maxnumplayers = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Maximum number of players'))
    minlevel = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Minimum level of players'))
    maxlevel = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Maximum level of players'))
    image = models.ManyToManyField('Image', blank=True, null=True,  related_name=_("Adventure's photos"))
    attachments = models.ManyToManyField('AttachFile', blank=True, null=True,  related_name=_("Adventure's attachments"))

    tags = TaggableManager(blank=True)

    #Generic to all objects

    slug = models.SlugField(blank=True,null=True,max_length=200,help_text="A short label, generally used in URLs. AUTOMATICALLY ADDED!")

    comments = models.TextField(blank=True, null=True, verbose_name=_('Comments'))
    author = models.ManyToManyField("Author", blank=True, null=True,  verbose_name=_("Adventure's authorship"))
    canon_level = models.CharField(max_length=5, blank=True, null=True, choices=CANON_LEVEL_CHOICES, verbose_name=_('Canon Level'))
    highlight = models.BooleanField(blank=True, verbose_name=_(u'Destacado en categoría'))
    send_tweet = models.BooleanField(blank=True, verbose_name=_('Tweet nueva aventura'))
    creation_date = models.DateTimeField(null=True, verbose_name=_('Creation date'))
    last_updated = models.DateTimeField(null=True, verbose_name=_('Last updated'))

    def save(self, *args, **kwargs):
        unique_slug(self, slug_source='name', slug_field='slug')

        if self.send_tweet:
            twitter_config = TwitterConfig.objects.filter(isActive=True)
            for tc in twitter_config:
                text = tc.createTweet(self)
                status = tc.sendTweet(text)
        self.send_tweet = False

        super(Adventure, self).save(*args, **kwargs)

    def searchText(self):
        return unicode(u"%s %s %s" % (self.name, self.description, self.comments))

    def __unicode__(self):
        return unicode(u"%s" % (self.name,))
    def get_absolute_url(self):
        return unicode(u"%s/%s"%(u"/adventure",self.slug))
    class Meta:
#        db_table = u'author'
        verbose_name = _(u'Adventure')
        get_latest_by = 'order_name'
        ordering = ['-last_updated','id']
        #unique_together = ('name', 'parent')


class Chronicle(models.Model):

    name = models.CharField(max_length='100', blank=False, null=False, verbose_name=_('Nombre completo'))
    description =  models.TextField(blank=True, null=True, verbose_name=_('Descripcion'))
    url =  models.URLField(blank=True, null=True, verify_exists=False, max_length=200, verbose_name=_('URL'))
    adventure = models.ForeignKey("Adventure", blank=True, null=True,  verbose_name=_("Related Adventure"))

    attachments = models.ManyToManyField('AttachFile', blank=True, null=True,  related_name=_("Chronicle's attachments"))

    tags = TaggableManager(blank=True)

    #Generic to all objects

    slug = models.SlugField(blank=True,null=True,max_length=200,help_text="A short label, generally used in URLs. AUTOMATICALLY ADDED!")

    comments = models.TextField(blank=True, null=True, verbose_name=_('Comments'))
    author = models.ManyToManyField("Author", blank=True, null=True,  verbose_name=_("Chronicle's authorship"))
    canon_level = models.CharField(max_length=5, blank=True, null=True, choices=CANON_LEVEL_CHOICES, verbose_name=_('Canon Level'))
    highlight = models.BooleanField(blank=True, verbose_name=_(u'Destacado en categoría'))
    send_tweet = models.BooleanField(blank=True, verbose_name=_(u'Tweet nueva crónica'))
    creation_date = models.DateTimeField(null=True, verbose_name=_('Creation date'))
    last_updated = models.DateTimeField(null=True, verbose_name=_('Last updated'))

    def save(self, *args, **kwargs):
        unique_slug(self, slug_source='name', slug_field='slug')
        if self.send_tweet:
            twitter_config = TwitterConfig.objects.filter(isActive=True)
            for tc in twitter_config:
                text = tc.createTweet(self)
                status = tc.sendTweet(text)
        self.send_tweet = False

        super(Chronicle, self).save(*args, **kwargs)

    def searchText(self):
        return unicode(u"%s %s %s" % (self.name, self.description, self.comments))

    def __unicode__(self):
        return unicode(u"%s" % (self.name,))
    def get_absolute_url(self):
        return unicode(u"%s/%s"%(u"/chronicle",self.slug))
    class Meta:
#        db_table = u'author'
        verbose_name = _(u'Chronicle')
        get_latest_by = 'order_name'
        ordering = ['-last_updated','id']
        #unique_together = ('name', 'parent')


class Language(models.Model):
        name = models.CharField(max_length='100', blank=False, null=False, verbose_name=_('Nombre del idioma'))
        description =  models.TextField(blank=True, null=True, verbose_name=_('Descripcion'))

        tags = TaggableManager(blank=True)

        #Generic to all objects
        slug = models.SlugField(blank=True,null=True,max_length=200,help_text="A short label, generally used in URLs. AUTOMATICALLY ADDED!")

        comments = models.TextField(blank=True, null=True, verbose_name=_('Comments'))
        author = models.ManyToManyField("Author", blank=True, null=True,  verbose_name=_("Language's authorship"))
        canon_level = models.CharField(max_length=5, blank=True, null=True, choices=CANON_LEVEL_CHOICES, verbose_name=_('Canon Level'))


        def __unicode__(self):
            return unicode(u"%s" % (self.name,))
        class Meta:
            db_table = u'language'
            verbose_name = _(u'Language')
            get_latest_by = 'order_name'
            ordering = ['-name']
        #unique_together = ('name', 'parent')

class Religion(models.Model):
        name = models.CharField(max_length='100', blank=False, null=False, verbose_name=_('Nombre de la religion'))
        description =  models.TextField(blank=True, null=True, verbose_name=_('Descripcion'))

        tags = TaggableManager(blank=True)

        #Generic to all objects

        slug = models.SlugField(blank=True,null=True,max_length=200,help_text="A short label, generally used in URLs. AUTOMATICALLY ADDED!")

        comments = models.TextField(blank=True, null=True, verbose_name=_('Comments'))
        author = models.ManyToManyField("Author", blank=True, null=True,  verbose_name=_("Religion's authorship"))
        canon_level = models.CharField(max_length=5, blank=True, null=True, choices=CANON_LEVEL_CHOICES, verbose_name=_('Canon Level'))


        def __unicode__(self):
            return unicode(u"%s" % (self.name,))
        class Meta:
            db_table = u'religion'
            verbose_name = _(u'religion')
            get_latest_by = 'order_name'
            ordering = ['-name']
        #unique_together = ('name', 'parent')

class Image(models.Model):
    name = models.CharField(max_length='100', blank=False, null=False, verbose_name=_('Nombre de la imagen'))
    description =  models.TextField(blank=True, null=True, verbose_name=_('Descripcion'))
    image = models.ImageField(upload_to='img/', blank=True, null=True,  verbose_name=_("Image field"))

    #Generic to all objects

    slug = models.SlugField(blank=True,null=True,max_length=200,help_text="A short label, generally used in URLs. AUTOMATICALLY ADDED!")

    comments = models.TextField(blank=True, null=True, verbose_name=_('Comments'))
    author = models.ManyToManyField("Author", blank=True, null=True,  verbose_name=_("Image's authorship"))
    canon_level = models.CharField(max_length=5, blank=True, null=True, choices=CANON_LEVEL_CHOICES, verbose_name=_('Canon Level'))
    date = models.DateField(verbose_name=_('Creation date'))

    def __unicode__(self):
        return unicode(u"%s" % (self.name,))
    class Meta:
        db_table = u'image'
        verbose_name = _(u'image')
        get_latest_by = 'order_name'
        ordering = ['-name']
        #unique_together = ('name', 'parent')

class AttachFile(models.Model):
    name = models.CharField(max_length='100', blank=False, null=False, verbose_name=_('Nombre del fichero'))
    description =  models.TextField(blank=True, null=True, verbose_name=_('Descripcion'))
    content = models.FileField(upload_to='files/', blank=True, null=True,  verbose_name=_("Content field"))

    #Generic to all objects

    slug = models.SlugField(blank=True,null=True,max_length=200,help_text="A short label, generally used in URLs. AUTOMATICALLY ADDED!")

    comments = models.TextField(blank=True, null=True, verbose_name=_('Comments'))
    author = models.ManyToManyField("Author", blank=True, null=True,  verbose_name=_("Content's authorship"))
    canon_level = models.CharField(max_length=5, blank=True, null=True, choices=CANON_LEVEL_CHOICES, verbose_name=_('Canon Level'))
    date = models.DateField(verbose_name=_('Creation date'))

    def __unicode__(self):
        return unicode(u"%s" % (self.name,))
    class Meta:
        db_table = u'attachfile'
        verbose_name = _(u'content')
        get_latest_by = 'order_name'
        ordering = ['-name']
        #unique_together = ('name', 'parent')

class TwitterConfig(models.Model):
    name = models.CharField(max_length=100, blank=False, null=False, verbose_name=_("Configuration name"))
    isActive = models.BooleanField(blank=True, verbose_name=_(u"Configuración activa"))
    twitter_user = models.CharField(max_length=100, blank=False, null=False, verbose_name=_("Twitter User Name"))
    consumer_key = models.CharField(max_length=100, blank=False, null=False, verbose_name=_("Twitter Consumer key"))
    consumer_secret = models.CharField(max_length=100, blank=False, null=False, verbose_name=_("Twitter Consumer secret"))
    access_token_key = models.CharField(max_length=100, blank=False, null=False, verbose_name=_("Twitter Access Token key"))
    access_token_secret = models.CharField(max_length=100, blank=False, null=False, verbose_name=_("Twitter Access Token secret"))
    forward_user = models.CharField(max_length=100, blank=True, null=True, verbose_name=_("User to add to Tweet"))

    #Config message structure
    tweet_template = models.CharField(max_length=96, blank=False, null=False, default= "Nueva entrada: %s http://codexdelamarca.com%s/ @%s", verbose_name=_(u"Mensaje para Twitter"))

    def __unicode__(self):
        return unicode(u"%s" % (self.name,))

    class Meta:
        db_table = u'twitterconfig'
        verbose_name = _(u'twitterconfig')

    def validate(self):
        try:
            return Api(consumer_key=self.consumer_key, consumer_secret=self.consumer_secret, access_token_key=self.access_token_key, access_token_secret=self.access_token_secret)
        except Exception, e:
            return e

    def createTweet(self, obj):
        tweet = self.tweet_template % (obj.name, obj.get_absolute_url(), self.forward_user)
        return tweet

    def sendTweet(self, tweet_text):
        api = self.validate()

        try:
            status = api.PostUpdate(tweet_text)
        except Exception, e:
            status = e
        return status


def unique_slug(item,slug_source,slug_field):
  """Ensures a unique slug field by appending an integer counter to duplicate slugs.

  The item's slug field is first prepopulated by slugify-ing the source field. If that value already exists, a counter is appended to the slug, and the counter incremented upward until the value is unique.

  For instance, if you save an object titled Daily Roundup, and the slug daily-roundup is already taken, this function will try daily-roundup-2, daily-roundup-3, daily-roundup-4, etc, until a unique value is found.

  Call from within a model's custom save() method like so:
  unique_slug(item, slug_source='field1', slug_field='field2')
  where the value of field slug_source will be used to prepopulate the value of slug_field.
  """
  if not getattr(item, slug_field): # if it's already got a slug, do nothing.
      from django.template.defaultfilters import slugify
      slug = slugify(getattr(item,slug_source))
      itemModel = item.__class__
      # the following gets all existing slug values
      allSlugs = [sl.values()[0] for sl in itemModel.objects.values(slug_field)]
      if slug in allSlugs:
          import re
          counterFinder = re.compile(r'-\d+$')
          counter = 2
          slug = "%s-%i" % (slug, counter)
          while slug in allSlugs:
              slug = re.sub(counterFinder,"-%i" % counter, slug)
              counter += 1
      setattr(item,slug_field,slug)

