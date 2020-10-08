# 569. Median Employee Salary

# Find the median salary of each company. Bonus points if you can solve it without using any built-in SQL functions

With temp AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY Company ORDER BY Salary DESC,id DESC) as R1,
ROW_NUMBER() OVER(PARTITION BY Company ORDER BY Salary,id) as R2
FROM Employee
)

SELECT id as Id,
company as Company,
Salary
FROM temp
WHERE R1 BETWEEN R2 - 1 AND R2 + 1
ORDER BY 2,3