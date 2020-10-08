# 1421. NPV Queries

# For not present in the NPV table, we consider it 0, The npv values of all other queries can be found in the NPV table

SELECT Queries.id AS id, Queries.year, IFNULL(NPV.npv,0) AS npv
FROM Queries LEFT JOIN NPV USING(id,year)
ORDER BY id
;


select q.id, q.year, ifnull(npv, 0) npv
from queries q left join npv n on
q.id = n.id and q.year = n.year



select q.id, q.year, coalesce(n.npv, 0) as npv
from npv n right join queries q
on n.id = q.id and n.year = q.year



select t1.id, t1.year, ifnull(npv, 0) as npv
from queries as t1
left join NPV as t2
on t1.id = t2.id and t1.year = t2.year;



