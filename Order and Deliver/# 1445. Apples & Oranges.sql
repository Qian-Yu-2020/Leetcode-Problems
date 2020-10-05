# 1445. Apples & Oranges

# Report the difference between number of apples and oranges sold each day
# Return the result table ordered by sale_date in format ('YYYY-MM-DD')

SELECT sale_date, 
    SUM(CASE WHEN fruit = "apples" THEN sold_num ELSE (-sold_num) END) AS diff
FROM Sales
GROUP BY sale_date