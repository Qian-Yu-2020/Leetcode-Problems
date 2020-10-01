# 1322. Ads Performance

# Performance of the Ad is measured using Click-Through Rate (CTR) 
# Round ctr to 2 decimal points. Order the result table by ctr in descending order and by ad_id in ascending order in case of a tie

SELECT ad_id, IFNULL(ROUND(AVG(CASE WHEN action = 'Clicked' THEN 1 
                               WHEN action = 'Viewed' THEN 0 
                               ELSE NULL END)*100,2),0) AS ctr
FROM Ads
GROUP BY ad_id
ORDER BY ctr DESC, ad_id ASC

