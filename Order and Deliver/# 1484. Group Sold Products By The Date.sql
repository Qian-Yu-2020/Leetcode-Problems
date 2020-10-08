# 1484. Group Sold Products By The Date

# find for each date, the number of distinct products sold and their names.
# The sold-products names for each date should be sorted lexicographically. 

SELECT DISTINCT sell_date, COUNT(DISTINCT product) AS num_sold, 
    GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ',') AS products # aggregate the product names in one cell
FROM Activities 
GROUP BY sell_date
;


select sell_date, count(distinct product) as num_sold, 
group_concat(distinct product order by product ASC separator ',') as products from Activities 
group by sell_date


SELECT sell_date,
		COUNT(DISTINCT(product)) AS num_sold, 
		GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ',') AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date ASC



select sell_date, count(distinct product) as num_sold , 
group_concat(distinct product order by product asc separator ',') as products               
from activities  
group by sell_date
order by sell_date



select 
	sell_date, 
	COUNT(product) num_sold,  
	group_concat(product order by product) products 
from (SELECT DISTINCT * FROM Activities) Activities
group by sell_date
order by sell_date




select 
    sell_date, COUNT(DISTINCT product) num_sold, 
    group_concat(DISTINCT product) products 
from Activities
group by sell_date
order by sell_date








