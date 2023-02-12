with orders_unnest as (SELECT order_id,
                              unnest(product_ids) as count_products
                       FROM   orders), order_id_count_pr as (SELECT order_id,
                                             count(count_products) as count_products
                                      FROM   orders_unnest
                                      GROUP BY order_id
                                      ORDER BY count(count_products) desc), order_id_with_max_count_pr as (SELECT order_id
                                                                     FROM   order_id_count_pr
                                                                     WHERE  count_products = (SELECT max(count_products)
                                                                                              FROM   order_id_count_pr))
SELECT DISTINCT o.order_id,
                u_act.user_id,
                date_part('year', age((SELECT max(time)
                       FROM   user_actions), u.birth_date)) as user_age, c_act.courier_id, date_part('year', age((SELECT max(time)
                                                                                           FROM   courier_actions), c.birth_date)) as courier_age
FROM   order_id_with_max_count_pr o
    INNER JOIN user_actions u_act
        ON o.order_id = u_act.order_id
    INNER JOIN users u
        ON u_act.user_id = u.user_id
    INNER JOIN courier_actions c_act
        ON o.order_id = c_act.order_id
    INNER JOIN couriers c
        ON c_act.courier_id = c.courier_id
ORDER BY order_id