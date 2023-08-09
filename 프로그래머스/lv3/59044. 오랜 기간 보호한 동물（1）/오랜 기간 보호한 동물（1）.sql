SELECT  A.NAME, A.DATETIME
FROM    ANIMAL_INS A
WHERE   1=1
AND     NOT EXISTS(SELECT   *
                   FROM     ANIMAL_OUTS B
                   WHERE    1=1
                   AND      A.ANIMAL_ID = B.ANIMAL_ID)
ORDER BY DATETIME ASC
LIMIT   3
;