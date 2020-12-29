with `project.dataset.table` as (
  select 1 objectid, 1 id, timestamp '2002-11-26T12:00:00' DateAndTime, 38.82551095 lat,  -109.9709871 long union all
  select 2, 1, '2002-11-29T13:00:00', 38.541137,  -109.677575 union all
  select 3, 2, '2002-11-03T10:00:00', 38.550676,  -109.901774 union all
  select 4, 2, '2002-11-04T10:00:00', 38.53689,  -109.683531 union all
  select 5, 2, '2002-11-05T10:00:00', 38.45689,  -109.683531 
)
select *, 
  objectid as objectid_start, 
  lead(objectid) over next as objectid_next,
  round(st_distance(st_geogpoint(long, lat), lead(st_geogpoint(long, lat)) over next), 2) as distance
from `project.dataset.table`
window next as (partition by id order by DateAndTime)
order by id, DateAndTime 