# 619. Biggest Single Number

# Write a SQL query to find the biggest number, which only appears once

SELECT (
    SELECT num 
       FROM my_numbers 
       GROUP BY num
       HAVING COUNT(*) = 1
              ORDER BY num DESC 
              LIMIT 1
) as num
;
