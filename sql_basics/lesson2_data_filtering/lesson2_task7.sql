SELECT user_id, birth_date
FROM users
WHERE sex = 'male' and birth_date IS NOT NULL
ORDER BY birth_date DESC 
LIMIT 50