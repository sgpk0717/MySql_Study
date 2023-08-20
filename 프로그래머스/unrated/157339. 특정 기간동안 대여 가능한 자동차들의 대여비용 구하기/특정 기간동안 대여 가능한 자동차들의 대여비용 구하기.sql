# SELECT  *
# FROM   (SELECT  A.CAR_ID, 
#                 C.CAR_TYPE, 
#                 ROUND((A.DAILY_FEE/100)*(100-C.DISCOUNT_RATE))*30 AS FEE
#         FROM    CAR_RENTAL_COMPANY_CAR A
#         JOIN    CAR_RENTAL_COMPANY_RENTAL_HISTORY B USING(CAR_ID)
#         JOIN    CAR_RENTAL_COMPANY_DISCOUNT_PLAN C USING(CAR_TYPE)
#         WHERE   1=1
#         AND     C.DURATION_TYPE = '30일 이상'
#         AND     A.CAR_ID NOT IN (SELECT  CAR_ID
#                                  FROM    CAR_RENTAL_COMPANY_RENTAL_HISTORY H
#                                  WHERE   1=1
#                                  AND     '2022-11' BETWEEN DATE_FORMAT(H.START_DATE,'%Y-%m') AND DATE_FORMAT(H.END_DATE,'%Y-%m'))
#         GROUP BY A.CAR_ID) T
# WHERE   1=1
# AND     FEE >= 500000 AND FEE < 2000000
# AND     CAR_TYPE IN ('세단', 'SUV')
# ORDER BY FEE DESC, CAR_TYPE ASC, CAR_ID DESC
# ;                                         

SELECT  A.CAR_ID, A.CAR_TYPE,
        ROUND((A.DAILY_FEE/100)*(100-C.DISCOUNT_RATE)*30) AS FEE
FROM    CAR_RENTAL_COMPANY_CAR A
JOIN    CAR_RENTAL_COMPANY_RENTAL_HISTORY B USING(CAR_ID)
JOIN    CAR_RENTAL_COMPANY_DISCOUNT_PLAN C USING(CAR_TYPE)
WHERE   1=1
AND     C.DURATION_TYPE = '30일 이상'
AND     A.CAR_TYPE IN ('세단', 'SUV')
AND     NOT EXISTS( SELECT  CAR_ID
                    FROM    CAR_RENTAL_COMPANY_RENTAL_HISTORY H
                    WHERE   1=1
                    AND     H.CAR_ID = B.CAR_ID
                    AND     '2022-11' BETWEEN DATE_FORMAT(H.START_DATE,'%Y-%m') AND DATE_FORMAT(H.END_DATE,'%Y-%m'))
GROUP BY CAR_ID
HAVING FEE >= 500000 AND FEE < 2000000
ORDER BY FEE DESC, CAR_TYPE ASC, CAR_ID DESC
;