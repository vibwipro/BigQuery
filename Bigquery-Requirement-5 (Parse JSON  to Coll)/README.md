Input Data is :- Given over requirement document.
Input table has 2 coll (id & data)

Field data: has values 

{
 "sections": [
   {
     "secName": "Flintstones",
     "fields": [
       { "fldName": "Fred", "age": 55 },
       { "fldName": "Barney", "age": 44 }
     ]
   },
   {
     "secName": "Jetsons",
     "fields": [
       { "fldName": "George", "age": 33 },
       { "fldName": "Elroy", "age": 22 }
     ]
   }
 ]}



Expected output is :- given over Requirement document.

data format:

id  | section_num  | section_name | field_num | field_name | field_age
----+--------------+--------------+-----------+------------+-----------
1   | 1            | Flintstones  | 1         | Fred       |  55
1   | 1            | Flintstones  | 2         | Barney     |  44
1   | 2            | Jetsons      | 1         | George     |  33
1   | 2            | Jetsons      | 2         | Elroy      |  22