# 579. Find Cumulative Salary of an Employee

# Get the cumulative sum of an employee's salary over a period of 3 months but exclude the most recent month.

# The result should be displayed by 'Id' ascending, and then by 'Month' descending

SELECT Id, 
    Month, 
    SUM(Salary) OVER (PARTITION BY Id ORDER BY Month ROWS 2 PRECEDING) AS Salary 
FROM Employee
WHERE (Id, Month) NOT IN (SELECT Id, MAX(Month) FROM Employee GROUP BY 1)
ORDER BY 1, 2 DESC