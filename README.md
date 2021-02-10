# BigQuery Comman Used Functions
![Description](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW1_ZfZOVl4_QnHNOQ9gjZZ8mc_zBTKHq9dg&usqp=CAU)

---

> BigQuery is a fully-managed, serverless data warehouse that enables scalable analysis over petabytes of data. It is a Platform as a Service that supports querying using ANSI SQL. It also has built-in machine learning capabilities. 

### Table of Contents
Following List of Functions are described here

- [8. PERCENTILE_CONT](#percentile-count)

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
