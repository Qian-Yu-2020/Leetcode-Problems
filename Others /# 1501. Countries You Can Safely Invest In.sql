# 1501. Countries You Can Safely Invest In

# A telecommunications company wants to invest in new countries
# The countries where the average call duration of the calls in this country is strictly greater than the global average call duration

SELECT Country.name AS country
FROM Person JOIN Calls ON Calls.caller_id = Person.id OR Calls.callee_id = Person.id
JOIN Country ON Country.country_code = LEFT(Person.phone_number, 3)
GROUP BY Country.name
HAVING AVG(duration) > (SELECT AVG(duration) FROM Calls)



select country from(
select c.name as country, avg(cl.duration)over(partition by c.name) av, avg(cl.duration)over() avv from calls cl join person p on cl.caller_id=p.id or cl.callee_id=p.id join country c on left(p.phone_number,3)=c.country_code
) t
where av>avv
group by country



select c.name as country from
(select caller_id as id,duration from calls
union all
select callee_id as id,duration from calls) as a join person p on a.id = p.id join country c on left(p.phone_number,3) = c.country_code
group by c.name having avg(duration)>(select avg(duration) from calls);



SELECT Co.name country
FROM Country Co
JOIN Person P 
ON Co.country_code = LEFT(P.phone_number,3)
JOIN Calls Ca 
ON P.id = Ca.caller_id OR P.id = Ca.callee_id
GROUP BY Co.name
HAVING AVG(Ca.duration) > (SELECT AVG(duration) FROM Calls)




SELECT
 co.name AS country
FROM
 person p
 JOIN
     country co
     ON SUBSTRING(phone_number,1,3) = country_code
 JOIN
     calls c
     ON p.id IN (c.caller_id, c.callee_id)
GROUP BY
 co.name
HAVING
 AVG(duration) > (SELECT AVG(duration) FROM calls)





With tmp AS (
SELECT b.name, SUM(c.duration) AS p_sum,  COUNT(c.caller_id) AS counts
FROM Person a
INNER JOIN Country b
ON substr(a.phone_number, 1, 3) = b.country_code
INNER JOIN Calls c
ON c.caller_id = a.id OR c.callee_id = a.id
GROUP BY b.name
)

SELECT name AS country
FROM tmp 
GROUP BY name
HAVING SUM(p_sum) / SUM(counts) > (
SELECT AVG(duration) 
FROM Calls
)



select name as country from
(
    select c.name,sum(calls.duration)/count(calls.duration) as avg_duration
    from person p
    join country c on c.country_code = substr(p.phone_number,1,3)
    join calls on (p.id = calls.caller_id) or (p.id = calls.callee_id)
    group by c.name
    order by c.name
)av_du
where avg_duration > (select avg(duration) from calls)





















































