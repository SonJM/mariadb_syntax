-- 즐겨찾기가 가장 많은 식당 정보 출력하기
SELECT REST_INFO.FOOD_TYPE, REST_INFO.REST_ID, REST_INFO.REST_NAME, REST_INFO.FAVORITES FROM(
	SELECT FOOD_TYPE, MAX(FAVORITES) as max_favorites
	FROM REST_INFO
	GROUP BY FOOD_TYPE
) t1 INNER JOIN REST_INFO 
ON t1.FOOD_TYPE = REST_INFO.FOOD_TYPE AND t1.max_favorites = REST_INFO.FAVORITES 
ORDER BY FOOD_TYPE DESC;

-- 없어진 기록 찾기
SELECT outs.ANIMAL_ID, outs.NAME
FROM ANIMAL_OUTS outs
LEFT JOIN ANIMAL_INS ins
on outs.ANIMAL_ID = ins.ANIMAL_ID
where ins.INTAKE_CONDITION is null;

-- 오랜 기간 보호한 동물(1)
SELECT INS.NAME, INS.DATETIME
FROM ANIMAL_INS INS
LEFT JOIN ANIMAL_OUTS OUTS
ON OUTS.ANIMAL_ID = INS.ANIMAL_ID
WHERE OUTS.DATETIME IS NULL
ORDER BY INS.DATETIME
LIMIT 3;

-- 조건에 맞는 사용자와 총 거래금액 조회하기
-- WHERE절과 HAVING절의 경우 각각 SELECT와 GROUP BY를 하기 위한 조건 설정으로 이해하고 있는데
-- 돌아가는 동작에서의 차이점은 있겠지만 원하는 결과를 뽑아내는데에는 차이가 없는게 아닌지
SELECT 
    USERS.USER_ID
    , USERS.NICKNAME
    , SUM(BOARD.PRICE) AS TOTAL_SALES
FROM 
    USED_GOODS_BOARD AS BOARD
LEFT JOIN 
    USED_GOODS_USER AS USERS
ON USERS.USER_ID = BOARD.WRITER_ID
WHERE BOARD.STATUS = 'DONE'
GROUP BY USERS.USER_ID
HAVING TOTAL_SALES >= 700000
ORDER BY TOTAL_SALES;

-- ERROR : Unknown column 'TOTAL_SALES' in 'where clause'
SELECT 
    USERS.USER_ID
    , USERS.NICKNAME
    , SUM(BOARD.PRICE) AS TOTAL_SALES
FROM 
    USED_GOODS_BOARD AS BOARD
LEFT JOIN 
    USED_GOODS_USER AS USERS
ON USERS.USER_ID = BOARD.WRITER_ID
WHERE TOTAL_SALES >= 700000
GROUP BY USERS.USER_ID
HAVING BOARD.STATUS = 'DONE'
ORDER BY TOTAL_SALES;

-- 대여 기록이 존재하는 자동차 리스트 구하기
SELECT COMPANY.CAR_ID
FROM CAR_RENTAL_COMPANY_CAR AS COMPANY
LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY AS HISTORY
USING(CAR_ID)
WHERE COMPANY.CAR_TYPE = '세단' AND DATE_FORMAT(HISTORY.START_DATE, '%m') = '10'
GROUP BY COMPANY.CAR_ID
ORDER BY COMPANY.CAR_ID DESC

-- 헤비 유저가 소유한 장소 (셀프 조인 이용)
SELECT PLACE1.ID, PLACE1.NAME, PLACE1.HOST_ID
FROM PLACES PLACE1, PLACES PLACE2
WHERE 
PLACE1.ID != PLACE2.ID
AND
PLACE1.HOST_ID = PLACE2.HOST_ID
GROUP BY PLACE1.ID
ORDER BY PLACE1.ID;