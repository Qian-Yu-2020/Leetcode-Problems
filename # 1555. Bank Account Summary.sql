# 1555. Bank Account Summary

# Find out the current balance of all users and 
# check wheter they have breached their credit limit (If their current credit is less than 0).

SELECT u.user_id AS USER_ID, 
u.user_name AS USER_NAME, 
(u.credit - IFNULL(a.c_munis,0) + IFNULL(b.c_plus,0) )AS CREDIT,
IF(u.credit - IFNULL(a.c_munis,0) + IFNULL(b.c_plus,0)<0,'Yes','No') AS CREDIT_LIMIT_BREACHED
FROM users u
LEFT JOIN
(SELECT paid_by, SUM(amount) AS c_munis 
FROM Transactions t
GROUP BY paid_by) as a
ON a.paid_by = u.user_id
LEFT JOIN
(SELECT paid_to, SUM(amount) AS c_plus 
FROM Transactions t
GROUP BY paid_to) as b 
ON b.paid_to = u.user_id
