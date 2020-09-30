# 1484. Group Sold Products By The Date

# find for each date, the number of distinct products sold and their names.
# The sold-products names for each date should be sorted lexicographically. 

SELECT DISTINCT sell_date, COUNT(DISTINCT product) AS num_sold, 
    GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ',') AS products # aggregate the product names in one cell
FROM Activities 
GROUP BY sell_date
;
