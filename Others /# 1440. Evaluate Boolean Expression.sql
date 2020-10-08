# 1440. Evaluate Boolean Expression

# Query to evaluate the boolean expressions in Expressions table

SELECT e.left_operand, e.operator, e.right_operand,
    (
        CASE
            WHEN e.operator = '<' AND v1.value < v2.value THEN 'true'
            WHEN e.operator = '=' AND v1.value = v2.value THEN 'true'
            WHEN e.operator = '>' AND v1.value > v2.value THEN 'true'
            ELSE 'false'
        END
    ) AS value
FROM Expressions e
JOIN Variables v1
ON e.left_operand = v1.name
JOIN Variables v2
ON e.right_operand = v2.name




SELECT left_operand, operator, right_operand,
    (CASE WHEN (e.operator='>' AND v1.value > v2.value) 
            OR (e.operator='=' AND v1.value = v2.value)
            OR (e.operator='<' AND v1.value < v2.value)
			THEN 'true'
        ELSE 'false'
        END) value
FROM Expressions e, Variables v1, Variables v2
WHERE e.left_operand = v1.name AND e.right_operand = v2.name




