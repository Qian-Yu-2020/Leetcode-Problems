# 1421. NPV Queries

# For not present in the NPV table, we consider it 0, The npv values of all other queries can be found in the NPV table

SELECT Queries.id AS id, Queries.year, IFNULL(NPV.npv,0) AS npv
FROM Queries LEFT JOIN NPV USING(id,year)
ORDER BY id
;
