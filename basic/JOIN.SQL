-- author 테이블에서 NAME, EMAIL
-- post테이블 title, contents

SELECT name, email FROM author
UNION ALL
SELECT title, contents FROM post;

SELECT a.* FROM author a INNER JOIN post p ON a.id = p.author_id;
SELECT a.* FROM author a WHERE a.ID IN (SELECT p.author_id FROM post p);

-- author 테이블과 post 테이블에서 각각 이름(name)과 제목(title)을 조회하여, 두 결과를 하나의 테이블로 결합하시오(중복은 제거)
SELECT a.name, p.title FROM author a INNER JOIN post p ON a.id = p.author_id;