SELECT order_id
FROM user_actions
WHERE DATE_PART('year', time) = 2022 and DATE_PART('month', time) = 8 and action = 'create_order'
ORDER BY order_id