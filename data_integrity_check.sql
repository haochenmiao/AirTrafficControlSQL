SELECT c.name, COUNT(*)
FROM CARRIERS AS c
GROUP BY c.name, cid;