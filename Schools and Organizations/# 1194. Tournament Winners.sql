# 1194. Tournament Winners

# The winner in each group is the player who scored the maximum total points within the group. In the case of a tie, the lowest player_id wins

# Write an SQL query to find the winner in each group

WITH cte AS (
SELECT tmp.player_id, p.group_id, SUM(tmp.score) AS total_points FROM
(
SELECT first_player as player_id, first_score AS score FROM Matches

UNION ALL 

SELECT second_player as player_id, second_score AS score FROM Matches
) tmp 
JOIN Players p ON tmp.player_id = p.player_id
GROUP BY 1
)

SELECT group_id, MIN(player_id) AS player_id FROM cte
WHERE (group_id, total_points) IN (
SELECT group_id, MAX(total_points) FROM cte
GROUP BY 1
)
GROUP BY 1