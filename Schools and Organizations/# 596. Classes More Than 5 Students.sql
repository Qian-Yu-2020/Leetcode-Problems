# 596. Classes More Than 5 Students

# List out all classes which have more than or equal to 5 students

SELECT class 
FROM courses
GROUP BY class 
HAVING COUNT(DISTINCT student) >= 5 
;

