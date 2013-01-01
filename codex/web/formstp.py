# web/formstp.py
from tastypie.resources import ModelResource
from web.models import Adventure


class AdventureResource(ModelResource):
    class Meta:
        queryset = Adventure.objects.all()
        resource_name = 'adventure'
