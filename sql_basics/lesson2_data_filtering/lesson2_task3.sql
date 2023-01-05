SELECT product_id, name
FROM products
WHERE name LIKE 'с%' and name not LIKE '% %'