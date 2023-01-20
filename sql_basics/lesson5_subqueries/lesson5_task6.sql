SELECT AGE(MAX(DATE(time)), (SELECT MAX(DATE(birth_date)) 
                             FROM couriers
                             WHERE sex = 'male'))::VARCHAR AS min_age

FROM courier_actions