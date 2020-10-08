# 1159. Market Analysis II

# Find for each user, whether the brand of the second item (by date) they sold is their favorite brand. If a user sold less than two items, report the answer for that user as no.

# It is guaranteed that no seller sold more than one item on a day.

WITH second_sold AS
(
    SELECT s.seller_id,
    s.item_id,
    s.order_date
    FROM
    (
        SELECT s.seller_id,
        s.item_id,
        RANK() OVER(PARTITION BY s.seller_id ORDER BY s.order_date ASC) AS rk,
        s.order_date
        FROM Orders s
    ) s
    WHERE s.rk = 2
)

SELECT u.user_id AS seller_id,
CASE WHEN u.favorite_brand = i.item_brand THEN 'yes' ELSE 'no' END AS 2nd_item_fav_brand
FROM Users u
LEFT JOIN second_sold s
ON u.user_id = s.seller_id
LEFT JOIN Items i
ON s.item_id = i.item_id;