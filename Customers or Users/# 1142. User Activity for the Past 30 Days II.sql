# 1142. User Activity for the Past 30 Days II
 
# Write an SQL query to find the average number of sessions per user for a period of 30 days ending 2019-07-27 inclusively, 
# rounded to 2 decimal places. 
# The sessions we want to count for a user are those with at least one activity in that time period.

# We are looking for a "average number", which means the return value cannot be null, 
# so use IFNULL(), and set null as 0.00 

# This problem can not use window function because after count each session by each user, 
# it still need to calculate the average 
SELECT IFNULL(ROUND(COUNT(DISTINCT session_id)/COUNT(DISTINCT user_id),2),0.00) AS average_sessions_per_user
FROM Activity
WHERE activity_date BETWEEN DATE_SUB("2019-07-27",INTERVAL 29 DAY) AND "2019-07-27";
