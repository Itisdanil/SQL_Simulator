WITH product_id_unnest AS
    (SELECT creation_time, order_id, product_ids, unnest(product_ids) AS product_id
    FROM orders)
    
SELECT order_id, product_id_unnest.product_id, price
FROM
product_id_unnest
INNER JOIN 
products
ON product_id_unnest.product_id = products.product_id
ORDER BY order_id, product_id_unnest.product_id