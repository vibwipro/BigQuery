WITH data as (
  SELECT 'A' AS c1, 'B' AS c2, 12 AS c3 UNION ALL
  SELECT 'A', 'C', 15 UNION ALL
  SELECT 'A', 'D', 8 UNION ALL
  SELECT 'X', 'P', 8 UNION ALL
  SELECT 'X', 'Q', 12 UNION ALL
  SELECT 'X', 'R', 15
)
SELECT *
FROM 
(
  SELECT *, PERCENTILE_CONT(c3, 0.5) OVER(PARTITION BY c1) AS median
  FROM data
)
WHERE c3 >= median