# 1350. Students With Invalid Departments
# Find the id and the name of all students who are enrolled in departments that no longer exists
SELECT s.id, s.name 
FROM Students s 
# Because the SELECT information is from Student table
    LEFT JOIN Departments d ON d.id = s.department_id
WHERE d.name IS NULL
;

# or
# Has to use LEFT JOIN?
SELECT s.id, s.name
FROM department d, students s
WHERE d.id = s.department_id
AND d.name IS NULL 
;
