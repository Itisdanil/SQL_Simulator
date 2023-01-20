WITH unnest_table AS
    (SELECT creation_time, order_id, product_ids, unnest(product_ids) AS product_id
    FROM orders)
    
SELECT product_id, COUNT(product_id) AS times_purchased
FROM unnest_table
GROUP BY product_id
ORDER BY times_purchased DESC
LIMIT 10