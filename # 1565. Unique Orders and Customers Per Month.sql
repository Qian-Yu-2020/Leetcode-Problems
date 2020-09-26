# 1565. Unique Orders and Customers Per Month
# find the number of unique orders and the number of unique customers with invoices > $20 for each different month

SELECT DATE_FORMAT(order_date, "%Y-%m") AS month, 
        COUNT(DISTINCT order_id) AS order_count, 
        COUNT(DISTINCT customer_id) AS customer_count
FROM Orders 
WHERE invoice > 20
GROUP BY DATE_FORMAT(order_date, "%Y-%m")
;