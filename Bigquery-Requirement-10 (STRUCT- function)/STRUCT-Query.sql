WITH `proj.dataset.tbl` AS
(SELECT '2020-12-06 21:00:00' AS datetime, 100 AS ACTION, 'failure' AS result, 'dsde424-lx7718.cccxx.com' as dest
UNION ALL
SELECT '2020-12-07 22:00:00' AS datetime, 101 AS ACTION, 'Success' AS result, 'dsabc654-lx6510.cccxx.com' as dest
UNION ALL
SELECT '2020-12-07 23:00:00' AS datetime, 102 AS ACTION, 'Process' AS result, 'dsdtre4-lx985g0.cccxx.com' as dest
)
SELECT datetime,
        [struct('Action' as key, cast (ACTION as string) as value ),
        struct('result' as key, result as value),
        struct(' dest ' as key, dest as value)
       ] as key_values

FROM `proj.dataset.tbl` LIMIT 1000