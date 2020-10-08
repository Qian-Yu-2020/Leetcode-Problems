# 615. Average Salary: Departments VS Company

WITH company_avg AS
(
    SELECT left(s.pay_date,7) AS pay_month,
    AVG(amount) AS avg_amount
    FROM salary s
    GROUP BY 1
),
dept_avg AS
(
    SELECT left(s.pay_date,7) AS pay_month,
    e.department_id,
    AVG(s.amount) AS avg_amount
    FROM salary s
    JOIN employee e
    ON s.employee_id = e.employee_id
    GROUP BY 1, 2
)

SELECT d.pay_month,
d.department_id,
CASE WHEN d.avg_amount > c.avg_amount THEN 'higher'
WHEN d.avg_amount < c.avg_amount THEN 'lower'
ELSE 'same' END AS comparison
FROM dept_avg d
JOIN company_avg c
ON d.pay_month = c.pay_month;