# 1280. Students and Examinations

# Find the number of times each student attended each exam

# Examinations table has no primary key for this table. It may contain duplicates
# Each student from the Students table takes every course from Subjects table

SELECT s.student_id, s.student_name, su.subject_name, 

#Because they asked the each student & each exam, which has to count every record 
(SELECT COUNT(1) 
	FROM Examinations 
	# Don't forgot to connect TWO variables 
	WHERE student_id = s.student_id 
	AND subject_name = su.subject_name) AS attended_exams
FROM Students s
JOIN Subjects su
 ORDER BY s.student_id, su.subject_name

