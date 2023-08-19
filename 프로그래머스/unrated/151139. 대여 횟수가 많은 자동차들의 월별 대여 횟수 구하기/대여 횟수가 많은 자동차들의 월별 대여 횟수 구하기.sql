SELECT  DATE_FORMAT(A.START_DATE,'%m')+0 AS MONTH,
        CAR_ID,
        COUNT(HISTORY_ID) AS RECORDS
FROM    CAR_RENTAL_COMPANY_RENTAL_HISTORY A
WHERE   1=1
AND     DATE_FORMAT(A.START_DATE,'%Y-%m-%d') BETWEEN '2022-08-01' AND '2022-10-31'
AND     CAR_ID IN (SELECT   CAR_ID
                   FROM     CAR_RENTAL_COMPANY_RENTAL_HISTORY B
                   WHERE    1=1
                   AND      DATE_FORMAT(B.START_DATE,'%Y-%m-%d') BETWEEN '2022-08-01' AND '2022-10-31'
                   GROUP BY CAR_ID
                   HAVING   COUNT(B.HISTORY_ID) >= 5)
GROUP BY MONTH, CAR_ID
HAVING RECORDS > 0
ORDER BY MONTH ASC, CAR_ID DESC