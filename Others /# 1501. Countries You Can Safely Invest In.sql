# 1501. Countries You Can Safely Invest In

# A telecommunications company wants to invest in new countries
# The countries where the average call duration of the calls in this country is strictly greater than the global average call duration

SELECT Country.name AS country
FROM Person JOIN Calls ON Calls.caller_id = Person.id OR Calls.callee_id = Person.id
JOIN Country ON Country.country_code = LEFT(Person.phone_number, 3)
GROUP BY Country.name
HAVING AVG(duration) > (SELECT AVG(duration) FROM Calls)