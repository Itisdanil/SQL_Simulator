SELECT COUNT(DISTINCT user_id) AS users_count
FROM user_actions
WHERE time > (SELECT MAX(time) - INTERVAL '0 year 0 months 1 week' FROM user_actions) AND action = 'create_order'