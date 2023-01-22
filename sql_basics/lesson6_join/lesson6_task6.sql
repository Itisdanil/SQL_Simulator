WITH birth_users AS
    (SELECT birth_date, COUNT(user_id) AS users_count
    FROM users
    WHERE birth_date IS NOT NULL
    GROUP BY birth_date),
    birth_couriers AS
    (SELECT birth_date, COUNT(courier_id) AS couriers_count
    FROM couriers
    WHERE birth_date IS NOT NULL
    GROUP BY birth_date)
    
SELECT birth_users.birth_date AS users_birth_date, users_count,
       birth_couriers.birth_date AS couriers_birth_date, couriers_count
FROM
birth_users
FULL JOIN
birth_couriers
ON birth_users.birth_date = birth_couriers.birth_date
ORDER BY users_birth_date, couriers_birth_date