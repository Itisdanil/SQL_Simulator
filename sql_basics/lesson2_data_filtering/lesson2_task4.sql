SELECT product_id, name, price, '25%' AS discount, 0.75*price AS price_discounted
FROM products
WHERE price > 60 and name LIKE '%чай%' and name NOT LIKE '%гриб%'