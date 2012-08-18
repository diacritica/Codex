from web.models import *
from django import forms
from django.contrib import admin
from django.contrib.admin.widgets import FilteredSelectMultiple

class CommonMedia:
  js = (
    'https://ajax.googleapis.com/ajax/libs/dojo/1.6.0/dojo/dojo.xd.js',
    '/js/editor.js',
  )
  css = {
    'all': ('/css/editor.css',),
  }


class CharacterAdmin(admin.ModelAdmin):
     filter_horizontal = ("relatedobject","relatedlocation","image", "attachments", "author",)
     list_display = ('name', 'gender', 'level','status','alignment','species','pncorpc','canon_level','deactivated')
     list_filter = ('gender', 'level','status','alignment','species','pncorpc','canon_level','author','deactivated')
     Media = CommonMedia

class CreatureAdmin(admin.ModelAdmin):
     filter_horizontal = ("relatedobject","relatedencountersetting","relatedlocation","image","attachments", "author",)
     list_display = ('name', 'hitdice','XPvalue','alignment','canon_level','deactivated')
     list_filter = ('hitdice','XPvalue','alignment','canon_level','author','deactivated')
     Media = CommonMedia

class LocationAdmin(admin.ModelAdmin):
     filter_horizontal = ("relatedobject","image","attachments", "author",)
     list_display = ('name','status','alignment','loctype','canon_level','deactivated')
     list_filter = ('name','status','alignment','loctype','canon_level','deactivated','author')
     Media = CommonMedia

class ObjectAdmin(admin.ModelAdmin):
     filter_horizontal = ("image","attachments", "author",)
     list_display = ('name', 'objtype','rarity','status','alignment','canon_level','deactivated')
     list_filter = ('objtype','rarity','status','alignment','canon_level','deactivated')
     Media = CommonMedia

class AuthorAdmin(admin.ModelAdmin):
     list_display = ('name', 'nickname')
     list_filter = ('name', 'nickname')
     Media = CommonMedia

class EncounterSettingAdmin(admin.ModelAdmin):
     filter_horizontal = ("author",)
     list_display = ('name','canon_level','deactivated')
     list_filter = ('name','canon_level','deactivated','author')
     Media = CommonMedia

class AdventureAdmin(admin.ModelAdmin):
     filter_horizontal = ("image","attachments", "author",)
     list_display = ('name', 'url','canon_level')
     list_filter = ['canon_level','author']
     Media = CommonMedia

class ChronicleAdmin(admin.ModelAdmin):
     filter_horizontal = ("attachments","author",)
     list_display = ('name', 'url','canon_level')
     list_filter = ['canon_level','author']
     Media = CommonMedia

class RuleAdmin(admin.ModelAdmin):
     filter_horizontal = ("attachments","author","affectedsections")
     list_display = ('name', 'url','canon_level')
     list_filter = ['canon_level','author']
     Media = CommonMedia

class FanArtAdmin(admin.ModelAdmin):
     filter_horizontal = ("attachments","author")
     list_display = ('name', 'chosenlicense','chosencategory','chosentype','canon_level')
     list_filter = ['canon_level','chosenlicense','chosencategory','chosentype','author']
     Media = CommonMedia

class ClassRaceAdmin(admin.ModelAdmin):
     list_display = ('name','canon_level')
     list_filter = ['canon_level','author']
     Media = CommonMedia

class SpellAdmin(admin.ModelAdmin):
     filter_horizontal = ("attachments","author","affectedclassrace")
     list_display = ('name', 'level','canon_level')
     list_filter = ['level','canon_level',"affectedclassrace"]
     Media = CommonMedia


class RuleSectionAdmin(admin.ModelAdmin):
     list_display = ('name','canon_level')
     list_filter = ['canon_level','author']
     Media = CommonMedia

class CharacterLocationRelationshipAdmin(admin.ModelAdmin):

     list_display = ('character', 'location', 'relation','canon_level')
     list_filter = ('character', 'location', 'relation','canon_level','author')
     Media = CommonMedia

class CharacterRelationshipAdmin(admin.ModelAdmin):

     list_display = ('character1', 'character2', 'relation12','relation21','canon_level')
     list_filter = ('character1', 'character2', 'relation12','relation21','canon_level','author')
     Media = CommonMedia

class CreatureRelationshipAdmin(admin.ModelAdmin):

     list_display = ('creature1', 'creature2', 'relation12','relation21','canon_level')
     list_filter = ('creature1', 'creature2', 'relation12','relation21','canon_level','author')
     Media = CommonMedia

class ObjectRelationshipAdmin(admin.ModelAdmin):

     list_display = ('object1', 'object2', 'relation12','relation21','canon_level')
     list_filter = ('object1', 'object2', 'relation12','relation21','canon_level','author')
     Media = CommonMedia

class LanguageAdmin(admin.ModelAdmin):
     list_display = ('name', 'description')
     Media = CommonMedia

class ReligionAdmin(admin.ModelAdmin):
     list_display = ('name', 'description')
     Media = CommonMedia

class ImageAdmin(admin.ModelAdmin):
     list_display = ('name', 'description')
     Media = CommonMedia

class ThumbnailImageAdmin(admin.ModelAdmin):
     list_display = ('name', 'description')
     Media = CommonMedia


class AttachFileAdmin(admin.ModelAdmin):
     list_display = ('name', 'description')
     Media = CommonMedia

class TwitterConfigAdmin(admin.ModelAdmin):
     list_display = ('name', 'twitter_user', 'consumer_key', 'consumer_secret', 'access_token_key', 'access_token_secret', 'forward_user')
     Media= CommonMedia

admin.site.register(Character, CharacterAdmin)
admin.site.register(Creature, CreatureAdmin)
admin.site.register(Location, LocationAdmin)
admin.site.register(Object, ObjectAdmin)
admin.site.register(CharacterRelationship, CharacterRelationshipAdmin)
admin.site.register(CreatureRelationship, CreatureRelationshipAdmin)
admin.site.register(ObjectRelationship, ObjectRelationshipAdmin)
admin.site.register(CharacterLocationRelationship, CharacterLocationRelationshipAdmin)
admin.site.register(Author, AuthorAdmin)
admin.site.register(Adventure, AdventureAdmin)
admin.site.register(Chronicle, ChronicleAdmin)
admin.site.register(Language, LanguageAdmin)
admin.site.register(Religion, ReligionAdmin)
admin.site.register(Image, ImageAdmin)
admin.site.register(ThumbnailImage, ThumbnailImageAdmin)
admin.site.register(AttachFile, AttachFileAdmin)
admin.site.register(TwitterConfig, TwitterConfigAdmin)
admin.site.register(Rule, RuleAdmin)
admin.site.register(RuleSection, RuleSectionAdmin)
admin.site.register(Spell, SpellAdmin)
admin.site.register(ClassRace, ClassRaceAdmin)
admin.site.register(FanArt, FanArtAdmin)
admin.site.register(EncounterSetting, EncounterSettingAdmin)
