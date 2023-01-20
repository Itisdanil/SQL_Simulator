WITH user_count_orders AS 
    (SELECT user_id, COUNT(user_id) AS orders_count
     FROM user_actions
     WHERE action = 'create_order'
     GROUP BY user_id)
     
SELECT user_id, orders_count, (SELECT ROUND(AVG(orders_count), 2) FROM user_count_orders) AS orders_avg,
       orders_count - (SELECT ROUND(AVG(orders_count), 2) FROM user_count_orders) AS orders_diff
FROM user_count_orders
ORDER BY user_id