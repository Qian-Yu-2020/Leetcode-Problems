# 1378. Replace Employee ID With The Unique Identifier

# Show the unique ID of each user, If a user doesn't have a unique ID replace just show null

SELECT unique_id, name
FROM Employees
    # Unique ID variable doesn't exist will be shown as null, so EmployeeUNI table is put at the right side of LEFT JOIN function
    LEFT JOIN EmployeeUNI using(id) 
;

