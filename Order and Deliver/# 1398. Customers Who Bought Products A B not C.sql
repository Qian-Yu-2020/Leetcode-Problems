# 1398. Customers Who Bought Products A and B but Not C

# Report the customer_id and customer_name of customers who bought products "A", "B" but did not buy the product "C" since we want to recommend them buy this product.

SELECT o.customer_id, (SELECT customer_name FROM Customers WHERE customer_id = o.customer_id) AS customer_name
FROM Orders o
GROUP BY o.customer_id
HAVING SUM(o.product_name = "A") >0 
AND SUM(o.product_name = "B") >0
AND SUM(o.product_name = "C") = 0
;
