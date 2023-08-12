SELECT  B.USER_ID, B.NICKNAME, SUM(A.PRICE) AS TOTAL_SALES
FROM    USED_GOODS_BOARD A
JOIN    USED_GOODS_USER B ON A.WRITER_ID = B.USER_ID
WHERE   1=1
AND     A.STATUS = 'DONE'
GROUP BY B.USER_ID
HAVING TOTAL_SALES >= 700000
ORDER BY TOTAL_SALES ASC
;