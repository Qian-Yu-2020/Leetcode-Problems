# 607. Sales Person

# Output all the names in the table salesperson, who didn’t have sales to company 'RED'

SELECT DISTINCT s.name AS name 
FROM salesperson s 
WHERE s.sales_id NOT IN (
    SELECT o.sales_id 
    FROM orders o 
    JOIN company c ON o.com_id = c.com_id WHERE c.name = "RED")

