# 1148. Article Views I

# Find all the authors that viewed at least one of their own articles, sorted in ascending order by their id


SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id
;