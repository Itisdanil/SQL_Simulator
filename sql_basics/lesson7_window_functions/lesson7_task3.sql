SELECT product_id,
       name,
       price,
       max(price) OVER(ORDER BY price desc) as max_price,
       min(price) OVER(ORDER BY price desc) as min_price
FROM   products
ORDER BY price desc, product_id