SELECT  ANIMAL_ID,
        NAME,
        CASE
            WHEN LOCATE('Neutered',SEX_UPON_INTAKE) > 0
            THEN 'O'
            WHEN LOCATE('Spayed',SEX_UPON_INTAKE) > 0
            THEN 'O'
            ELSE 'X'
        END AS 중성화
FROM    ANIMAL_INS
WHERE   1=1
ORDER BY ANIMAL_ID
;