# 1050. Actors and Directors Who Cooperated At Least Three Times

# Report that provides the pairs (actor_id, director_id) where the actor have cooperated with the director at least 3 times

SELECT actor_id, director_id
FROM ActorDirector
GROUP BY 1, 2
HAVING COUNT(timestamp) >2 
;