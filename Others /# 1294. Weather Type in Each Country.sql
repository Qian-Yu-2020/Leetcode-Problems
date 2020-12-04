# 1294. Weather Type in Each Country

# Find the type of weather in each country for November 2019

#The type of weather is Cold if the average weather_state is less than or equal 15, Hot if the average weather_state is greater than or equal 25 and Warm otherwise


SELECT c.country_name, (CASE WHEN AVG(weather_state) <= 15 THEN "Cold"
        WHEN AVG(weather_state) >= 25 THEN "Hot"
        ELSE "Warm" 
        END) AS weather_type
FROM Countries c
    JOIN Weather w USING(country_id)
    
# Select for specific month 
WHERE LEFT(day, 7) = "2019-11"
GROUP BY w.country_id
;
