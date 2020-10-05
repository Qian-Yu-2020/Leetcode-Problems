# 511. Game Play Analysis I

# Reports the first login date for each player

SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id
;