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



select s.company_id, s.employee_id, s.employee_name,
round(
		case when x.max_sal between 1000 and 10000 then salary * 0.76
		when x.max_sal > 10000 then salary * 0.51 else salary end, 0) as salary

from salaries s inner join
(select company_id, max(salary) max_sal from salaries group by company_id) x

on s.company_id = x.company_id;



WITH tax_multiplier AS (
SELECT company_id,
CASE WHEN MAX(salary) < 1000 THEN 1.0
WHEN MAX(salary) <= 10000 THEN 0.76
ELSE 0.51 END AS mult
FROM Salaries
GROUP BY company_id
)
SELECT s.company_id, s.employee_id, s.employee_name, ROUND(s.salary * t.mult) AS salary
FROM Salaries s JOIN tax_multiplier t ON s.company_id = t.company_id;




select s.company_id, s.employee_id, s.employee_name, round(s.salary * t.factor) as salary
from Salaries s join (
    select company_id,
    case when max(salary) < 1000 then 1.0
    when max(salary) <= 10000 then 0.76
    else 0.51 
    end as factor
    from Salaries
    group by 1) t
using(company_id)



select b.company_id, employee_id, employee_name, 
round((case when a.mx<1000 then salary
when a.mx>=1000 and a.mx<=10000 then salary - salary*.24
else salary - salary*.49 end),0) as salary from 
(
    select company_id, max(salary) as mx
    from salaries
    group by company_id
) a
inner join salaries b
on a.company_id = b.company_id










