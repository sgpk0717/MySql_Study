SELECT  BOARD_ID, 
        WRITER_ID, 
        TITLE, 
        PRICE, 
        CASE
            WHEN STATUS = 'SALE'
            THEN '판매중'
            WHEN STATUS = 'RESERVED'
            THEN '예약중'
            WHEN STATUS = 'DONE'
            THEN '거래완료'
        END AS STATUS
FROM    USED_GOODS_BOARD
WHERE   1=1
AND     DATE_FORMAT(CREATED_DATE, '%Y%m%d') = '20221005'
ORDER BY BOARD_ID DESC;