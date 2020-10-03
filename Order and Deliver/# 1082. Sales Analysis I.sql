# 1082. Sales Analysis I

# Reports the best seller by total sales price, If there is a tie, report them all.

SELECT seller_id
FROM Sales 
GROUP BY seller_id
HAVING SUM(price) = (
    SELECT SUM(price) 
        FROM Sales
        GROUP BY seller_id
        ORDER BY SUM(price) DESC
        LIMIT 1)
;
