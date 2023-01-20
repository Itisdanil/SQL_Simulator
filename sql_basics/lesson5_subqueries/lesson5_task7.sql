WITH cancel_order_id AS (SELECT order_id
                         FROM user_actions
                         WHERE action = 'cancel_order')
                         
SELECT order_id
FROM user_actions
WHERE order_id NOT IN (SELECT * FROM cancel_order_id)
ORDER BY order_id