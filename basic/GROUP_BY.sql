-- Group by
SELECT count(*) FROM post;

-- post의 price에 적절한 값을 넣어놓고,
-- avg, min, max, sum
-- 소수점 -> round(대상값, 원하는 소숫점 자릿수)
SELECT * FROM post;

SELECT sum(price) FROM post GROUP BY author_id;
SELECT round(avg(price)) FROM post;

-- author_id별 count값
-- author_id별 price sum, avg
SELECT author.name, count(author_id) FROM post LEFT JOIN author ON author.id = post.author_id GROUP BY author_id;

SELECT round(sum(price)) FROM post GROUP BY author_id;
SELECT round(avg(price)) FROM post GROUP BY author_id;

-- region별로 sales평균값을 구하시오. 단, 건별로 300달러 이상인 데이터만 평균을 내서 출력하시오. 
-- region별로 sales평균값을 구하되 평균값이 300달러 이상건만 출력하시오.
SELECT * FROM post;
SELECT author_id, round(avg(price)) FROM post WHERE price>5000 GROUP BY author_id;
SELECT author_id, round(avg(price)) FROM post GROUP BY author_id HAVING avg(price)>5000;

SELECT author_id, round(avg(price)) FROM post WHERE price>5000 GROUP BY author_id HAVING avg(price)>5000;