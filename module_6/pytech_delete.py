from pymongo import MongoClient
client = MongoClient("localhost",27017)
db = client["Pytech"]
students = db["students"]
students= [    
    { "student_id": "1007",

       "first_name": "Ruth",

       "last_name":"Jones"
    },
   {   "student_id": "1008",

       "first_name": "Matthew",

       "last_name":"Smith"
    },
   {
      "student_id": "1009",

      "first_name": "John",

      "last_name":"Brown"
     } ]
#3 call the find() method to Display the results.
for student in students.find():

    print(students)
#4 call the the insert_one()method
new_student={"student_id":1010,

             "first_name":"Sarah",

             "last_name":"Davis"

             }
students.insert_one(new_student)
#5 call the find() method to Display the results
inserted_student=students.find_one({"student_id":1010})
print(inserted_student)
#6 call the delete_one() method.
students.delete_one({"student_id":1010})
#6 call the delete_one() method to display.
for student in students.find():

    print(student)