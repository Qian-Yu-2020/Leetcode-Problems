# 1549. The Most Recent Orders for Each Product

SELECT p.product_name, o.product_id, o.order_id, o.order_date
FROM Products p 
    JOIN Orders o ON p.product_id = o.product_id
WHERE (o.product_id, o.order_date) IN (
        SELECT product_id, MAX(order_date) AS order_date
        FROM Orders 
        GROUP BY product_id)
ORDER BY p.product_name, p.product_id, o.order_id;



select b.product_name, a.product_id, a.order_id, a.order_date from Orders a
join Products b
on a.product_id = b.product_id
where (a.product_id, a.order_date) in (
select product_id, max(order_date) as order_date
from Orders
group by product_id)
order by b.product_name, a.product_id, a.order_id



SELECT p.product_name,p.product_id,o.order_id,o.order_date FROM Products p
JOIN Orders o ON p.product_id = o.product_id
JOIN (
      SELECT product_id, MAX(order_date) AS first_order_date FROM Orders
      GROUP BY product_id
     ) t
ON t.product_id = p.product_id AND t.first_order_date = o.order_date
ORDER BY p.product_name,p.product_id,o.order_id;


