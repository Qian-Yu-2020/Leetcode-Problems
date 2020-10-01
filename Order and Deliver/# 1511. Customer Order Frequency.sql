# 1511. Customer Order Frequency

# Report the customer_id and customer_name of customers who have spent at least $100 in each month of June and July 2020

SELECT c.customer_id, c.name
FROM Customers c
JOIN Orders o USING(customer_id)
JOIN Product p USING(product_id)
                GROUP BY o.customer_id 
                 HAVING SUM(IF(LEFT(o.order_date, 7) = '2020-06',o.quantity,0) * p.price) >= 100
                 AND SUM(IF(LEFT(o.order_date, 7) = '2020-07',o.quantity,0) * p.price) >= 100
;
     