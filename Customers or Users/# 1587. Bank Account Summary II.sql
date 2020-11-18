# 1587. Bank Account Summary II

# Write an SQL query to report the name and balance of users with a balance higher than 10000. 
# The balance of an account is equal to the sum of the amounts of all transactions involving that account.

SELECT u.name AS NAME,SUM(t.amount) AS BALANCE
FROM Transactions t LEFT JOIN Users u
ON u.account = t.account
GROUP BY u.account 
# Aggregate function can go directly after HAVING
HAVING SUM(t.amount)>10000;


# Second solution 
with tmp as(
select t.account, u.name, sum(amount) as balance
from Transactions t
left join Users u on t.account = u.account
group by account )

select name, balance
from tmp
where balance > 10000
