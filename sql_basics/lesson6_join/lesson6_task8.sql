WITH limit_users AS 
    (SELECT user_id
    FROM users
    LIMIT 100
    )
    
SELECT user_id, name
FROM
limit_users
CROSS JOIN
products
ORDER BY user_id, name