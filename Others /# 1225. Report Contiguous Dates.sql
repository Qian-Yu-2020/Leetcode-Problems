# 1225. Report Contiguous Dates

# A system is running one task every day. Every task is independent of the previous tasks. The tasks can fail or succeed.

# Write an SQL query to generate a report of period_state for each continuous interval of days in the period from 2019-01-01 to 2019-12-31.

# period_state is 'failed' if tasks in this interval failed or 'succeeded' if tasks in this interval succeeded. Interval of days are retrieved as start_date and end_date. Order result by start_date.

with cte as (select fail_date as cal_date, 'failed' as state
from Failed
union all
select success_date as cal_date, 'succeeded' as state
from Succeeded)
select state as period_state,
       min(cal_date) as start_date,
       max(cal_date) as end_date
from
(select state, cal_date, rank() over (partition by state order by cal_date) as ranking, rank() over (order by cal_date) as id
from cte 
where cal_date between '2019-01-01' and '2019-12-31') t
group by state, (id - ranking)
order by 2

