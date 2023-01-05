SELECT product_id, name, price, ROUND((price * 20) / 120, 2) AS tax, 
                                ROUND(price - (price * 20) / 120, 2) AS price_before_tax
FROM products
ORDER BY price_before_tax DESC,  product_id