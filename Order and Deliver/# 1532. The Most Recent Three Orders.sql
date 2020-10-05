# 1532. The Most Recent Three Orders

# Find the most recent 3 orders of each user. If a user ordered less than 3 orders return all of their orders

SELECT c.name AS customer_name, c.customer_id, o.order_id, o.order_date
FROM Customers AS c
    JOIN Orders AS o ON c.customer_id = o.customer_id
WHERE(
    SELECT COUNT(*) 
    FROM Orders AS o2
    WHERE o.customer_id = o2.customer_id AND o.order_date< o2.order_date)<=2
ORDER BY customer_name,c.customer_id,o.order_date DESC
;