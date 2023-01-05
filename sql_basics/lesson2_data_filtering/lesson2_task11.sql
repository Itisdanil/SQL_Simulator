SELECT user_id, order_id, action, time
FROM user_actions
WHERE action = 'cancel_order' and DATE_PART('year', time) = 2022 and DATE_PART('month', time) = 8
      and DATE_PART('dow', time) = 3 and DATE_PART('hour', time) BETWEEN 12 and 15
ORDER BY time DESC