# 1113. Reported Posts

# Reports the number of posts reported yesterday for each report reason. Assume today is 2019-07-0
# Note that we only care about report reasons with non zero number of reports

SELECT extra AS report_reason, COUNT(DISTINCT post_id) AS report_count
FROM Actions
WHERE DATEDIFF("2019-07-05", action_date) = 1
AND action = "report"
GROUP BY extra
;