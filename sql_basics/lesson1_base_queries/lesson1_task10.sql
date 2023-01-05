SELECT name, price, 1.05 * price AS new_price
FROM products
ORDER BY new_price DESC