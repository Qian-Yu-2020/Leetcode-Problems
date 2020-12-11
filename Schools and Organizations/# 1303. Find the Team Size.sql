# 1303. Find the Team Size

# Best solution is using window function 
SELECT employee_id, 
		COUNT(employee_id) OVER (PARTITION BY team_id) AS team_size
FROM Employee
;


# Calculate in the Select statement
SELECT employee_id, 
		(SELECT COUNT(1)
		FROM Employee e2 WHERE e2.employee_id = e.employee_id) AS team_size 
FROM Employee e
;


# Use SELF-JOIN; Don't forgot to use GROUP BY 
# Why need 2 tables - It's basically used where there is any relationship between rows stored in the same table (correlate pairs of rows from the same table)
select e1.employee_id,count(*) team_size
		from employee e1 left join employee e2on e1.team_id = e2.team_id
group by e1.employee_id;
