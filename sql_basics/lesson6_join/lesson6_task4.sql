WITH left_join_users AS 
    (SELECT user_actions.user_id AS user_id_left, users.user_id AS user_id_right,
               order_id, time, action, sex, birth_date
    FROM
    user_actions 
    LEFT JOIN 
    users
    ON user_actions.user_id = users.user_id
    ORDER BY user_id_left)

SELECT COUNT(DISTINCT user_id_left) AS users_count
FROM left_join_users