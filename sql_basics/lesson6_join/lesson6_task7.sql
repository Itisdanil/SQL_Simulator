WITH union_tables AS 
    (SELECT birth_date
    FROM users
    WHERE birth_date IS NOT NULL
    UNION
    SELECT birth_date
    FROM couriers
    WHERE birth_date IS NOT NULL)

SELECT COUNT(birth_date) AS dates_count
FROM union_tables