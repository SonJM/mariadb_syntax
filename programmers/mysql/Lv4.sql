-- 입양 시각 구하기(2)
-- 내 코드
-- RECURSIVE 재귀 쿼리를 이용해 테이블을 생성한다
-- 기존 ANIMAL_OUTS와의 LEFT JOIN을 이용한 뒤
-- COUNT(outs.DATETIME)을 이용했기 때문에 기존 테이블엔 없던
-- HOUR의 COUNT값은 0이 들어가게 된다.
WITH RECURSIVE rc AS (
SELECT 0 AS HOUR
UNION ALL
SELECT HOUR + 1
FROM rc
WHERE HOUR < 23
) SELECT rc.HOUR, COUNT(outs.DATETIME) AS COUNT
FROM rc LEFT JOIN ANIMAL_OUTS outs ON
    rc.HOUR = DATE_FORMAT(outs.DATETIME, '%H')
GROUP BY rc.HOUR ORDER BY rc.HOUR;

-- 강사님 코드
-- 똑같이 RECURSIVE를 이용해 테이블을 만드는데 나와의 차이점은
-- counter column까지 만든다는 것이다.
-- 그 후 NOT IN 구문을 이용해 COUNT에 값이 있는 HOUR을 먼저 제거 한 후
-- UNION을 이용해 COUNT값이 사라진 HOUR 부분에 값을 추가하는 방식이다.
WITH RECURSIVE number_sequence(HOUR) AS (
    SELECT 0
    UNION ALL
    SELECT HOUR + 1 
    FROM number_sequence 
    WHERE HOUR < 23
)
SELECT HOUR, 0 AS COUNT FROM number_sequence
WHERE HOUR NOT IN (
    SELECT CAST(DATE_FORMAT(DATETIME, '%H') as signed) as HOUR FROM ANIMAL_OUTS
    )
UNION
SELECT CAST(DATE_FORMAT(DATETIME, '%H') AS signed) AS HOUR, COUNT(*) AS COUNT
FROM ANIMAL_OUTS 
GROUP BY HOUR
ORDER BY HOUR;