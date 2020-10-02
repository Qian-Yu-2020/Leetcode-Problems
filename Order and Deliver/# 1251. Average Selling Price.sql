# 1251. Average Selling Price

# Each row of this table indicates the price of the product_id in the period from start_date to end_date.
# For each product_id there will be no two overlapping periods. That means there will be no two intersecting periods for the same product_id.

SELECT p.product_id, ROUND(SUM(u.units*p.price)/SUM(u.units),2) AS average_price
FROM Prices p JOIN UnitsSold u USING(product_id)
WHERE u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY 1
;
