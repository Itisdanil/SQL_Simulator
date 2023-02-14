WITH one_order_users AS (SELECT user_id
                         FROM user_actions
                         GROUP BY user_id
                         HAVING COUNT(order_id) = 1),
     user_actions_wf AS (SELECT user_id,
                                order_id,
                                time,
                                row_number() over(partition by user_id order by time) as order_number,
                                lag(time) over(partition by user_id order by time) as time_lag,
                                age(time, lag(time) over(partition by user_id order by time)) as time_diff
                         FROM user_actions
                         WHERE order_id NOT IN (SELECT order_id FROM user_actions WHERE action = 'cancel_order') AND user_id NOT IN (SELECT * FROM one_order_users)
                         ORDER BY user_id, order_number)
                         

SELECT user_id, round(extract(epoch FROM avg(time_diff)) / 3600) AS hours_between_orders
FROM user_actions_wf
GROUP BY user_id
HAVING round(extract(epoch FROM avg(time_diff)) / 3600) IS NOT NULL
ORDER BY user_id
LIMIT 1000