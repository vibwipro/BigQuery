# BigQuery Comman Used Functions
![Description](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW1_ZfZOVl4_QnHNOQ9gjZZ8mc_zBTKHq9dg&usqp=CAU)

---

> BigQuery is a fully-managed, serverless data warehouse that enables scalable analysis over petabytes of data. It is a Platform as a Service that supports querying using ANSI SQL. It also has built-in machine learning capabilities. 

### Table of Contents
Following List of Functions are described here

- [1. ARRAY/ARRAY_TO_STRING](#array-to-string)
- [2. LEAD/ST_DISTANCE/ST_GEOGPOINT](#lead-geogpoint)
- [3. PARSE-JSON](#parse-json)
- [4. NESTED IF ELSE](#nested-if-else)
- [5. UNNEST/JSON_EXTRACT_SCALAR/JSON_EXTRACT_ARRAY](#unnest)
- [6. OFFSET](#offset)
- [7. GENERATE_DATE_ARRAY](#generate-date-array)
- [8. PERCENTILE_CONT](#percentile-count)
- [9. STRING_AGG](#string-agg)
- [10. STRUCT](#struct)

---

  ## 1. BigQuery FUNCTION 'ARRAY'/'ARRAY_TO_STRING'
  Input Data:
  ```html
    | ID1         | ID2          | 
----+--------------+--------------+
1   | 01          | 1            |
2   | 01          | 1            | 
3   | 01          | 2            |
4   | 01          | 2            |
5   | 01          | 2            |
6   | 02          | 2            | 
7   | 02          | 2            |
8   | 02          | 3            |
9   | 02          | 3            |
10  | 02          | 3            |
... 
nth | 03          | 4            |
n+1 | 04          | 5            |
n+2 | 05          | 6            |
n+3 | 06          | 7            |
 ```
> Transformation Logic: Link ID2 = 3 to ID2 = 2 via ID1 = 02 and then ID1 = 02 to ID2 = 01 via ID2 = 2 in the first part of the example table. Second part is single entry.
Output:
  ```html
    | ID1         | ID2          | ID_Comp
----+--------------+--------------+---------
1   | 01          | 1            | 01_02
2   | 01          | 1            | 01_02
3   | 01          | 2            | 01_02
4   | 01          | 2            | 01_02
5   | 01          | 2            | 01_02
6   | 02          | 2            | 01_02
7   | 02          | 2            | 01_02
8   | 02          | 3            | 01_02
9   | 02          | 3            | 01_02
10  | 02          | 3            | 01_02
... 
nth | 03          | 4            | 03
n+1 | 04          | 5            | 04
n+2 | 05          | 6            | 05
n+3 | 06          | 7            | 06
```
> We can find SQL Code [here](https://github.com/vibwipro/BigQuery/blob/main/Bigquery-Requirement-1/biqquery.sql)

---

  ## 2. BigQuery FUNCTIONS 'LEAD'/'ST_DISTANCE'/'ST_GEOGPOINT'
  Input Data:
  ```html
objectid, id, DateAndTime,             latitude ,     longitude
--------------------------------------------------------------------
 1,        1, '2002-11-26T12:00:00', 38.82551095,  -109.9709871 
 2,        1, '2002-11-29T13:00:00', 38.541137,  -109.677575
 3,        2, '2002-11-03T10:00:00', 38.550676,  -109.901774
 4,        2, '2002-11-04T10:00:00', 38.53689,  -109.683531
 5,        2, '2002-11-05T10:00:00', 38.45689,  -109.683531
 ```
> Transformation Logic: is to calculate the distance between sequential points and partitioned by the ID number in BigQuery. Based on the above table, we want the query to calculate the distance between ObjectID 1 & 2, and then the distance between ObjectID 3 & 4 and then 4 & 5.

> We can find SQL Code [here](https://github.com/vibwipro/BigQuery/blob/main/Bigquery-Requirement-2/biqquery.sql)

---

  ## 3. BigQuery Parse JSON
  Input Data:
  ```json
 [{"Value":"123","Code":"A"},{"Value":"000","Code":"B"}]
  {"Value":"456","Code":"A"}
 [{"Value":"123","Code":"A"},{"Value":"789","Code":"C"},{"Value":"000","Code":"B"}]
  {"Value":"Z","Code":"A"}
 ```
> Transformation Logic: We have a requirement to parse JSON record and represent output as given below.
Output:
  ```html
    | Value        | Code         | 
----+--------------+--------------+
1   | 123          | A            |
2   | 000          | B            | 
3   | 456          | A            |
4   | 123          | A            |
... So on 
```
> We can find SQL Code [here](https://github.com/vibwipro/BigQuery/blob/main/Bigquery-Requirement-3/biqquery.sql)

---

## 4. BigQuery Functions NESTED'IF-ELSE'
 
> Transformation Logic: We have a requirement to calculate different conditions, based on different conditions we need to take different actions.

> We can find SQL Code [here](https://github.com/vibwipro/BigQuery/blob/main/Bigquery-Requirement-4/Nested-IF-Else.SQL)

---

  ## 5. BigQuery Functions 'UNNEST' & 'JSON_EXTRACT_SCALAR' & 'JSON_EXTRACT_ARRAY'
  Input Data:
  ```html
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
 ```
> Transformation Logic: We have a requirement to parse JSON record and represent output as given below.
Output:
  ```html
id  | section_num  | section_name | field_num | field_name | field_age
----+--------------+--------------+-----------+------------+-----------
1   | 1            | Flintstones  | 1         | Fred       |  55
1   | 1            | Flintstones  | 2         | Barney     |  44
1   | 2            | Jetsons      | 1         | George     |  33
1   | 2            | Jetsons      | 2         | Elroy      |  22
 ```
> We can find SQL Code [here](https://github.com/vibwipro/BigQuery/blob/main/Bigquery-Requirement-5%20(Parse%20JSON%20%20to%20Coll)/Parse-JSON-Coll.txt)


---

  ## 6. BigQuery Function 'OFFSET'
  Input Data:
  ```html
 id                         Col2 
[0,1,2,3,4,5,6,7,8]         [3,4,5,6,7,8,9,3,4]
 ```
> Transformation Logic: We have a requirement to parse array and represent output as given below.
Output:
  ```html
 id    Col2 
 0     3
 1     4
 2     5
 3     6
 4     7
 5     8
 6     9
 7     3
 8     4
 ```
> We can find SQL Code [here](https://github.com/vibwipro/BigQuery/blob/main/Bigquery-Requirement-6%20(OFFSET-%20function)/Function-OFFSET.txt)

--- 

  ## 7. BigQuery Function 'GENERATE_DATE_ARRAY'
  Input Data:
  ```html
 id    date 
 x     2021-01-01
 x     2021-01-03
 y     2021-01-06
 y     2021-01-09
 ```
> Transformation Logic: We have a requirement to generate new records between 2 dates of same id's. From above give data we need to create output as given below.
Output:
  ```html
 id    date 
 x     2021-01-01
 x     2021-01-02
 x     2021-01-03
 y     2021-01-06
 y     2021-01-07
 y     2021-01-08
 y     2021-01-09
 ```
> We can find SQL Code [here](https://github.com/vibwipro/BigQuery/blob/main/Bigquery-Requirement-7%20(GENERATE_DATE_ARRAY-%20function)/GENERATE_DATE_ARRAY-Query.sql)

---  

  ## 8. BigQuery Function 'PERCENTILE_CONT'
  Input Data:
  ```html
 c1    c2    c3
 A     B     12
 A     C     15
 A     D     8
 X     P     8
 X     Q     12
 X     R     15
 ```
> Transformation Logic: I want to select those rows of top contributing (top 50 percent contributor for sum of c3 values, ex: 12 and 15 has contribution more than 50 percent of 12,15 and 8) c2 values for each c1 values.
Output:
  ```html
c1    c2    c3
A     B     12
A     C     15
X     Q     12
X     R     15
 ```
> We can find SQL Code [here](https://github.com/vibwipro/BigQuery/blob/main/Bigquery-Requirement-8%20(PERCENTILE_CONT-%20function)/PERCENTILE_CONT-Query.sql)

---

  ## 9. BigQuery Function 'STRING_AGG'
  
  Input Data:
  ```html
| Client   | Order item       |
| -------- | ---------------- |
| User 1   | 1-cola           |
| User 1   | 2-fries          |
| User 1   | 3-burger         |
| User 2   | 1-cola           |
| User 2   | 2-fries          |
| User 3   | 2-fries          |
| User 3   | 1-cola           |
| User 4   | 3-burger         |
| User 5   | 1-cola           |
| User 5   | 2-fries          |
| User 5   | 3-burger         |
| User 5   | 3-burger         |
| User 5   | 1-cola           |
 ```
> Transformation Logic: I have a table with 2 columns, 1st is client name let's say, and second is his choices. Note he can choose multiple choices (1 or more)! and he can also do a 2nd order as well! 
1.	Rule: In order for client 3 the items must be ordered sequentially when concatenated!
2.	Rule: In order for client 5 we have 2 orders, detected simply by having a duplicate item for that order so it was put in a new row!


Output:
  ```html
Client	Order item
User 1	1-cola - 2-fries - 3-burger
User 2	1-cola - 2-fries
User 3	1-cola - 2-fries
User 4	3-burger
User 5	1-cola - 2-fries - 3-burger
User 5	1-cola - 3-burger
 ```
> We can find SQL Code [here](https://github.com/vibwipro/BigQuery/blob/main/Bigquery-Requirement-9%20(String_Agg-%20function)/String_Agg-Query.sql)

---

  ## 10. BigQuery Functions 'STRUCT'
  Input Data:
  ```html
id  | datetime               | ACTION | result    | dest
----+------------------------+--------+-----------+------------+-----------
1   | 2020-12-06 21:00:00    | 100    | failure   | dsde424-lx7718.cccxx.com
2   | 2020-12-06 22:00:00    | 101    | Success   | dsabc654-lx6510.cccxx.com
3   | 2020-12-06 23:00:00    | 102    | Process   | dsdtre4-lx985g0.cccxx.com

 ```
> Transformation Logic: We have a transform Flatfile to an array.
Output:
  ```html
id  | datetime               | key_values.key | key_values.value
----+------------------------+----------------+-----------+------------+-----------
1   | 2020-12-06 21:00:00    | Action         | 100
                             | result         | failure
                             | dest           | dsde424-lx7718.cccxx.com
2   | 2020-12-06 22:00:00    | Action         | 101
                             | result         | Success
                             | dest           | dsabc654-lx6510.cccxx.com
3   | 2020-12-06 23:00:00    | Action         | 102
                             | result         | Process
                             | dest           | dsdtre4-lx985g0.cccxx.com
 ```
