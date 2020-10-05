# 1454. Active Users

# Active users are those who logged in to their accounts for 5 or more consecutive days

SELECT DISTINCT a.id, (SELECT name FROM Accounts WHERE id=a.id) name
FROM Logins a, Logins b
WHERE a.id=b.id AND
DATEDIFF(a.login_date,b.login_date) BETWEEN 1 AND 4
GROUP BY a.id, a.login_date
HAVING COUNT(DISTINCT b.login_date)=4
;