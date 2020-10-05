# 613. Shortest Distance in a Line

SELECT MIN(p1.x - p2.x) AS shortest
FROM point p1, point p2
WHERE p1.x > p2.x
 