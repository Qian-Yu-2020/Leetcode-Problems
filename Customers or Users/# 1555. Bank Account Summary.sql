# 1555. Bank Account Summary

# Find out the current balance of all users and 
# check wheter they have breached their credit limit (If their current credit is less than 0).



# First sulution is SUM the two types transaction in SELECT statement
SELECT user_id,user_name,

# use IFNULL( ,0) because it could be a situation that the customer has no transaction
IFNULL(SUM(CASE WHEN a.user_id=b.paid_by THEN -amount ELSE amount END),0)+a.credit as credit,
CASE WHEN IFNULL(SUM(CASE WHEN a.user_id=b.paid_by THEN -amount ELSE amount END),0)>=-a.credit THEN "No" ELSE "Yes" END as credit_limit_breached
FROM Users as a
LEFT JOIN Transactions as b

# Becareful there is no user_id in Transactions table
ON a.user_id=b.paid_by OR a.user_id=b.paid_to
GROUP BY a.user_id;





# Second sulution is SUM the two types transaction by making two extra tables
SELECT u.user_id AS USER_ID, 
u.user_name AS USER_NAME, 
(u.credit - IFNULL(a.c_munis,0) + IFNULL(b.c_plus,0) )AS CREDIT,

# 'Yes' means excessed (breached their credit limit)
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






with spent as (
    select paid_by as user_id, sum(amount) spent
    from Transactions
    group by paid_by
),
received as (
    select paid_to as user_id, sum(amount) received
    from Transactions
    group by paid_to
)
select 
    Users.user_id, 
    Users.user_name, 
    Users.credit + coalesce(received,0) - coalesce(spent,0) as credit, 
    case when ( Users.credit + coalesce(received,0) - coalesce(spent, 0) < 0) then 'Yes' 
        else 'No' 
        end as credit_limit_breached
from Users
left outer join spent using(user_id)
left outer join received using(user_id)
order by user_id






with cte as
(select q.user_id, sum(q.net_amt) as trans_total from
(select paid_by as user_id, -1*sum(amount) as net_amt
from transactions t1
group by paid_by
union all
select paid_to as user_id, sum(amount) as net_amt
from transactions t1
group by paid_to) q
group by user_id)

select u.user_id, u.user_name, (u.credit+coalesce(cte.trans_total,0)) as credit,
case when (u.credit+cte.trans_total) < 0 then 'Yes' else 'No' end as credit_limit_breached
from cte right join users u
on cte.user_id = u.user_id
