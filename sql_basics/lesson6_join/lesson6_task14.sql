WITH us_or_ct AS
    (SELECT user_id, COUNT(order_id) AS orders_count
    FROM user_actions
    WHERE user_actions.order_id NOT IN (SELECT order_id
                                        FROM user_actions
                                        WHERE action = 'cancel_order')
    GROUP BY user_id),
    
    
    us_av_or_sz AS
    (SELECT user_id, ROUND(AVG(array_length(product_ids, 1)), 2) AS avg_order_size
    FROM (SELECT user_id, user_actions.order_id, product_ids
    FROM 
    user_actions
    INNER JOIN 
    orders
    ON user_actions.order_id = orders.order_id
    WHERE user_actions.order_id NOT IN (SELECT order_id
                                        FROM user_actions
                                        WHERE action = 'cancel_order')
    ORDER BY user_id, user_actions.order_id) t1
    GROUP BY user_id),
    
    
    us_sum_or_v AS
    (SELECT user_id, SUM(price) AS sum_order_value
    FROM (SELECT user_id, order_id, t2.product_id, price
    FROM 
    (SELECT user_id, user_actions.order_id, unnest(product_ids) AS product_id
    FROM 
    user_actions
    INNER JOIN 
    orders
    ON user_actions.order_id = orders.order_id
    WHERE user_actions.order_id NOT IN (SELECT order_id
                                        FROM user_actions
                                        WHERE action = 'cancel_order')) t2
    INNER JOIN
    products
    ON t2.product_id = products.product_id) t3
    GROUP BY user_id),
    
    
    us_avg_or_v AS
    (SELECT user_id, ROUND(AVG(sum_order), 2) AS avg_order_value
    FROM (SELECT user_id, order_id, SUM(price) AS sum_order
    FROM (SELECT user_id, order_id, t2.product_id, price
    FROM 
        (SELECT user_id, user_actions.order_id, unnest(product_ids) AS product_id
        FROM 
        user_actions
        INNER JOIN 
        orders
        ON user_actions.order_id = orders.order_id
        WHERE user_actions.order_id NOT IN (SELECT order_id
                                        FROM user_actions
                                        WHERE action = 'cancel_order')) t2
    INNER JOIN
    products
    ON t2.product_id = products.product_id) t4
    GROUP BY user_id, order_id) t5
    GROUP BY user_id),
    
    
    us_min_or_v AS
    (SELECT user_id, MIN(sum_order) AS min_order_value
    FROM (SELECT user_id, order_id, SUM(price) AS sum_order
    FROM (SELECT user_id, order_id, t2.product_id, price
    FROM 
        (SELECT user_id, user_actions.order_id, unnest(product_ids) AS product_id
        FROM 
        user_actions
        INNER JOIN 
        orders
        ON user_actions.order_id = orders.order_id
        WHERE user_actions.order_id NOT IN (SELECT order_id
                                        FROM user_actions
                                        WHERE action = 'cancel_order')) t2
    INNER JOIN
    products
    ON t2.product_id = products.product_id) t4
    GROUP BY user_id, order_id) t5
    GROUP BY user_id),
    
    
    us_max_or_v AS
    (SELECT user_id, MAX(sum_order) AS max_order_value
    FROM (SELECT user_id, order_id, SUM(price) AS sum_order
    FROM (SELECT user_id, order_id, t2.product_id, price
    FROM 
        (SELECT user_id, user_actions.order_id, unnest(product_ids) AS product_id
        FROM 
        user_actions
        INNER JOIN 
        orders
        ON user_actions.order_id = orders.order_id
        WHERE user_actions.order_id NOT IN (SELECT order_id
                                        FROM user_actions
                                        WHERE action = 'cancel_order')) t2
    INNER JOIN
    products
    ON t2.product_id = products.product_id) t4
    GROUP BY user_id, order_id) t5
    GROUP BY user_id)
    
    
SELECT us_or_ct.user_id, orders_count, avg_order_size, sum_order_value, 
       avg_order_value, min_order_value, max_order_value
FROM 
us_or_ct
INNER JOIN
us_av_or_sz
ON us_or_ct.user_id = us_av_or_sz.user_id
INNER JOIN 
us_sum_or_v
ON us_or_ct.user_id = us_sum_or_v.user_id
INNER JOIN 
us_avg_or_v
ON us_or_ct.user_id = us_avg_or_v.user_id
INNER JOIN
us_min_or_v
ON us_or_ct.user_id = us_min_or_v.user_id
INNER JOIN 
us_max_or_v
ON us_or_ct.user_id = us_max_or_v.user_id
ORDER BY user_id