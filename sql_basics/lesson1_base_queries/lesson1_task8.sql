SELECT courier_id, COALESCE(DATE_PART('year', birth_date)::VARCHAR, 'unknown') AS birth_year
FROM couriers
ORDER BY birth_year DESC, courier_id