import datetime
#from web.models import *
armaduras= [a[:-1] for a in open("MISC/armaduras.csv","r").readlines()]
armadurasprop= [a[:-1] for a in open("MISC/armaduras_prop.csv","r").readlines()]
listaarmaduras=[]
for armadura in armaduras:
     for prop in armadurasprop:
         listaarmaduras.append({"name":armadura.strip().split(":")[0]+" "+prop.strip().split(":")[0],"properties":prop.split(":")[2]+armadura.split(":")[1]+"<br><br>"+armadura.strip().split(":")[2]+"kg","gpvalue":prop.strip().split(":")[1] })

#for o in listaarmaduras:
#    o = Object(name=o["name"],properties=o["properties"],ppvalue=int(o["gpvalue"])/10,creation_date=datetime.datetime.now(),last_updated=datetime.datetime.now(),canon_level="C",description="",status="Cr",objtype="W",rarity="R",alignment="NA")
#    o.save()

print listaarmaduras

