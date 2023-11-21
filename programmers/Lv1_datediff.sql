-- 코드를 입력하세요
SELECT HISTORY_ID, CAR_ID, 
    DATE_FORMAT(START_DATE, '%Y-%m-%d') AS START_DATE, 
    DATE_FORMAT(END_DATE, '%Y-%m-%d') AS END_DATE, 
    IF(DATEDIFF(START_DATE, END_DATE) >= 30, '장기 대여', '단기 대여') AS RENT_TYPE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE START_DATE LIKE '2022-09%'
ORDER BY HISTORY_ID DESC;