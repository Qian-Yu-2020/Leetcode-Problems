# 1596. The Most Frequently Ordered Products for Each Customer

# No customer will order the same product more than once in a single day
# Find the most frequently ordered product(s) for each customer

SELECT customer_id, product_id, product_name
FROM (
    SELECT o.customer_id, o.product_id, p.product_name, 
        RANK() OVER (PARTITION BY customer_id ORDER BY COUNT(o.product_id) DESC) AS rnk
    FROM Orders o
    JOIN Products p ON o.product_id = p.product_id 
    GROUP BY customer_id, product_id
)temp
WHERE rnk = 1 
