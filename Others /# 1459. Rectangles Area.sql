# 1459. Rectangles Area

# Report of all possible rectangles which can be formed by any two points of the table
# Descending order by area in case of tie in ascending order by p1 and p2

SELECT a.id AS p1, b.id AS p2, ABS(a.x_value - b.x_value)*ABS(a.y_value - b.y_value) AS area 
FROM Points a JOIN Points b
ON a.id < b.id
AND a.x_value != b.x_value
AND a.y_value != b.y_value
ORDER BY area DESC, p1, p2


SELECT * 
FROM (
SELECT p1.id AS P1, p2.id AS P2, ABS((p2.x_value - p1.x_value)*(p2.y_value - p1.y_value)) AS AREA
FROM Points p1, Points p2
WHERE p1.id<p2.id ) tmp
WHERE tmp.AREA!=0
ORDER BY AREA DESC, P1 ASC , P2 ASC



select * from(
select t1.id as P1, t2.id as P2, abs((t1.x_value - t2.x_value) * (t1.y_value - t2.y_value)) as AREA
from points t1 join points t2 on t1.id < t2.id) t where AREA <> 0
order by AREA desc, P1 asc, P2 asc 



SELECT t1.id p1, t2.id p2, ABS(t1.x_value-t2.x_value)*ABS(t1.y_value-t2.y_value) area
FROM Points t1, Points t2
WHERE t1.id <> t2.id AND t1.x_value <> t2.x_value AND t1.y_value <> t2.y_value AND t1.id < t2.id
ORDER BY 3 DESC, p1, p2