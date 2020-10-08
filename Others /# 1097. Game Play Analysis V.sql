# 1097. Game Play Analysis V

# Reports for each install date, the number of players that installed the game on that day and the day 1 retention
# Install date of a player to be the first login day of that player

# We also define day 1 retention of some date X to be the number of players whose install date is X and they logged back in on the day right after X, divided by the number of players whose install date is X, rounded to 2 decimal places

with cte as (select * 
             from (select player_id, event_date, rank() over (partition by player_id order by event_date) as ranking
from Activity) t
where t.ranking in (1,2))
select c1.event_date as install_dt,
       count(c1.player_id) as installs,
       round(sum(case when c2.ranking is not null then 1 else 0 end)/count(c1.player_id), 2) as Day1_retention
from cte c1
left join cte c2 on c1.player_id = c2.player_id and c1.ranking <> c2.ranking and datediff(c2.event_date, c1.event_date) = 1
where c1.ranking = 1
group by 1
order by 1