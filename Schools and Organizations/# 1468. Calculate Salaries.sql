# 1468. Calculate Salaries

# The tax rate is calculated for each company based on the following criteria:
# 0% If the max salary of any employee in the company is less than 1000$.
# 24% If the max salary of any employee in the company is in the range [1000, 10000] inclusive.
# 49% If the max salary of any employee in the company is greater than 10000$.
# Round the salary to the nearest integer.


SELECT s.company_id, s.employee_id, s.employee_name,
ROUND((CASE WHEN tmp.max_salary < 1000 THEN salary
      WHEN tmp.max_salary BETWEEN 1000 AND 10000 THEN salary*0.76
      ELSE salary * 0.51 END), 0) AS salary
FROM Salaries s
JOIN (
    SELECT m.company_id, MAX(m.salary) AS max_salary 
    FROM salaries m
    GROUP BY m.company_id) tmp
ON s.company_id = tmp.company_id 
;
