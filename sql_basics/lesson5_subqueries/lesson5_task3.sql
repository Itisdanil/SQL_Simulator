SELECT *
FROM products
WHERE price != (SELECT MIN(price) FROM products)
ORDER BY product_id DESC