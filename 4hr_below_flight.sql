-- I want to find all origin cities that only serve flights shorter than 4 hours. You should not include canceled flights in your determination.

SELECT DISTINCT f.origin_city AS city
FROM FLIGHTS f
WHERE NOT EXISTS (
    SELECT 1
    FROM FLIGHTS f2
    WHERE f2.origin_city = f.origin_city
    AND f2.actual_time >= 240
    AND f2.canceled = 0
)

AND f.canceled = 0
ORDER BY f.origin_city ASC;