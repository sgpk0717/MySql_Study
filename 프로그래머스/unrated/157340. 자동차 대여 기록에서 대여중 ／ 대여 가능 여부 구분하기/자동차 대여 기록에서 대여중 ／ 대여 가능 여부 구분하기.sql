SELECT  DISTINCT CAR_ID,
        CASE
            WHEN EXISTS(SELECT  *
                        FROM    CAR_RENTAL_COMPANY_RENTAL_HISTORY B
                        WHERE   1=1
                        AND     A.CAR_ID = B.CAR_ID
                        AND     '2022-10-16' BETWEEN B.START_DATE AND B.END_DATE)
            THEN '대여중'
            ELSE '대여 가능'
        END AS AVAILABILITY
FROM    CAR_RENTAL_COMPANY_RENTAL_HISTORY A
ORDER BY CAR_ID DESC;