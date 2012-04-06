import datetime
from haystack import indexes
from haystack import site
from web.models import Object


class ObjectIndex(indexes.BasicSearchIndex, indexes.Indexable):
    name = CharField(document=True,model_attr='name')
    text = TextField(document=True,model_attr='description')
    comments = TextField(model_attr='comments')
    def get_model(self):
        return Object


    def index_queryset(self):
        return self.get_model().objects.filter(date__lte=datetime.datetime.now())

