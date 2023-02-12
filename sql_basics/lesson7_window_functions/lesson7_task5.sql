SELECT user_id,
       order_id,
       time,
       row_number() OVER(PARTITION BY user_id
                         ORDER BY time) as order_number
FROM   user_actions
WHERE  order_id not in (SELECT order_id
                        FROM   user_actions
                        WHERE  action = 'cancel_order')
ORDER BY user_id, order_number limit 1000
