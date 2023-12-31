SELECT  PRODUCT_ID, PRODUCT_NAME, SUM(B.AMOUNT)*A.PRICE AS TOTAL_SALES
FROM    FOOD_PRODUCT A
JOIN    FOOD_ORDER B USING(PRODUCT_ID)
WHERE   1=1
AND     DATE_FORMAT(B.PRODUCE_DATE,'%Y-%m') = '2022-05'
GROUP BY A.PRODUCT_ID
ORDER By TOTAL_SALES DESC, PRODUCT_ID ASC;