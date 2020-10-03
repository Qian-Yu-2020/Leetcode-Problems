# 620. Not Boring Movies

# Output movies with an odd numbered ID and a description that is not 'boring'. Order the result by rating

SELECT * 
FROM cinema
WHERE description != "boring"
AND id%2 = 1
ORDER BY rating DESC
;