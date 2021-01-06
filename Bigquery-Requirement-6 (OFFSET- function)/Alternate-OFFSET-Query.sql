WITH data AS (
SELECT
   [0,1,2,3,4,5,6,7,8] as id,
   [3,4,5,6,7,8,9,3,4] as col_2
) 
select id, col_2 
from data, 
unnest(id) id with offset
join unnest(col_2) col_2 with offset 
using(offset)

