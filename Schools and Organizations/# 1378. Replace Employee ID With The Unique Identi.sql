# 1378. Replace Employee ID With The Unique Identifier

# Show the unique ID of each user, If a user doesn't have a unique ID replace just show null

SELECT unique_id, name
FROM Employees
    LEFT JOIN EmployeeUNI using(id)
;

