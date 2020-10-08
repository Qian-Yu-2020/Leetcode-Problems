# 571. Find Median Given Frequency of Numbers

# Solution 1 
SELECT SUM(Number) / (COUNT(Number) + 0.0) AS median
FROM 
	(SELECT Number, Frequency,
	SUM(Frequency) OVER (ORDER BY Number) AS cumulative_num,
	SUM(Frequency) OVER () AS total_num
	FROM Numbers) sub
WHERE total_num / 2.0 BETWEEN cumulative_num - Frequency AND cumulative_num


# Solution 2
select avg(cast(Number as float)) median
from Numbers a
where Frequency >= abs((select sum(Frequency) from Numbers where Number<=a.Number) - 
                       (select sum(Frequency) from Numbers where Number>=a.Number))


# Solution 3
select avg(cast(number as float)) median
from (
    select l.number
    from Numbers l cross join Numbers r
    group by l.number
    having abs(sum(sign(l.number - r.number) * r.Frequency)) <= max(l.Frequency)
) t