# 1407. Top Travellers

# report the distance travelled by each user.

SELECT name, IFNULL(SUM(distance),0) AS travelled_distance
FROM Users u
LEFT JOIN Rides r ON u.id = r.user_id
GROUP BY u.id
ORDER BY travelled_distance DESC, name ASC
;



select
    u.name,
    ifnull(r.tot,0) as travelled_distance
from
    Users u
    left join
    (select user_id, sum(distance) as tot
    from Rides
    group by user_id) r
on 
    u.id = r.user_id
order by
    r.tot desc,
    u.name




select u.name, ifnull(sum(r.distance), 0) as travelled_distance
from users u
left join rides r
on u.id = r.user_id
group by r.user_id
order by travelled_distance desc, u.name asc




select u.name, coalesce(sum(r.distance),0) as "travelled_distance"
from users as u
left join rides as r
on u.id = r.user_id
group by u.name
order by travelled_distance desc, u.name





select name, sum(ifnull(distance,0)) as travelled_distance
from rides r
right join users u
on r.user_id = u.id
group by name
order by 2 desc,1 asc;



























