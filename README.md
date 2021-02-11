# BigQuery Comman Used Functions
![Description](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW1_ZfZOVl4_QnHNOQ9gjZZ8mc_zBTKHq9dg&usqp=CAU)

---

> BigQuery is a fully-managed, serverless data warehouse that enables scalable analysis over petabytes of data. It is a Platform as a Service that supports querying using ANSI SQL. It also has built-in machine learning capabilities. 

### Table of Contents
Following List of Functions are described here

- [8. PERCENTILE_CONT](#percentile-count)
- [9. STRING_AGG](#string-agg)

---

This Bigquery function takes following inputs

  1. Input String
  2. Characters which need to be replaced
  3.New characters which need to put on output string.
  
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
