# 1069. Product Sales Analysis II

# Reports the total quantity sold for every product id
SELECT product_id, SUM(quantity) AS total_quantity
FROM Sales 
GROUP BY product_id
;