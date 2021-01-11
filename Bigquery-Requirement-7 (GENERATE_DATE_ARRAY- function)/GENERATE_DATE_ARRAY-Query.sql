with data as (
  select 'x' as id, date '2021-01-01' as date
  UNION ALL
  select 'x' as id, date '2021-01-03' as date
  UNION ALL
  select 'y' as id, date '2021-01-06' as date
  UNION ALL
  select 'y' as id, date '2021-01-09' as date
)
  select d1.id, date
  from data d1 
    join data d2 
      on d1.id = d2.id 
      and d1.date < d2.date, unnest(GENERATE_DATE_ARRAY(d1.date, d2.date, INTERVAL 1 DAY)) as date;