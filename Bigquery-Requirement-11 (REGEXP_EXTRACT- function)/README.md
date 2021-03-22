# BigQuery 'REGEXP_EXTRACT' Function
![Description](https://miro.medium.com/max/1838/1*C1-RjvctFd95edSU8Aw-WQ.png)

---

 
  Input Data:
  ```html
id  | URL                       
----+---------------------------------------------------------------------------
1   | https://www.example.com/en/uk/product/clothing/trousers-leggings/cool-grey-joggers-9800977
2   | https://www.example.com/en/uk/product/hot-denim-dress-7842666/a-1
 ```
> Transformation Logic: We need to extract Characters after last slash(/) in above URL  as given below.

Output:
  ```html
id  | URL                       
----+---------------------------------------------------------------------------
1   | cool-grey-joggers
2   | a-1
 ```
> We can find SQL Code [here](https://github.com/vibwipro/BigQuery/blob/main/Bigquery-Requirement-11%20(REGEXP_EXTRACT-%20function)/REGEXP_EXTRACT-Query.sql)

---

