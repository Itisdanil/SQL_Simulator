with courier_delivered_orders_sep as (SELECT courier_id,
                                             count(*) as delivered_orders
                                      FROM   courier_actions
                                      WHERE  action = 'deliver_order'
                                         and date_part('month', time) = 9
                                      GROUP BY courier_id)
SELECT courier_id,
       delivered_orders,
       round(avg(delivered_orders) OVER(), 2) as avg_delivered_orders,
       case when delivered_orders > avg(delivered_orders) OVER() then 1
            else 0 end as is_above_avg
FROM   courier_delivered_orders_sep
