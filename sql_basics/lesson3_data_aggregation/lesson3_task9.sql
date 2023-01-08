SELECT AGE(MAX(birth_date), MIN(birth_date)) as age_diff
FROM users
WHERE sex = 'male'