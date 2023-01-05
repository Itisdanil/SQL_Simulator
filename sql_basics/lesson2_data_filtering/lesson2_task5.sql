SELECT user_id, order_id, action, time
FROM user_actions
WHERE user_id in (170, 200, 230) and  time BETWEEN '2022-08-25' and '2022-09-05'
ORDER BY time DESC