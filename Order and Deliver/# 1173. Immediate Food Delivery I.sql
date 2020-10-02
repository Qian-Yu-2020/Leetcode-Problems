# 1173. Immediate Food Delivery I

# If the preferred delivery date of the customer is the same as the order date then the order is called immediate otherwise it's called scheduled.

SELECT ROUND(AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 1 
        ELSE 0 END)*100,2) AS immediate_percentage
FROM Delivery
;

    