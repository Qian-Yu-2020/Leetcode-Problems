# 1127. User Purchase Platform

# Find the total number of users and the total amount spent using mobile only, desktop only and both mobile and desktop together for each date

WITH cte AS ( SELECT spend_date
    , user_id
    , ( CASE 
            WHEN count(platform) = 2 THEN 'both' 
            WHEN max(platform) = 'mobile' THEN 'mobile'
            ELSE 'desktop' 
        END ) AS platform
        , sum(amount) AS total_amount
FROM spending 
    GROUP BY spend_date, user_id
    ORDER BY spend_date ) 

SELECT t2.spend_date
    , t2.platform
    , sum( IFNULL (total_amount, 0)) AS total_amount
    , count(user_id) AS total_users

FROM (select DISTINCT spend_date
        , t.platform
    FROM cte CROSS JOIN (
        SELECT 'desktop' AS platform union
        SELECT 'mobile' union
        SELECT 'both'
    ) t ) t2 
    LEFT JOIN cte ON t2.spend_date = cte.spend_date AND t2.platform = cte.platform
    GROUP BY t2.spend_date, t2.platform