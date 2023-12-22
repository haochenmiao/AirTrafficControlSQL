-- I want to list the names of carriers that operate flights from Seattle to New York, NY.  
-- Return each carrier's name only once, and use a nested query to answer this question.

SELECT c.name AS carrier
FROM CARRIERS c
WHERE c.cid IN (
    SELECT DISTINCT f.carrier_id
    FROM FLIGHTS f
    WHERE f.origin_city = 'Seattle WA'
    AND f.dest_city = 'New York NY'
    AND f.canceled = 0
)

ORDER BY c.name ASC;