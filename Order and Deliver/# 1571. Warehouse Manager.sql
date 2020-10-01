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
    