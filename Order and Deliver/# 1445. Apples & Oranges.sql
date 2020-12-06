# 1445. Apples & Oranges

# Report the difference between number of apples and oranges sold each day
# Return the result table ordered by sale_date in format ('YYYY-MM-DD')


# If there only two possible situations in CASE statement, 
# I can use ELSE for another situation, instead of stating both of two situations.
SELECT sale_date, 
    SUM(CASE WHEN fruit = "apples" THEN sold_num ELSE (-sold_num) END) AS diff
FROM Sales

# Don't forgot to GROUP BY when using SUM
GROUP BY sale_date





SELECT a.sale_date sale_date, num_apples - num_oranges as diff
FROM
	# Create table for Apples
    (SELECT sale_date, sold_num as num_apples
    FROM Sales
    WHERE fruit = 'apples') a,
	# Create table for Oranges
    (SELECT sale_date, sold_num as num_oranges
    FROM Sales
    WHERE fruit = 'oranges') o
WHERE
	# Join on sale_date
    o.sale_date = a.sale_date
ORDER BY 1




SELECT a.sale_date, (a.sold_num- b.sold_num) as diff
from Sales a, Sales b
where a.sale_date = b.sale_date and a.fruit='apples' and a.fruit!=b.fruit
order by a.sale_date



select sale_date, sum(if(fruit = 'apples', sold_num, -sold_num)) diff 
from Sales 
group by sale_date;



select a.sale_date, (a.sold_num- b.sold_num) as diff from
(select sale_date, sold_num from Sales where fruit='apples') as a
join
(select sale_date, sold_num from Sales where fruit='oranges') as b
on a.sale_date = b.sale_date 




with apple as 
(select sale_date, sold_num from Sales where fruit='apples' group by sale_date),

oranges as 
(select sale_date, sold_num from Sales where fruit='oranges' group by sale_date)

select a.sale_date, (a.sold_num-o.sold_num) as diff 
from apple a join oranges o 
on a.sale_date=o.sale_date




with tmp as 
(select sale_date,
sum(case when fruit = 'apples' then sold_num end) as apples,
sum(case when fruit = 'oranges' then sold_num end) as oranges
from sales
group by sale_date)
select sale_Date, (apples-oranges) as diff
from tmp






















