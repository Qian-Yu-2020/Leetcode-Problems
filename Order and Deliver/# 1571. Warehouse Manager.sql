# 1571. Warehouse Manager
# How much cubic feet of volume does the inventory occupy in each warehouse.


# first, find how many volumn for each product 
# SELECT product_id, Width*Length*Height AS volume 
# FROM Products 

SELECT w.name AS warehouse_name, SUM(w.units*pro.volume) AS volume
FROM Warehouse w 
    LEFT JOIN (SELECT product_id, Width*Length*Height AS volume FROM Products) pro
ON pro.product_id = w.product_id 
GROUP BY w.name
;
    


SELECT name warehouse_name,
       SUM(units * Width * Length * Height) volume
FROM Warehouse W
LEFT JOIN Products P 
ON W.product_id = P.product_id
GROUP BY name




SELECT name warehouse_name, SUM(units * size) volume
FROM Warehouse W
LEFT JOIN
(
    SELECT product_id, Width * Length * Height size
    FROM Products
) ps
ON W.product_id = ps.product_id
GROUP BY name



SELECT 
  name AS warehouse_name,
  SUM(units*Width*Length*Height) AS volume
FROM Warehouse 
LEFT JOIN Products ON Warehouse.product_id = Products.product_id
GROUP BY name




select name as warehouse_name, SUM(units* Width* Length* Height) as volume

from Warehouse w join Products p on w.product_id = p.product_id

group by name