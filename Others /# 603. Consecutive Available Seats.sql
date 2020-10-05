# 603. Consecutive Available Seats

# Query all the consecutive available seats order by the seat_id using the following cinema table
# The seat_id is an auto increment int, and free is bool ('1' means free, and '0' means occupied.)
# Consecutive available seats are more than 2(inclusive) seats consecutively available


SELECT DISTINCT c1.seat_id
FROM cinema c1, cinema c2
WHERE c1.free = 1
AND c2.free = 1
AND (c1.seat_id = c2.seat_id + 1 OR c1.seat_id = c2.seat_id - 1)
;

