# 1398. Customers Who Bought Products A and B but Not C

# Report the customer_id and customer_name of customers who bought products "A", "B" but did not buy the product "C" since we want to recommend them buy this product.

SELECT o.customer_id, (SELECT customer_name FROM Customers WHERE customer_id = o.customer_id) AS customer_name
FROM Orders o
GROUP BY o.customer_id
HAVING SUM(o.product_name = "A") >0 
AND SUM(o.product_name = "B") >0
AND SUM(o.product_name = "C") = 0
;



select c.customer_id, c.customer_name 
from Customers as c
    inner join
    (select customer_id, 
        sum(CASE
        WHEN product_name = 'A' THEN 1
        WHEN product_name = 'B' THEN 1
        WHEN product_name = 'C' THEN -1
        ELSE 0 END) as tot   
    from Orders
    group by customer_id
    having tot > 1) as o
where c.customer_id = o.customer_id




SELECT c.customer_id, c.customer_name
FROM Customers c
JOIN Orders a ON a.customer_id = c.customer_id AND a.product_name = "A"
JOIN Orders b ON b.customer_id = c.customer_id AND b.product_name = "B"
LEFT OUTER JOIN Orders o on o.customer_id = c.customer_id AND o.product_name = "C"
WHERE o.order_id IS NULL




select distinct customer_id, customer_name
from Customers
where customer_id in
(
    select customer_id
    from Orders
    where product_name='A'
) and customer_id in
(
    select customer_id
    from Orders
    where product_name='B'
) and customer_id not in
(
    select customer_id
    from Orders
    where product_name='C'