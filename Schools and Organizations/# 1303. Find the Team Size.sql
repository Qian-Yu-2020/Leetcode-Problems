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



# Use LEFT JOIN to self-join; Don't forgot to use GROUP BY 
select e1.employee_id,count(*) team_size
		from employee e1 left join employee e2on e1.team_id = e2.team_id
group by e1.employee_id;
