IF (
  SELECT COUNT(1) AS cnt
  FROM `proj.dataset`.__TABLES_SUMMARY__
  WHERE table_id = 'YOUR_NEW_TABLE1'   
  ) = 5 
then
IF (
  SELECT COUNT(1) AS cnt
  FROM `proj.dataset`.__TABLES_SUMMARY__
  WHERE table_id = 'YOUR_NEW_TABLE2'   
  ) > 0 
THEN
  SELECT 'blabla';
ELSE 
  SELECT 'Ohh!';
END IF;
ELSE 
  SELECT 'Ohh!';
END IF;