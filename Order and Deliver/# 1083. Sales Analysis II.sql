# 1083. Sales Analysis II

# reports the buyers who have bought S8 but not iPhone. Note that S8 and iPhone are products present in the Product table

SELECT s.buyer_id
FROM Sales s JOIN Product p USING(product_id)
GROUP BY s.buyer_id 
HAVING SUM(p.product_name = "S8") > 0
AND SUM(p.product_name = "iPhone") = 0
;