# 1407. Top Travellers

# report the distance travelled by each user.

SELECT name, IFNULL(SUM(distance),0) AS travelled_distance
FROM Users u
LEFT JOIN Rides r ON u.id = r.user_id
GROUP BY u.id
ORDER BY travelled_distance DESC, name ASC
;
