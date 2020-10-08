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
WITH cte AS(
    SELECT exam_id, exam.student_id, student_name, score, RANK() OVER(PARTITION BY exam_id ORDER BY score) rk1, RANK() OVER(PARTITION BY exam_id ORDER BY score DESC) rk2 
    FROM exam LEFT JOIN student
    ON exam.student_id = student.student_id
)

SELECT DISTINCT student_id, student_name
FROM cte
WHERE student_id NOT IN (SELECT student_id FROM cte WHERE rk1 = 1 or rk2 = 1)
ORDER BY student_id




Select e.student_id, s.student_name from 
Exam e, student s,
(Select max(score) as high, min(score) as low, exam_id from Exam
group by exam_id) r
where 
	e.student_id = s.student_id 
	and e.exam_id = r.exam_id 
group by e.student_id, s.student_name
having sum(Case when e.score = r.high then 1 else 0 end) =0 and
sum(Case when e.score = r.low then 1 else 0 end)= 0 
order by e.student_id



SELECT student_id, student_name 
FROM Student
WHERE student_id IN 
    (SELECT DISTINCT student_id FROM Exam)
  AND student_id NOT IN 
      (
        SELECT student_id
        FROM Exam e1
        WHERE score = (SELECT max(score) FROM Exam e2 WHERE e1.exam_id = e2.exam_id)
          OR score = (SELECT min(score) FROM Exam e2 WHERE e1.exam_id = e2.exam_id)
      )


















