with orders_new as (SELECT order_id,
                           unnest(product_ids) as product_id
                    FROM   orders)
SELECT t.order_id,
       array_agg(t.name) as product_names
FROM   (SELECT order_id,
               name
        FROM   orders_new
            LEFT JOIN products
                ON products.product_id = orders_new.product_id) t
GROUP BY t.order_id limit 1000