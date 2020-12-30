WITH `project.dataset.table` as (
  SELECT '{"Properties":[{"Value":"123","Code":"A"},{"Value":"000","Code":"B"}]}' json_string UNION ALL
  SELECT '{"Properties":{"Value":"456","Code":"A"}}' UNION ALL
  SELECT '{"Properties":[{"Value":"123","Code":"A"},{"Value":"789","Code":"C"},{"Value":"000","Code":"B"}]}' UNION ALL
  SELECT '{"Properties": {"Value":"Z","Code":"A"}}'  
)
SELECT json_string, 
  ARRAY(
    SELECT STRUCT(
        JSON_EXTRACT_SCALAR(Properties,'$.Code') AS Code,
        JSON_EXTRACT_SCALAR(Properties,'$.Value') AS Value
      )
    FROM UNNEST(IFNULL(
      JSON_EXTRACT_ARRAY(json_string,'$.Properties'), 
      [JSON_EXTRACT(json_string,'$.Properties')])) Properties
  ) AS Properties  
FROM `project.dataset.table`