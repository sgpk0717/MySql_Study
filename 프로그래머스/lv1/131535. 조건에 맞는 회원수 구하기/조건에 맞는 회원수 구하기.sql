SELECT  COUNT(1) AS USERS
FROM    USER_INFO 
WHERE   1=1
AND     AGE BETWEEN 20 AND 29
AND     JOINED BETWEEN '2021-01-01' AND '2021-12-31'
;