# 1543. Fix Product Name Format

# product_name in lowercase without leading or trailing white spaces.
# sale_date in the format ('YYYY-MM') 
# total the number of times the product was sold in this month.
# Return the result table ordered by product_name in ascending order, in case of a tie order it by sale_date in ascending order.

SELECT LOWER(TRIM(product_name)) as PRODUCT_NAME, DATE_FORMAT(sale_date,"%Y-%m") AS SALE_DATE,COUNT(SALE_ID) AS TOTAL
FROM Sales 
GROUP BY 1, 2
ORDER BY 1, 2