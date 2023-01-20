WITH rich_products AS 
    (SELECT product_id
    FROM products
    ORDER BY price DESC
    LIMIT 5),
    unnest_table AS
    (SELECT creation_time, order_id, product_ids, unnest(product_ids) AS product_id
    FROM orders)
    
SELECT DISTINCT order_id, product_ids
FROM unnest_table
WHERE product_id IN (SELECT * FROM rich_products)
ORDER BY order_id