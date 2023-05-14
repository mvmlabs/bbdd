import pymongo
from pymongo import MongoClient

#indicar la url del servidor 
MONGODB_URI = 'url'

client = MongoClient(MONGODB_URI)


for db_list in client.list_database_names():
   print(db_list)

print('*******************************************')

db = client['gestio_articles']
col = db['articles']

col.insert_one({
    'codi': 'ART001',
    'nom': 'vestit',
    'tipus': 'roba',
    'quantitat': 50,
    'preu': 15.95
})

col.insert_many([
   {
    'codi': 'ART002',
    'nom': 'Ulleres',
    'tipus': 'Complements',
    'quantitat': 50,
    'preu': 75.99
   },
   {
    'codi': 'ART003',
    'nom': 'Sabatilles',
    'tipus': 'sabates',
    'quantitat': 200,
    'preu': 9.95
   },
   {
      'codi': 'ART004',
    'nom': 'Bikini',
    'tipus': 'Bany',
    'quantitat': 75,
    'preu': 34.95
   },
   {
      'codi': 'ART005',
    'nom': 'Jaqueta',
    'tipus': 'Abric',
    'quantitat': 6,
    'preu': 29.99
   },
])

print(db.name)

for x in col.find({"quantitat":{"$gte":10}}):
    print(x)

