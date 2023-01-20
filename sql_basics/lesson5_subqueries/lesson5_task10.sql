WITH couriers_info AS 
        (SELECT courier_id, COUNT(order_id)
        FROM courier_actions
        WHERE action = 'deliver_order' AND DATE_PART('month', time) = 9 AND DATE_PART('year', time) = 2022
        GROUP BY courier_id
        HAVING COUNT(order_id) >= 30)

SELECT *
FROM couriers
WHERE courier_id IN (SELECT courier_id FROM couriers_info)
ORDER BY courier_id