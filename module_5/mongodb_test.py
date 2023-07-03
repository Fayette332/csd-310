from pymongo import MongoClient
client = MongoClient("mongodb+srv://admin:admin@cluster0.o5uq8tv.mongodb.net/?retryWrites=true&w=majority") 
db = client.pytech
print(db.list_collection_names)