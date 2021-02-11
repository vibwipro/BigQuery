
WITH `project.dataset.tab` AS (
SELECT    'User 1' as Client,    '1-cola' as Order_item
UNION ALL
SELECT 'User 1','2-fries' 
UNION ALL
SELECT 'User 1','3-burger'   
UNION ALL
SELECT 'User 2','1-cola'     
UNION ALL
SELECT 'User 2','2-fries'    
UNION ALL
SELECT 'User 3','2-fries' 
UNION ALL
SELECT 'User 3','1-cola'  
UNION ALL
SELECT 'User 4','3-burger' 
UNION ALL
SELECT 'User 5','1-cola'  
UNION ALL
 SELECT 'User 5','2-fries'   
UNION ALL
 SELECT 'User 5','3-burger'    
UNION ALL
 SELECT 'User 5','3-burger'  
UNION ALL
 SELECT 'User 5','1-cola'   
)
select client, 
  string_agg(order_item, ' - ' order by order_item) as order_items
from (
  select *, 
    row_number() over(partition by client, order_item) as client_order
  from `project.dataset.tab`
)
group by client, client_order                



