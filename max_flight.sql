-- For each origin city, I want to find the destination city (or cities) with the longest direct flight (by direct flight, 
-- I mean a flight with no intermediate stops). 
--Judge the longest flight using duration, not distance.

WITH MaxFlightTime AS (
    SELECT origin_city, MAX(actual_time) AS max_time
    FROM Flights
    GROUP BY origin_city
)

SELECT DISTINCT
    f.origin_city,
    f.dest_city,
    f.actual_time AS time
FROM 
    MaxFlightTime mft, FLIGHTS as f
WHERE 
    f.origin_city = mft.origin_city
    AND f.actual_time = mft.max_time

ORDER BY 
    f.origin_city ASC,
    f.dest_city ASC;







