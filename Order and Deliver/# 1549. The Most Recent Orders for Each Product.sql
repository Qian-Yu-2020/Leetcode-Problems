# 1549. The Most Recent Orders for Each Product

SELECT p.product_name, o.product_id, o.order_id, o.order_date
FROM Products p 
# Do not use LEFT JOIN, if there is no need to show "null" or "0" for not exist value
    JOIN Orders o ON p.product_id = o.product_id

# It would be clear to () the variable 
WHERE (o.product_id, o.order_date) IN (

	# Most recent means to find the largest date 
        SELECT product_id, MAX(order_date) AS order_date
        FROM Orders 
        GROUP BY product_id)
ORDER BY p.product_name, p.product_id, o.order_id;


# or 
# Instead of using sub-query, JOIN three tables 
SELECT p.product_name,p.product_id,o.order_id,o.order_date FROM Products p
JOIN Orders o ON p.product_id = o.product_id
JOIN (
      SELECT product_id, MAX(order_date) AS first_order_date FROM Orders
      GROUP BY product_id
     ) t
ON t.product_id = p.product_id AND t.first_order_date = o.order_date
ORDER BY p.product_name,p.product_id,o.order_id;


