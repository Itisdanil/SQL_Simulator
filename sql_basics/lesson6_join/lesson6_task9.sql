SELECT user_id, user_actions.order_id, product_ids
FROM 
user_actions
INNER JOIN 
orders
ON user_actions.order_id = orders.order_id
ORDER BY user_id, user_actions.order_id