# 607. Sales Person

# Output all the names in the table salesperson, who didn’t have sales to company 'RED'
# Don't forgot to use DISTINCT to avoid duplicate


SELECT DISTINCT s.name AS name 
FROM salesperson s 
WHERE s.sales_id NOT IN (
    SELECT o.sales_id 
    FROM orders o 
    JOIN company c ON o.com_id = c.com_id WHERE c.name = "RED")

# or 
# Will join three table in a row is easier to understand
SELECT DISTINCT p.name AS name
FROM salesperson p LEFT JOIN orders o USING sales_id 
LEFT JOIN company c USING com_id
WHERE c.name != “RED”
;
