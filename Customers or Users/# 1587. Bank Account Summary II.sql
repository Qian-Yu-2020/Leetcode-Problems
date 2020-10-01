# 1587. Bank Account Summary II

# Write an SQL query to report the name and balance of users with a balance higher than 10000. 
# The balance of an account is equal to the sum of the amounts of all transactions involving that account.

SELECT u.name AS NAME,SUM(t.amount) AS BALANCE
FROM Transactions t LEFT JOIN Users u
ON u.account = t.account
GROUP BY u.account 
HAVING SUM(t.amount)>10000;

