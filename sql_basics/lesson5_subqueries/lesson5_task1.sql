SELECT ROUND(AVG(count_orders), 2) AS orders_avg
FROM (SELECT user_id, COUNT(user_id) AS count_orders
      FROM user_actions
      WHERE action = 'create_order'
      GROUP BY user_id) AS user_count_orders