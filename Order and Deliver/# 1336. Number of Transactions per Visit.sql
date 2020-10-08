# 1336. Number of Transactions per Visit

# Draw a chart of the number of transactions bank visitors did in one visit to the bank and the corresponding number of visitors who have done this number of transaction in one visit

# Write an SQL query to find how many users visited the bank and didn't do any transactions, how many visited the bank and did one transaction and so on.
# The result table will contain two columns: transactions_count which is the number of transactions done in one visit. visits_count which is the corresponding number of users who did transactions_count in one visit to the bank. transactions_count should take all values from 0 to max(transactions_count) done by one or more users.
# Order the result table by transactions_count

# 
WITH RECURSIVE my_cte AS
(
SELECT 0 AS n
UNION ALL
SELECT 1+n FROM my_cte WHERE n<(select count(t.amount) tot from visits v left join transactions t on v.user_id=t.user_id and t.transaction_date=v.visit_date group by v.visit_date,v.user_id order by count(t.amount) desc limit 1)
)

select n transactions_count, count(tot) visits_count

from
(SELECT n,tot FROM my_cte a

left join (select count(t.amount) tot from visits v left join transactions t on v.user_id=t.user_id and t.transaction_date=v.visit_date group by v.visit_date,v.user_id) t on t.tot=a.n) aa
group by n