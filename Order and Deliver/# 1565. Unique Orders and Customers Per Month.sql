# 1565. Unique Orders and Customers Per Month
# find the number of unique orders and the number of unique customers with invoices > $20 for each different month

SELECT DATE_FORMAT(order_date, "%Y-%m") AS month, 
        COUNT(DISTINCT order_id) AS order_count, 
        COUNT(DISTINCT customer_id) AS customer_count
FROM Orders 
WHERE invoice > 20
GROUP BY DATE_FORMAT(order_date, "%Y-%m")
;


select 
 SUBSTRING(order_date, 1, 7) as month,
 count(distinct order_id) as order_count,
 count(distinct customer_id) as customer_count
from
Orders
where invoice > 20
group by
SUBSTRING(order_date, 1, 7)




SELECT left(order_date, 7) AS month, 
		COUNT(DISTINCT order_id) AS order_count,
        COUNT(DISTINCT customer_id) AS customer_count
FROM Orders
WHERE invoice > 20
GROUP BY month




SELECT month, COUNT(order_id) as order_count, COUNT(DISTINCT customer_id) as customer_count
FROM
(
  SELECT SUBSTRING(order_date, 1, 7) as month, order_id, customer_id, invoice
  FROM Orders
  WHERE invoice > 20
) t
GROUP BY month



SELECT LEFT(order_date, 7) month, COUNT(DISTINCT order_id) order_count,
        COUNT(DISTINCT customer_id) customer_count
FROM orders
WHERE invoice > 20
GROUP BY 1




SELECT month,
COUNT(*) AS order_count,
COUNT(DISTINCT customer_id) AS customer_count
from
(select LEFT(order_date, 7) AS month,
customer_id
from Orders
where invoice > 20) AS tb1
group by month




SELECT DATE_FORMAT(order_date,'%Y-%m') AS month,
COUNT(order_id) AS order_count,
COUNT(DISTINCT customer_id) AS customer_count
FROM Orders
WHERE Invoice > 20
GROUP BY DATE_FORMAT(order_date,'%Y-%m')








