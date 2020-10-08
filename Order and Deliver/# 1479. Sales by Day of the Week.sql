# 1479. Sales by Day of the Week

# A sales report for category items and day of the week
# Report how many units in each category have been ordered on each day of the week
# Return the result table ordered by category

# Solution 1:
SELECT i.item_category AS Category,
    SUM(CASE WHEN DAYOFWEEK(o.order_date) = 2 THEN quantity ELSE 0 END) AS Monday,
    SUM(CASE WHEN DAYOFWEEK(o.order_date) = 3 THEN quantity ELSE 0 END) AS Tuesday,
    SUM(CASE WHEN DAYOFWEEK(o.order_date) = 4 THEN quantity ELSE 0 END) AS Wednesday,
    SUM(CASE WHEN DAYOFWEEK(o.order_date) = 5 THEN quantity ELSE 0 END) AS Thursday,
    SUM(CASE WHEN DAYOFWEEK(o.order_date) = 6 THEN quantity ELSE 0 END) AS Friday,
    SUM(CASE WHEN DAYOFWEEK(o.order_date) = 7 THEN quantity ELSE 0 END) AS Saturday,
    SUM(CASE WHEN DAYOFWEEK(o.order_date) = 1 THEN quantity ELSE 0 END) AS Sunday
FROM Items i
LEFT JOIN Orders o
ON i.item_id = o.item_id
GROUP BY i.item_category
ORDER BY i.item_category;

# Solution 2:
# cte - transform order_date into day, aggregate SUM() based on item category & day
 WITH cte AS 
  (
  	SELECT i.item_category, WEEKDAY(o.order_date) AS "day", SUM(o.quantity) AS "total"
  	FROM Orders o LEFT JOIN Items i ON i.item_id = o.item_id
  	GROUP BY 1, 2 ORDER BY 1, 2
  ),
  final AS 
  (
  	SELECT i.item_category AS "Category",
  	IFNULL(MAX(CASE WHEN c.day = 0 THEN c.total END), 0) AS "Monday",
  	IFNULL(MAX(CASE WHEN c.day = 1 THEN c.total END), 0) AS "Tuesday",
  	IFNULL(MAX(CASE WHEN c.day = 2 THEN c.total END), 0) AS "Wednesday",
  	IFNULL(MAX(CASE WHEN c.day = 3 THEN c.total END), 0) AS "Thursday",
  	IFNULL(MAX(CASE WHEN c.day = 4 THEN c.total END), 0) AS "Friday",
  	IFNULL(MAX(CASE WHEN c.day = 5 THEN c.total END), 0) AS "Saturday",
  	IFNULL(MAX(CASE WHEN c.day = 6 THEN c.total END), 0) AS "Sunday"
  	FROM Items i LEFT JOIN cte c ON i.item_category = c.item_category
  	GROUP BY 1 ORDER BY 1
  )

  SELECT * FROM final