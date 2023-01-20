WITH user_count_orders AS
     (SELECT user_id, COUNT(user_id) AS count_orders
      FROM user_actions
      WHERE action = 'create_order'
      GROUP BY user_id)

SELECT ROUND(AVG(count_orders), 2) AS orders_avg
FROM user_count_orders