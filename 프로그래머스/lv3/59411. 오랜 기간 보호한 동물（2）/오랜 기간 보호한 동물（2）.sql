SELECT  A.ANIMAL_ID, A.NAME
FROM    ANIMAL_INS A
LEFT JOIN   ANIMAL_OUTS B USING(ANIMAL_ID)
ORDER BY DATEDIFF(B.DATETIME,A.DATETIME) DESC
LIMIT 2
;


