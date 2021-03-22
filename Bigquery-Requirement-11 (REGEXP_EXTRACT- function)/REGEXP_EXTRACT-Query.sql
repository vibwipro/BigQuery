SELECT REGEXP_EXTRACT('https://www.example.com/en/uk/product/clothing/trousers-leggings/cool-grey-joggers-9800977', r'([^/]+)-[0-9]+$')
UNION ALL
SELECT REGEXP_EXTRACT('https://www.example.com/en/uk/product/hot-denim-dress-7842666/a-1', r'([^/]+)+$')