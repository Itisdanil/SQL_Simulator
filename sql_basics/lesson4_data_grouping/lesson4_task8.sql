SELECT courier_id, COUNT(courier_id) AS delivered_orders
FROM courier_actions
WHERE DATE_PART('year', time) = 2022 AND DATE_PART('month', time) = 9 AND action = 'deliver_order'
GROUP BY courier_id
ORDER BY delivered_orders DESC
LIMIT 3