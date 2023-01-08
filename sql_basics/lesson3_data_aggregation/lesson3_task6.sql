SELECT COUNT(DISTINCT order_id) AS orders_count
FROM orders
WHERE array_length(product_ids, 1) >= 9