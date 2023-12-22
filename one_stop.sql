-- I want to list all cities that can be reached from Seattle using exactly one stop.  
-- In other words, the flight itinerary should use an intermediate city, but cannot be reached through a direct flight.

WITH DirectFights AS (
    SELECT dest_city
    FROM Flights
    WHERE origin_city = 'Seattle WA'
    AND canceled = 0
),

IntermediateFlights AS (
    SELECT f2.dest_city AS city
    FROM Flights f1
    JOIN Flights f2 on f1.dest_city = f2.origin_city
    WHERE f1.origin_city = 'Seattle WA'
    AND f2.dest_city NOT IN (SELECT dest_city FROM DirectFights)
    AND f1.canceled = 0
    AND f2.canceled = 0
)

SELECT DISTINCT city
FROM IntermediateFlights
WHERE city <> 'Seattle WA'
ORDER BY city ASC;