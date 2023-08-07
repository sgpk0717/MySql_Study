SELECT  SUBSTR(DATE_FORMAT(DATETIME, '%HH24'),1,2) AS HOUR, COUNT(ANIMAL_ID) AS COUNT
FROM    ANIMAL_OUTS
WHERE   1=1
AND     SUBSTR(DATE_FORMAT(DATETIME, '%HH24'),1,2) BETWEEN 9 AND 19
GROUP BY HOUR
ORDER BY HOUR