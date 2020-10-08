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
     


SELECT customer_id, name
FROM (
    SELECT c.customer_id, c.name, 
    SUM(CASE WHEN LEFT(o.order_date, 7) = '2020-06' THEN p.price*o.quantity ELSE 0 END) AS t1, 
    SUM(CASE WHEN LEFT(o.order_date, 7) = '2020-07' THEN p.price*o.quantity ELSE 0 END) AS t2
    FROM customers c
    JOIN orders o
    ON c.customer_id = o.customer_id
    JOIN product p
    ON p.product_id = o.product_id
    GROUP BY 1
    ) tmp
WHERE t1 >= 100 AND t2 >= 100




with temp as(
    select 
    c.customer_id, c.name, sum(p.price * o.quantity) as price
    from Customers c
    inner join 
    Orders o
    on c.customer_id = o.customer_id
    inner join
    Product p
    on o.product_id = p.product_id
    where o.order_date like '2020-06%' or o.order_date like '2020-07%'
    group by c.customer_id, c.name, month(o.order_date))

select customer_id, name from temp
group by customer_id, name
having sum(case when price >= 100 then 1 else 0 end) = 2




with cte as
(
Select o.Customer_id, year(o.order_date) as yr, month(o.order_date)as mon,sum(o.quantity*p.price) as quantity from Customers c
right join orders o on c.customer_id=o.order_id
left join product p on o.product_id=p.product_id
group by o.customer_id,year(o.order_date) ,month(o.order_date)

)
Select c1.customer_id,c.name from cte c1 left join customers c
on c1.customer_id=c.customer_id
where mon in (6,7) and yr='2020' and quantity >=100
group by c1.customer_id,c.name
having count(c1.customer_id)=2




select customer_id, name from
(select o.customer_id, c.name, 
 sum(case when order_date between '2020-06-01' and '2020-06-30' then o.quantity * p.price else 0 end) as june_exp,
 sum(case when order_date between '2020-07-01' and '2020-07-31' then o.quantity * p.price else 0 end) as july_exp
 from Orders as o
left join Product as p using(product_id)
left join Customers as c using(customer_id)

where order_date between '2020-06-01' and '2020-07-31'
group by o.customer_id, c.name
having june_exp >= 100 and july_exp >= 100) as tb1


































