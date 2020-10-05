# 577. Employee Bonus

# Select all employee's name and bonus whose bonus is < 1000

SELECT Employee.name, Bonus.bonus 
FROM Employee LEFT JOIN Bonus USING(empId)
WHERE Bonus.bonus < 1000 OR Bonus.bonus IS NULL
;
