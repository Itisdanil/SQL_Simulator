SELECT ROUND(AVG(price), 2) AS avg_price
FROM products
WHERE (name LIKE '%чай%' or name LIKE '%кофе%') and (name NOT LIKE 'иван%' and name NOT LIKE '%гриб%')