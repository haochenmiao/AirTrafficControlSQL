-- For each origin city, I want to find the percentage of departed flights whose duration is shorter than 1.5 hours; as before, you should not include canceled flights in either the numerator or denominator.  
--Be careful to handle cities which do not have any flights shorter than 1.5 hours; you should return 0 as the result for these cities, not NULL (which is shown as a blank cell in Azure).  
-- Order by percentage value, then city, ascending. Report percentages as percentages, not decimals

WITH TotalFlights AS (
    SELECT 
        origin_city,
        COUNT(*) AS total_flights
    FROM 
        Flights
    WHERE 
        canceled = 0
    GROUP BY 
        origin_city
),
ShortFlights AS (
    SELECT 
        origin_city,
        COUNT(*) AS short_flights
    FROM 
        Flights
    WHERE 
        actual_time < 90
        AND canceled = 0
    GROUP BY 
        origin_city
)

SELECT 
    tf.origin_city,
    COALESCE(CAST((CAST(sf.short_flights AS FLOAT) / CAST(tf.total_flights AS FLOAT)) * 100 AS DECIMAL(20, 4)), 0) AS percentage
FROM 
    TotalFlights tf
LEFT JOIN 
    ShortFlights sf
ON 
    tf.origin_city = sf.origin_city
ORDER BY 
    percentage ASC,
    tf.origin_city ASC;
