SELECT product_id, name, price, (CASE
       WHEN price > 100 and name != 'икра' THEN 1.05 * price
       ELSE price
       END) AS new_price
FROM products
ORDER BY new_price DESC, product_id