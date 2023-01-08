SELECT SUM(price) AS order_price
FROM products
WHERE name = 'сухарики' or name = 'чипсы' or name = 'энергетический напиток'