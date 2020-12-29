
DECLARE rows_count, run_away_stop INT64 DEFAULT 0;

CREATE TEMP TABLE buckets AS 
SELECT ARRAY_AGG(id2 ORDER BY id2) arr 
FROM `ikea-itsd-ml.test123.table_data`
GROUP BY id1;

LOOP
  SET rows_count = (SELECT COUNT(1) FROM buckets);
  SET run_away_stop = run_away_stop + 1;

  CREATE OR REPLACE TEMP TABLE buckets AS
  SELECT ANY_VALUE(arr) arr FROM (
    SELECT ARRAY(SELECT DISTINCT val FROM UNNEST(arr) val ORDER BY val) arr
    FROM (
      SELECT ANY_VALUE(arr1) arr1, ARRAY_CONCAT_AGG(arr) arr    
      FROM (
        SELECT t1.arr arr1, t2.arr arr2, ARRAY(SELECT DISTINCT val FROM UNNEST(ARRAY_CONCAT( t1.arr, t2.arr)) val ORDER BY val) arr 
        FROM buckets t1, buckets t2 
        WHERE (SELECT COUNT(1) FROM UNNEST(t1.arr) val JOIN UNNEST(t2.arr) val USING(val)) > 0
      ) GROUP BY FORMAT('%t', arr1)
    )
  ) GROUP BY FORMAT('%t', arr);

  IF (rows_count = (SELECT COUNT(1) FROM buckets) AND run_away_stop > 1) OR run_away_stop > 10 THEN BREAK; END IF;
END LOOP;

SELECT id1, id2, 
  ARRAY_TO_STRING(ARRAY(SELECT DISTINCT id FROM t.arr as id ORDER BY id), '_') ID_comp
FROM (
  SELECT id1, id2, ARRAY_AGG(id1) OVER(PARTITION BY grp) arr 
  FROM `ikea-itsd-ml.test123.table_data` 
  JOIN (SELECT ROW_NUMBER() OVER() grp, arr FROM buckets) 
  ON id2 IN UNNEST(arr) 
) t
ORDER BY id1, id2;     
