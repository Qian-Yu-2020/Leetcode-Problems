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




SELECT customer_name, customer_id, order_id, order_date
FROM 
 (
   SELECT name AS customer_name, Customers.customer_id, order_id, order_date, (row_number() over (partition by Customers.customer_id order by order_date DESC)) AS rownum
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
ORDER BY customer_name, Customers.customer_id, order_date DESC
 
) latest_orders
WHERE rownum <= 3




WITH added_rowNumbers_per_customer
     AS (SELECT c.customer_id, 
                c.name, 
                o.order_id,
                o.order_date, 
                ROW_NUMBER() OVER(PARTITION BY c.customer_id
                ORDER BY o.order_date DESC) AS row_num
         FROM customers AS c
              JOIN orders AS o ON c.customer_id = o.customer_id)
     SELECT 
            name as customer_name,
            customer_id, 
            order_id,
            order_date
     FROM added_rowNumbers_per_customer
     WHERE row_num < 4
     ORDER BY name, 
              customer_id ASC, 
              order_date DESC;



SELECT
 c.name AS customer_name, o1.customer_id, o1.order_id, o1.order_date
FROM
 orders o1
 LEFT JOIN
      orders o2
      ON o1.customer_id = o2.customer_id
      AND o1.order_date < o2.order_date
 INNER JOIN
       customers c
       ON o1.customer_id = c.customer_id
GROUP BY
 o1.customer_id, c.name, o1.order_id, o1.order_date
HAVING
 COUNT(o2.order_date) <= 2
ORDER BY
 c.name, o1.customer_id, o1.order_date desc