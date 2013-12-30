#!/usr/bin/python
# -*- coding: utf-8 -*-

from django.db import models

from django.utils.translation import ugettext_lazy as _
from taggit.managers import TaggableManager
from twitter import Api

from django.utils import simplejson

import modelschoices as mc

# Create your models here.

class MainEntity(models.Model):
    """
    Valid for the main classes such as Character, Location, Creature, etc.
    """
    
    name = models.CharField(max_length=100, blank=False, null=False,                            verbose_name=_('Full name'))
    description = models.TextField(blank=True, null=True, verbose_name=_('Description'))
    
    image = models.ManyToManyField('Image', blank=True, null=True,  related_name=_("%(class)s Image"))
    attachments = models.ManyToManyField('AttachFile', blank=True, null=True,  related_name=_("%(class)s attachments"))
    
    tags = TaggableManager(blank=True)
    slug = models.SlugField(blank=True, null=True, max_length=200, help_text="A short label, generally used in URLs. AUTOMATICALLY ADDED!")
    
    comments = models.TextField(blank=True, null=True, verbose_name=_('Comments'))
    author = models.ManyToManyField("Author", blank=True, null=True,  verbose_name=_("Entity's authorship"))
    canon_level = models.CharField(max_length=5, blank=True, null=True, choices=mc.CANON_LEVEL_CHOICES, verbose_name=_('Canon Level'))
    highlight = models.BooleanField(blank=True, verbose_name=_(u'Highlight'))
    send_tweet = models.BooleanField(blank=True, verbose_name=_('Tweet new entity'))
    
    creation_date = models.DateTimeField(null=True, verbose_name=_('Creation date'))
    last_updated = models.DateTimeField(null=True, verbose_name=_('Last updated'))

    deactivated = models.BooleanField(blank=True, verbose_name=_('Deactivated'))
    
    def save(self, *args, **kwargs):
        unique_slug(self, slug_source='name', slug_field='slug')
        #FIXME - Send tweet goes here 
        super(MainEntity, self).save(*args, **kwargs) #FIXME
                
    def searchText(self):
        return unicode("{name - description - comments}".format(name=self.name, description=self.description, comments=self.comments))
                
    def __unicode__(self):
        #return unicode("%s -%s-%s-%s-%s" % (self.slug, self.name))
        return unicode("{slug}: {name}".format(slug=self.slug, name=self.name))
                
    def get_absolute_url(self):
        #return unicode(u"%s/%s"%(u"/class.__name___",self.slug))
        return unicode("{ctype}/{slug}".format(ctype="/"+class.__name__.lower(),slug=self.slug))
        
    class Meta:
        db_table = class.__name__
        verbose_name = _(class.__name__)
        get_latest_by = 'last_updated'
        ordering = ['-last_updated','id']
        abstract = True

class AuxiliaryEntity(models.Model):
    """
    Valid for auxiliary classes such as Image, Language, Religion, etc.
    """
    
    name = models.CharField(max_length=100, blank=False, null=False,                            verbose_name=_('Full name'))
    description = models.TextField(blank=True, null=True, verbose_name=_('Description'))
    date = models.DateField(verbose_name=_('Creation date'))
    image = models.ManyToManyField('Image', blank=True, null=True,  related_name=_("%(class)s Image"))
    tags = TaggableManager(blank=True)
    comments = models.TextField(blank=True, null=True, verbose_name=_('Comments'))
    author = models.ManyToManyField("Author", blank=True, null=True,  verbose_name=_("Entity's authorship"))
    canon_level = models.CharField(max_length=5, blank=True, null=True, choices=mc.CANON_LEVEL_CHOICES, verbose_name=_('Canon Level'))

    deactivated = models.BooleanField(blank=True, verbose_name=_('Deactivated'))
    creation_date = models.DateTimeField(null=True, verbose_name=_('Creation date'))
    last_updated = models.DateTimeField(null=True, verbose_name=_('Last updated'))

    def __unicode__(self):
        return unicode("{slug}: {name}".format(slug=self.slug, name=self.name))
    
    def get_absolute_url(self):
        return unicode("{ctype}/{slug}".format(ctype="/"+class.__name__.lower(),slug=self.slug))
    
    class Meta:
        db_table = class.__name__
        verbose_name = _(class.__name__)
        get_latest_by = 'last_updated'
        ordering = ['-last_updated','id']
        abstract = True

class RelationEntity(models.Model):

    comments = models.TextField(blank=True, null=True, verbose_name=_('Comments'))
    canon_level = models.CharField(max_length=5, blank=True, null=True, choices=mc.CANON_LEVEL_CHOICES, verbose_name=_('Canon Level'))
    deactivated = models.BooleanField(blank=True, verbose_name=_('Deactivated'))

    def __unicode__(self):
        return unicode("{id}".format(id=self.id))
    
    class Meta:
        db_table = class.__name__
        verbose_name = _(class.__name__)
        get_latest_by = 'last_updated'
        ordering = ['-last_updated','id']
        abstract = True


# -------- ### --------- #

# -------- Self contained classes -------- #

class Author(models.Model):
    
    name = models.CharField(max_length='100', blank=False, null=False, verbose_name=_('Full name'))
    nickname =  models.CharField(max_length='100', blank=True, null=True, verbose_name=_('Nickname'))
    otherdata =  models.TextField(blank=True, null=True, verbose_name=_('Other data'))
    url =  models.URLField(blank=True, null=True,  max_length=200, verbose_name=_("Author's web page"))
    photo = models.ManyToManyField('Image', blank=True, null=True,  related_name=_("Author's photos"))
    slug = models.SlugField(blank=True,null=True,max_length=200,help_text="A short label, generally used in URLs. AUTOMATICALLY ADDED!")
    
    def __unicode__(self):
        return unicode("%s -%s-" % (self.name, self.nickname))

    class Meta:
        db_table = class.__name__
        verbose_name = _(u'Author')
        get_latest_by = 'order_name'
        ordering = ['-name']


# -------- Main classes -------- #

class Character(MainEntity):

    gender = models.CharField(max_length=2, blank=True, null=True,
        choices=mc.GENDER_CHOICES, verbose_name=_('Gender'))
    level = models.CharField(max_length=3, blank=True, null=True,
        choices=mc.LEVEL_CHOICES, verbose_name=_('Level'))
    age = models.CharField(max_length=10, blank=True, null=True,
        verbose_name=_('Age'))
    AC = models.CharField(max_length=100, blank=True, null=True,
        verbose_name=_('AC'))
    move = models.CharField(max_length=100, blank=True, null=True,
        verbose_name=_('Movement'))
    moral = models.CharField(max_length=2, blank=True, null=True,
        choices=mc.MORAL_CHOICES, verbose_name=_('Moral'))
    saveroll = models.CharField(max_length=20, blank=True, null=True, choices=mc.SAVE_CHOICES, verbose_name=_('Save roll'))
    hitpoints = models.CharField(max_length=100, blank=True, null=True, verbose_name=_('Hitpoints'))
    alignment = models.CharField(max_length=3, blank=True, null=True, choices=mc.ALIGN_CHOICES, verbose_name=_('Alignment'))
    quote = models.TextField(blank=True, null=True, verbose_name=_('Quote'))
    species = models.CharField(max_length=30, blank=True, null=True, choices=mc.SPECIES_CHOICES, verbose_name=_('Species'))
    profession = models.CharField(max_length=30, blank=True, null=True, choices=mc.PROFESSION_CHOICES, verbose_name=_('Profession'))
    startdate = models.SmallIntegerField(blank=True, null=True,verbose_name=_('First appearance'))
    enddate = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Disappearance date'))

    strengthstat = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Strength'))
    dexteritystat = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Dexterity'))
    constitutionstat = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Contitution'))
    intelligencestat = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Intelligence'))
    wisdomstat = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Wisdom'))
    charismastat = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Charisma'))

    religion = models.ManyToManyField("Religion", blank=True, null=True, related_name=_("Character's Religions"))

    treasurevalue = models.CharField(max_length=100, blank=True, null=True, verbose_name=_("Character's Treasure value"))

    status = models.CharField(max_length=5, blank=True, null=True, choices=mc.CHAR_STATUS_CHOICES, verbose_name=_('Status'))

    weapons = models.TextField(blank=True, null=True, verbose_name=_('Attacks'))
    pncorpc = models.CharField(max_length=3, blank=True, null=True, choices=mc.PNJ_CHOICES, verbose_name=_('NPC/PC'))

    languages = models.ManyToManyField("Language", blank=True, null=True, related_name=_("Character's Known languages"))

    relatedlocation = models.ManyToManyField('Location', blank=True, null=True, related_name=_('Location'))
    relatedobject = models.ManyToManyField('Object', blank=True, null=True, related_name=_('Objects'))

    relatedcharacter = models.ManyToManyField("Character", blank=True, null=True,  verbose_name=_("Character Relationship"), through='CharacterRelationship')


class Creature(MainEntity):

    gender = models.CharField(max_length=2, blank=True, null=True, choices=mc.GENDER_CHOICES, verbose_name=_('Sexo'))
    hitdice = models.CharField(max_length=100, blank=True, null=True, verbose_name=_('Dados de golpe'))
    AC = models.CharField(max_length=10,blank=True, null=True, verbose_name=_('CA'))
    treasurevalue = models.CharField(max_length=100, blank=True, null=True, verbose_name=_('Tesoro'))
    XPvalue = models.IntegerField(blank=True, null=True, verbose_name=_('Valor PX'))
    move = models.CharField(max_length=100, blank=True, null=True, verbose_name=_('Movimiento'))
    moral = models.CharField(max_length=2, blank=True, null=True, choices=mc.MORAL_CHOICES, verbose_name=_('Moral'))
    saveroll = models.CharField(max_length=20, blank=True, null=True, choices=mc.SAVE_CHOICES, verbose_name=_('TS'))
    alignment = models.CharField(max_length=3, blank=True, null=True, choices=mc.CRE_ALIGN_CHOICES, verbose_name=_('Alineamiento'))
    languages = models.ManyToManyField("Language", blank=True, null=True, related_name=_('Known languages'))

    attacks = models.TextField(blank=True, null=True, verbose_name=_('Ataques'))

    relatedlocation = models.ManyToManyField('Location', blank=True, null=True, related_name=_('Ubicacion de la criatura'))
    relatedencountersetting = models.ManyToManyField('EncounterSetting', blank=True, null=True, related_name=_('Creature Encounter Setting'))
    relatedobject = models.ManyToManyField('Object', blank=True, null=True, related_name=_('Objetos de la criatura'))

    relatedcreature = models.ManyToManyField("Creature", blank=True, null=True,  verbose_name=_("Creature Relationship"), through='CreatureRelationship')

    def getAllRelationTitles(self, title='ALL'):
        creatures_with_relation = self.relatedcreature.all()
        if len(creatures_with_relation) == 0: return None

        creature_query = {}

        for creature in creatures_with_relation:
            creaturerelationlist1 = CreatureRelationship.objects.filter(creature1__name = self.name, creature2__name = creature.name)
            creaturerelationlist2 = CreatureRelationship.objects.filter(creature1__name = creature.name, creature2__name = self.name)

        for crearelationship in creaturerelationlist1:
            # for each relation the first in the tuple is the one who "is" the relation from the other
            if crearelationship.relation12 in creature_query.keys():
                creature_query[crearelationship.relation12].append((self, crearelationship.creature2))
            else:
                creature_query[crearelationship.relation12] = [(self, crearelationship.creature2)]
        for crearelationship in creaturerelationlist2:
            # for each relation the first in the tuple is the one who "is" the relation from the other
            if crearelationship.relation21 in creature_query.keys():
                creature_query[crearelationship.relation21].append((crearelationship.creature1, self))
            else:
                creature_query[crearelationship.relation21] = [(crearelationship.creature1, self)]

        if title == 'ALL':
            return creature_query
        else:
            return creature_query[title] # modificar para que puedan ser varios?


class Location(MainEntity):
    location = models.TextField(blank=True, null=True, verbose_name=_('Ubicacion'))
    startdate = models.SmallIntegerField(blank=True, null=True, verbose_name=_('Primera aparicion'))
    enddate = models.SmallIntegerField(blank=True, null=True, verbose_name=_('Anyo de desaparicion'))
    status = models.CharField(max_length=5, blank=True, null=True, choices=mc.LOC_STATUS_CHOICES, verbose_name=_('Estado'))
    alignment = models.CharField(max_length=3, blank=True, null=True, choices=mc.ALIGN_CHOICES, verbose_name=_('Alineamiento'))
    loctype = models.CharField(max_length=5, blank=True, null=True, choices=mc.LOC_TYPE_CHOICES, verbose_name=_('Tipo'))
    population = models.IntegerField(blank=True, null=True, verbose_name=_('Population'))
    languages = models.ManyToManyField("Language", blank=True, null=True, related_name=_("Spoken languages"))
    religion = models.ManyToManyField("Religion", blank=True, null=True, related_name=_("Wordshipped Religions"))

    relatedobject = models.ManyToManyField('Object', blank=True, null=True, related_name=_('Objetos en la localizacion'))
    relatedencountersetting = models.ManyToManyField('EncounterSetting', blank=True, null=True, related_name=_('Location Encounter Setting'))
    relatedcharacter = models.ManyToManyField("Character", blank=True, null=True,  verbose_name=_("Character Relationship"), through='CharacterLocationRelationship')


class Object(MainEntity):

    status = models.CharField(max_length=5, blank=True, null=True, choices=mc.OBJ_STATUS_CHOICES, verbose_name=_('Estado'))
    alignment = models.CharField(max_length=3, blank=True, null=True, choices=mc.ALIGN_CHOICES, verbose_name=_('Alineamiento'))
    objtype = models.CharField(max_length=5, blank=True, null=True, choices=mc.OBJ_TYPE_CHOICES, verbose_name=_('Tipo'))
    rarity = models.CharField(max_length=3, blank=True, null=True, choices=mc.OBJ_RARITY_CHOICES, verbose_name=_('Rareza'))
    properties = models.TextField(blank=True, null=True, verbose_name=_('Propiedades'))
    ppvalue = models.SmallIntegerField(blank=True, null=True, default=0, verbose_name=_('Valor platino'))
    gpvalue = models.SmallIntegerField(blank=True, null=True, default=0,verbose_name=_('Valor oro'))
    spvalue = models.SmallIntegerField(blank=True, null=True, default=0,verbose_name=_('Valor plata'))
    cpvalue = models.SmallIntegerField(blank=True, null=True, default=0,verbose_name=_('Valor cobre'))
    fabvalue = models.BooleanField(blank=True,  verbose_name=_('Valor incalculable'))

    relatedobject = models.ManyToManyField("Object", through='ObjectRelationship')
    relatedencountersetting = models.ManyToManyField('EncounterSetting', blank=True, null=True, related_name=_('Object Encounter Setting'))

    def getValue(self):
        if self.fabvalue: return _("Incalculable")
        valuestring = ""
        if self.ppvalue: valuestring+="%s mP"%(self.ppvalue)
        if self.gpvalue: valuestring+="%s mo"%(self.gpvalue)
        if self.spvalue: valuestring+="%s mp"%(self.spvalue)
        if self.cpvalue: valuestring+="%s mc"%(self.cpvalue)
        return valuestring#"%i mP %i mo %i mp %i mc"%(self.ppvalue,self.gpvalue,self.spvalue,self.cpvalue)

class Adventure(MainEntity):

    url =  models.URLField(blank=True, null=True,  max_length=200, verbose_name=_('URL'))
    price = models.CharField(max_length='50', blank=True, null=True, choices=mc.PRICE_RANGES, verbose_name=_('Price'))
    sessions = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Game sessions'))
    minnumplayers = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Minimum number of players'))
    maxnumplayers = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Maximum number of players'))
    minlevel = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Minimum level of players'))
    maxlevel = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Maximum level of players'))


class Chronicle(MainEntity):

    url =  models.URLField(blank=True, null=True,  max_length=200, verbose_name=_('URL'))
    adventure = models.ForeignKey("Adventure", blank=True, null=True,  verbose_name=_("Related Adventure"))


class Rule(MainEntity):

    url =  models.URLField(blank=True, null=True,  max_length=200, verbose_name=_('URL'))
    affectedsections = models.ManyToManyField('RuleSection', blank=True, null=True,  related_name=_("Rule's target sections"))


class Spell(MainEntity):

    level = models.SmallIntegerField(blank=True, null=True,verbose_name=_('Spell level'))
    duration = models.CharField(max_length='200', blank=False, null=False, verbose_name=_('Duration'))
    reach = models.CharField(max_length='200', blank=False, null=False, verbose_name=_('Alcance'))
    reversible = models.BooleanField(blank=True, verbose_name=_(u'Reversible'))
    affectedclassrace = models.ManyToManyField('ClassRace', blank=True, null=True,  related_name=_("ClassRace target sections"))


class Fanart(MainEntity):

    chosenlicense = models.CharField(max_length=10, blank=True, null=True,
        choices=mc.FANART_LICENSE_CHOICES, verbose_name=_('License'))
    chosencategory = models.CharField(max_length=10, blank=True, null=True,
        choices=mc.FANART_CATEGORY_CHOICES, verbose_name=_('Category'))
    chosentype = models.CharField(max_length=10, blank=True, null=True,
        choices=mc.FANART_TYPE_CHOICES, verbose_name=_('Type'))
    thumbnail = models.ForeignKey('ThumbnailImage', blank=True, null=True,
        verbose_name=_(u'FanArt thumbnail'))


# -------- Auxiliary classes -------- #

class ClassRace(AuxiliaryEntity):
    pass

class Language(AuxiliaryEntity):
    pass

class Religion(AuxiliaryEntity):
    pass

class Image(AuxiliaryEntity):
    pass

class ThumbnailImage(models.Model):
    image = models.ImageField(upload_to='img/thumbnail/', blank=True, null=True
                              , verbose_name=_("Image field"))

class RuleSection(AuxiliaryEntity):
    pass

class EncounterSetting(AuxiliaryEntity):
    # Setting for an encounter eg. desert. wood, village, dungeon.
    # To add the encounter probabilities for a setting
    pass


class AttachFile(models.Model):
    content = models.FileField(upload_to='files/', blank=True, null=True,  verbose_name=_("Content field"))


## Relation Entities 

class CharacterRelationship(RelationEntity):

    character1 = models.ForeignKey("Character", related_name=_(u"charrelation1"))
    character2 = models.ForeignKey("Character", related_name=_(u"charrelation2"))
    relation12 = models.CharField(max_length=10, blank=True, null=True, choices=mc.CHAR_RELATIONSHIP_CHOICES, verbose_name=_(u'Relationship 1 -> 2'))
    relation21 = models.CharField(max_length=10, blank=True, null=True, choices=mc.CHAR_RELATIONSHIP_CHOICES, verbose_name=_(u'Relationship 2 -> 1'))

    class Meta:
        db_table = class.__name__
        verbose_name = _(class.__name__)
        get_latest_by = 'order_character1'
        ordering = ['-character1']
        unique_together = (u'character1', u'character2')


class CreatureRelationship(RelationEntity):

    creature1 = models.ForeignKey("Creature", related_name=_("crerelation1"))
    creature2 = models.ForeignKey("Creature", related_name=_("crerelation2"))
    relation12 = models.CharField(max_length=10, blank=True, null=True, choices=mc.CRE_RELATIONSHIP_CHOICES, verbose_name=_('Relationship 1 -> 2'))
    relation21 = models.CharField(max_length=10, blank=True, null=True, choices=mc.CRE_RELATIONSHIP_CHOICES, verbose_name=_('Relationship 2 -> 1'))

    class Meta:
        db_table = class.__name__
        verbose_name = _(class.__name__)
        get_latest_by = 'order_creature1'
        ordering = ['-creature1']
        unique_together = ('creature1', 'creature2')

class CharacterLocationRelationship(RelationEntity):

    character = models.ForeignKey("Character", related_name=_("charlocation"))
    location = models.ForeignKey("Location", related_name=_("loccharacter"))
    relation = models.CharField(max_length=10, blank=True, null=True, choices=mc.CHARLOC_RELATIONSHIP_CHOICES, verbose_name=_('CharLocRelationship'))

    class Meta:
        db_table = class.__name__
        verbose_name = _(class.__name__)
        get_latest_by = 'order_character'
        ordering = ['-character']
        unique_together = ('character', 'location')


class ObjectRelationship(RelationEntity):

    object1 = models.ForeignKey("Object", related_name=_("objrelation1"))
    object2 = models.ForeignKey("Object", related_name=_("objrelation2"))
    relation12 = models.CharField(max_length=10, blank=True, null=True, choices=mc.OBJ_RELATIONSHIP_CHOICES, verbose_name=_('Relationship 1 -> 2'))
    relation21 = models.CharField(max_length=10, blank=True, null=True, choices=mc.OBJ_RELATIONSHIP_CHOICES, verbose_name=_('Relationship 2 -> 1'))


    class Meta:
        db_table = class.__name__
        verbose_name = _(class.__name__)
        get_latest_by = 'order_object1'
        ordering = ['-object1']
        unique_together = ('object1', 'object2')


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
        #api = self.validate()

        try:
            #status = api.PostUpdate(tweet_text)
            pass
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

