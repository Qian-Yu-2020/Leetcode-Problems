# 597. Friend Requests I: Overall Acceptance Rate

# Find the overall acceptance rate of requests rounded to 2 decimals, which is the number of acceptance divide the number of requests
# Just need to simply count the total accepted requests, and divide it by the number of requests to get the acceptance rate
# The ‘duplicated’ requests or acceptances are only counted once

SELECT IFNULL(ROUND((COUNT(DISTINCT requester_id,accepter_id)/COUNT(DISTINCT sender_id,send_to_id)),2),0.00) AS accept_rate
FROM friend_request, request_accepted
