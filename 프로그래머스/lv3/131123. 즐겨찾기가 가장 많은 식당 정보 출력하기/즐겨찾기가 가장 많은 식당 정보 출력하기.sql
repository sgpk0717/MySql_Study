SELECT  FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
FROM    (SELECT  FOOD_TYPE,
                 REST_ID,
                 REST_NAME,
                 FAVORITES,
                 RANK() OVER (PARTITION BY FOOD_TYPE ORDER BY FAVORITES DESC) AS rankee
         FROM    REST_INFO) A
WHERE   rankee = 1
ORDER BY FOOD_TYPE DESC
;