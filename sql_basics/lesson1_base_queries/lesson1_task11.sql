SELECT product_id, name, price, ROUND(1.05 * price, 1) AS new_price
FROM products
ORDER BY new_price DESC, product_id