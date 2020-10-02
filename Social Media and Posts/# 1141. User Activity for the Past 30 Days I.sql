# 1141. User Activity for the Past 30 Days I

# Find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on some day if he/she made at least one activity on that day.
# Note that we do not care about days with zero active users

SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users 
FROM Activity
WHERE DATEDIFF("2019-07-27", activity_date) < 30 
GROUP BY activity_date

