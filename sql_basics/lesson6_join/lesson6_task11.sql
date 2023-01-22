WITH users_orders AS 
    (SELECT user_id, user_actions.order_id, product_ids
    FROM 
    user_actions
    INNER JOIN 
    orders
    ON user_actions.order_id = orders.order_id
    WHERE user_actions.order_id NOT IN (SELECT order_id
                                        FROM user_actions
                                        WHERE action = 'cancel_order')
    ORDER BY user_id, user_actions.order_id)
    
SELECT user_id, ROUND(AVG(array_length(product_ids, 1)), 2) AS avg_order_size
FROM users_orders
GROUP BY user_id
ORDER BY user_id