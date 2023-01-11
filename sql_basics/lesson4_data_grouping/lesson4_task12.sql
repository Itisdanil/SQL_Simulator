SELECT (CASE
      WHEN DATE_PART('year', AGE(birth_date)) >= 19 AND DATE_PART('year', AGE(birth_date)) <= 24 THEN '19-24'
      WHEN DATE_PART('year', AGE(birth_date)) >= 25 AND DATE_PART('year', AGE(birth_date)) <= 29 THEN '25-29'
      WHEN DATE_PART('year', AGE(birth_date)) >= 30 AND DATE_PART('year', AGE(birth_date)) <= 35 THEN '30-35'
      WHEN DATE_PART('year', AGE(birth_date)) >= 36 AND DATE_PART('year', AGE(birth_date)) <= 41 THEN '36-41'
      END) AS group_age, 
      COUNT(user_id) AS users_count
FROM users
WHERE birth_date IS NOT NULL
GROUP BY group_age
ORDER BY group_age