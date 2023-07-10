#Add the required Python code to connect to the student collection
from pymongo import MongoClient
client = MongoClient("localhost",27017)
db = client["mydb"]
pytech = db["Pytech"]
records =[
   {
    "student_id": "1007",
     "first_name": "Ruth",
     "last_name":"Jones"
     },
   { 
    "student_id": "1008",
    "first_name": "Matthew",
    "last_name":"Smith"
     },
    {
     "student_id": "1009",
     "first_name": "John",
     "last_name":"Brown"
    }
]
#Call the fnd() method and output the documents
for records in records.find():
 print(records)
 #call the update_one method
records.update_one({"student-id":1007, "$set":{"last_name":"Anderson"}})
print(records)
