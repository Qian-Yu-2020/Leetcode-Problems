# 586. Customer Placing the Largest Number of Orders

SELECT customer_number
FROM orders
GROUP BY customer_number

# Because order id is the primary key, so when COUNT(order_id), COUNT(*) has the same affect 
# So there is no need to use sub-query, just count the records, which is simplier
ORDER BY COUNT(*) DESC
LIMIT 1
;