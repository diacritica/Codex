import datetime
from web.models import *
armas= [a[:-1] for a in open("MISC/armas.csv","r").readlines()]
armasprop= [a[:-1] for a in open("MISC/armas_prop.csv","r").readlines()]
armasprop.pop()
listaarmas=[]
for arma in armas:
     for prop in armasprop:
         listaarmas.append({"name":arma.strip().split(":")[0]+" "+prop.strip().split(":")[0],"properties":prop.strip().split(":")[2]+"<br><br>"+arma.strip().split(":")[2]+"kg","gpvalue":prop.strip().split(":")[1] })

for o in listaarmas:
    o = Object(name=o["name"],properties=o["properties"],ppvalue=int(o["gpvalue"])/10,creation_date=datetime.datetime.now(),last_updated=datetime.datetime.now(),canon_level="C",description="",status="Cr",objtype="W",rarity="R",alignment="NA")
    o.save()


