-- I want to list all cities that can be reached from Seattle, but which require two intermediate stops or more.  
-- As before, do not include Seattle as one of the destination cities.  
-- I can assume all cities to be the collection of all origin_city or all dest_city. 
-- I can also assume that all cities are reachable from Seattle in some number of stops.


WITH DirectFlights AS (
    SELECT DISTINCT dest_city
    FROM FLIGHTS f1
    WHERE origin_city = 'Seattle WA'
)

, IndirectFlights AS (
    SELECT DISTINCT f2.dest_city
    FROM FLIGHTS f1
    JOIN FLIGHTS f2 ON f1.dest_city = f2.origin_city
    WHERE f1.origin_city = 'Seattle WA'
    AND f2.dest_city <> 'Seattle WA'
)

SELECT DISTINCT f.dest_city AS city
FROM FLIGHTS f
WHERE 
    f.dest_city NOT IN (SELECT dest_city FROM DirectFlights)
    AND f.dest_city NOT IN (SELECT dest_city FROM IndirectFlights)
    AND f.origin_city <> 'Seattle WA'
    AND f.dest_city <> 'Seattle WA'  
ORDER BY 
    f.dest_city ASC;
