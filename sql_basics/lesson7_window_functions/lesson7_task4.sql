with count_orders_by_date as (SELECT date(creation_time),
                                     count(*) as orders_count
                              FROM   orders
                              WHERE  order_id not in (SELECT order_id
                                                      FROM   user_actions
                                                      WHERE  action = 'cancel_order')
                              GROUP BY date(creation_time))
SELECT date,
       orders_count,
       sum(orders_count) OVER(ORDER BY date) as orders_cum_count
FROM   count_orders_by_date