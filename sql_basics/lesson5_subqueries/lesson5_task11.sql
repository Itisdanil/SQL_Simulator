SELECT product_id, name, price,
    (CASE
    WHEN price >= (SELECT ROUND(AVG(price), 2) FROM products) + 50 THEN 0.85 * price
    WHEN price <= (SELECT ROUND(AVG(price), 2) FROM products) - 50 THEN 0.9 * price
    ELSE price 
    END) AS new_price
FROM products
ORDER BY price DESC, product_id