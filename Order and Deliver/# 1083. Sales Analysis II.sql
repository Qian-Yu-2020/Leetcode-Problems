# 1083. Sales Analysis II

# reports the buyers who have bought S8 but not iPhone. Note that S8 and iPhone are products present in the Product table

# For avoiding the sub-query, sum 'item' number to define if it exsit or not 
# Having can also use AND to have more than 1 criterias 
# Can COUNT be instead SUM?
SELECT s.buyer_id
FROM Sales s JOIN Product p USING(product_id)
GROUP BY s.buyer_id 
HAVING SUM(p.product_name = "S8") > 0
AND SUM(p.product_name = "iPhone") = 0
;

# or 
# More common method 
SELECT DISTINCT s.buyer_id 
FROM Sales s LEFT JOIN Product p USING product_id 
WHERE p.product_name = “S8” AND 
	s.buyer_id NOT IN (
	SELECT buyer_id 
	FROM Sales s2 LEFT JOIN Product p2 USING product_id 
	WHERE p2.product_name = “iPhone”
	);

