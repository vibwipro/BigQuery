# BigQuery Functions 'STRING_AGG'
![Description](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW1_ZfZOVl4_QnHNOQ9gjZZ8mc_zBTKHq9dg&usqp=CAU)

---

 
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
