# 1412. Find the Quiet Students in All Exams

# A "quite" student is the one who took at least one exam and didn't score neither the high score nor the low score
# Report the students (student_id, student_name) being "quiet" in ALL exams. Don't return the student who has never taken any exam


# Solution 1 
SELECT student_id,student_name 
FROM Student
WHERE  student_id NOT IN(
                 SELECT a.student_id FROM(
                                  SELECT exam_id,student_id,
                        		 RANK() OVER(PARTITION BY exam_id ORDER BY score) AS ranktop,
		                         RANK() OVER(PARTITION BY exam_id ORDER BY score desc) AS rankbottom
		                          FROM Exam) as a
	             WHERE a.ranktop = 1 or a.rankbottom = 1)
AND student_id IN (SELECT DISTINCT student_id FROM Exam)
;


# Solution 2
