-- 데이터베이스 생성
CREATE DATABASE board;
-- 데이터베이스 선택
USE board;
-- author 테이블 신규 생성
CREATE TABLE author(id INT, name VARCHAR(255), 
email VARCHAR(255), password VARCHAR(255), test1 VARCHAR(255) PRIMARY KEY(id));
-- 테이블 목록 조회
SHOW TABLES;
-- 테이블 컬럼조회
DESCRIBE author;
-- host 테이블 신규 생성
CREATE TABLE posts(id INT PRIMARY KEY, title VARCHAR(255), content VARCHAR(255), author_id INT, FOREIGN KEY(author_id) REFERENCES author(id))

--  테이블 컬럼 상세 조회
SHOW FULL COLUMNS FROM author;

-- 테이블 생성문 조회 ( 중간에 ALTER하다보면 변경이 많이 돼서 마지막에 라이브서버에 올릴 때의 편리함을 위해 사용)
SHOW CREATE TABLE posts;

-- 참조관계 및 제약조건 정보조회
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'posts';

-- 인덱스 조회
SHOW INDEX FROM posts;
-- 주요제약조건(pk, fk) => idnex가 자동생성
-- index는 조회 성능을 위한 목차페이지
-- BTREE구조의 ~~한 점 때문에 인덱스를 사용하면 빠르게 조회가 가능하다정도까지 정리할 능력 필요

-- ALTER문
-- 테이블 이름 변경
ALTER TABLE posts RENAME post;
-- 테이블 컬럼 추가
ALTER TABLE author ADD COLUMN role VARCHAR(50);
-- 테이블 컬럼 변경
ALTER TABLE author MODIFY COLUMN name VARCHAR(100) NOT NULL;
-- 컬럼 이름 변경
ALTER TABLE posts CHANGE COLUMN content contents VARCHAR(255);
-- 컬럼 삭제
ALTER TABLE author DROP DOLUMN test1;

