with count_orders_by_date as (SELECT date(creation_time),
                                     count(*) as orders_count
                              FROM   orders
                              WHERE  order_id not in (SELECT order_id
                                                      FROM   user_actions
                                                      WHERE  action = 'cancel_order')
                              GROUP BY date(creation_time)), orders_count_by_date as (SELECT date,
                                                               orders_count
                                                        FROM   count_orders_by_date)
SELECT date,
       orders_count,
       round(avg(orders_count) OVER(ORDER BY date rows between 3 preceding and 1 preceding),
             2) as moving_avg
FROM   orders_count_by_date