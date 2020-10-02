# 1241. Number of Comments per Post

#There is no primary key for this table, it may have duplicate rows.
#Each row can be a post or comment on the post.
#parent_id is null for posts.
#parent_id for comments is sub_id for another post in the table.

SELECT s1.sub_id AS post_id, IFNULL(COUNT(DISTINCT s2.sub_id),0) AS number_of_comments
FROM Submissions s1 LEFT JOIN Submissions s2 ON s1.sub_id = s2.parent_id
WHERE s1.parent_id IS NULL
GROUP BY s1.sub_id
;
