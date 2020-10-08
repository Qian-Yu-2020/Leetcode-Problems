# 618. Students Report By Geography

# Pivot the continent column in this table so that each name is sorted alphabetically and displayed underneath its corresponding continent. The output headers should be America, Asia and Europe respectively. It is guaranteed that the student number from America is no less than either Asia or Europe.

WITH continent_pivot AS
(
SELECT
CASE WHEN continent = 'America' THEN name END AS 'America',
CASE WHEN continent = 'Asia' THEN name END AS 'Asia',
CASE WHEN continent = 'Europe' THEN name END AS 'Europe',
ROW_NUMBER() OVER(PARTITION BY continent ORDER BY name) AS rk
FROM student
)

SELECT
MAX(America) AS America,
MAX(Asia) AS Asia,
MAX(Europe) AS Europe
FROM continent_pivot
GROUP BY rk;

