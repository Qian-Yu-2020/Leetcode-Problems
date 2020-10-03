# 1068. Product Sales Analysis I

# Reports all product names of the products in the Sales table along with their selling year and price

SELECT p.product_name, s.year, s.price
FROM Sales s JOIN Product p USING(product_id)
;
