# 1075. Project Employees I

# Reports the average experience years of all the employees for each project, rounded to 2 digits

SELECT project_id, ROUND(AVG(experience_years),2) AS average_years
FROM Project JOIN Employee USING(employee_id)
GROUP BY project_id