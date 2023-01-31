with users_age as (SELECT user_id, date_part('year', age((SELECT max(time)
                   FROM   user_actions), birth_date)) as age
                   FROM   users)
SELECT user_id,
       coalesce(age, (SELECT round(avg(age))
                      FROM   users_age)) as age
FROM   users_age
ORDER BY user_id