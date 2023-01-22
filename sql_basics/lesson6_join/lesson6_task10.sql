WITH cancel_order_id AS (SELECT order_id
                         FROM user_actions
                         WHERE action = 'cancel_order')

SELECT user_id, user_actions.order_id, product_ids
FROM 
user_actions
INNER JOIN 
orders
ON user_actions.order_id = orders.order_id
WHERE user_actions.order_id NOT IN (SELECT * FROM cancel_order_id)
ORDER BY user_id, user_actions.order_id