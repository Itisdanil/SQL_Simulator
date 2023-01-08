SELECT AGE(MAX(birth_date))::VARCHAR AS min_age
FROM couriers
WHERE sex = 'male'