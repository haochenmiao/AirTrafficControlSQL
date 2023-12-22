-- I want to list the names of carriers that operate flights from Seattle to New York, NY without using a sub query

SELECT DISTINCT c.name AS carrier
FROM
    FLIGHTS f
JOIN
    CARRIERS c ON f.carrier_id = c.cid
WHERE
    f.origin_city = 'Seattle WA'
    AND f.dest_city = 'New York NY'

ORDER BY
    c.name ASC;