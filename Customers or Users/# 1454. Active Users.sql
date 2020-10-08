# 1454. Active Users

# Active users are those who logged in to their accounts for 5 or more consecutive days

SELECT DISTINCT a.id, (SELECT name FROM Accounts WHERE id=a.id) name
FROM Logins a, Logins b
WHERE a.id=b.id AND
DATEDIFF(a.login_date,b.login_date) BETWEEN 1 AND 4
GROUP BY a.id, a.login_date
HAVING COUNT(DISTINCT b.login_date)=4
;



SELECT DISTINCT a.id, a.name
FROM (
    SELECT 
        id, LEAD(login_date, 4) OVER (PARTITION BY id ORDER BY login_date) AS five_days,
        DATEDIFF(LEAD(login_date, 4) OVER (PARTITION BY id ORDER BY login_date), login_date) AS gap
    FROM (SELECT DISTINCT id, login_date FROM Logins) c
) d
LEFT JOIN Accounts a ON a.id = d.id
WHERE gap = 4
ORDER BY a.id




SELECT *
FROM Accounts
WHERE id IN
    (SELECT DISTINCT t1.id 
     FROM Logins t1 INNER JOIN Logins t2 on t1.id = t2.id AND DATEDIFF(t1.login_date, t2.login_date) BETWEEN 1 AND 4
     GROUP BY t1.id, t1.login_date
     HAVING COUNT(DISTINCT(t2.login_date)) = 4)
ORDER BY id




WITH temp AS (SELECT l1.id, l1.login_date, COUNT(DISTINCT l2.login_date) AS cnt
FROM Logins l1
LEFT JOIN Logins l2 ON l1.id = l2.id AND DATEDIFF(l2.login_date, l1.login_date) BETWEEN 1 AND 4
GROUP BY 1,2
HAVING cnt>=4)

SELECT DISTINCT temp.id, name
FROM temp
JOIN Accounts ON temp.id = Accounts.id
ORDER BY 1;




















