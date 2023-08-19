SELECT  DATE_FORMAT(SALES_DATE,'%Y-%m-%d') AS SALES_DATE, PRODUCT_ID, USER_ID, SALES_AMOUNT
FROM    (SELECT  SALES_DATE, PRODUCT_ID, USER_ID, SALES_AMOUNT
        FROM    ONLINE_SALE A
        WHERE   1=1
        AND     DATE_FORMAT(SALES_DATE,'%Y-%m') = '2022-03'
        UNION
        SELECT  SALES_DATE, PRODUCT_ID, NULL, SALES_AMOUNT
        FROM    OFFLINE_SALE A
        WHERE   1=1
        AND     DATE_FORMAT(SALES_DATE,'%Y-%m') = '2022-03') T
ORDER BY SALES_DATE, PRODUCT_ID, USER_ID
