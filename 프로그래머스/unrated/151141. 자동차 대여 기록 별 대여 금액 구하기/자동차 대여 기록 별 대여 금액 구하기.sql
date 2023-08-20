SELECT  H.HISTORY_ID,
        ROUND((A.DAILY_FEE/100) * (100-
        CASE
            WHEN DATEDIFF(H.END_DATE,H.START_DATE)+1 BETWEEN 7 AND 29 THEN (SELECT  DISCOUNT_RATE
                                                                            FROM    CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                                                            WHERE   CAR_TYPE = '트럭'
                                                                            AND     DURATION_TYPE = '7일 이상')
            WHEN DATEDIFF(H.END_DATE,H.START_DATE)+1 BETWEEN 30 AND 89 THEN (SELECT  DISCOUNT_RATE
                                                                            FROM    CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                                                            WHERE   CAR_TYPE = '트럭'
                                                                            AND     DURATION_TYPE = '30일 이상')
            WHEN DATEDIFF(H.END_DATE,H.START_DATE)+1 >= 90 THEN (SELECT  DISCOUNT_RATE
                                                                 FROM    CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                                                 WHERE   CAR_TYPE = '트럭'
                                                                 AND     DURATION_TYPE = '90일 이상')
            ELSE 0
        END))*(DATEDIFF(H.END_DATE,H.START_DATE)+1) AS FEE
FROM    CAR_RENTAL_COMPANY_RENTAL_HISTORY H
JOIN    CAR_RENTAL_COMPANY_CAR A USING(CAR_ID)
WHERE   1=1
AND     A.CAR_TYPE = '트럭'
ORDER BY FEE DESC, HISTORY_ID DESC
;