CREATE DATABASE board;

USE board;

CREATE TABLE author(id INT, name VARCHAR(255), 
email VARCHAR(255), password VARCHAR(255), test1 VARCHAR(255) PRIMARY KEY(id));

CREATE TABLE posts(id INT, name VARCHAR(255), 
email VARCHAR(255), password VARCHAR(255), test1 VARCHAR(255) PRIMARY KEY(id));

SHOW TABLES;

DESCRIBE author;

SHOW FULL COLUMNS FROM author;

SHOW CREATE TABLE author;

SHOW INDEX FROM author;

ALTER TABLE posts RENAME post;

ALTER TABLE author ADD COLUMN address VARCHAR(255) DEFAULT NULL;

ALTER TABLE post MODIFY COLUMN contents VARCHAR(3000);

ALTER TABLE author CHANGE COLUMN address address2 varchar(255) NOT NULL;

SHOW CREATE TABLE post;

DROP TABLE IF EXISTS post;

-- 테이블 생성문
CREATE TABLE `post` (
   `id` int(11) NOT NULL,
   `title` varchar(255) DEFAULT NULL,
   `contents` varchar(3000) DEFAULT NULL,
   `author_id` int(11) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `author_id` (`author_id`),
   CONSTRAINT `post_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

 -- INDEX 생성 및 삭제
SHOW INDEX FROM post;

ALTER TABLE post MODIFY COLUMN title varchar(255) UNIQUE;
ALTER TABLE post ADD CONSTRAINT title UNIQUE(title);
-- UNIQUE의 경우에는 DROP시에 제약 조건과 INDEX 둘 다 같이 날아간다.
ALTER TABLE post DROP INDEX title_2;

-- 제약조건 확인
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'post';

-- 외래 키 삭제 (제약 조건은 삭제되나, INDEX는 삭제되지 않는다.)
ALTER TABLE post DROP FOREIGN KEY post_ibfk_1;


---------------------------------------------------------------------
ALTER TABLE post MODIFY COLUMN id INT AUTO_INCREMENT;
describe post;

-- post 테이블에 id없이 insert
-- insert한 데이터 삭제 후 다시 insert
insert into post(title, contents) values('hello2','world');
delete from post;
select * from post;
alter table post auto_increment = 5;
insert into post values();

show index from post;

ALTER TABLE post MODIFY COLUMN title varchar(255) UNIQUE;
ALTER TABLE post ADD CONSTRAINT title UNIQUE(title);
ALTER TABLE post DROP INDEX title;

SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'post';

SHOW INDEX FROM post;
ALTER TABLE post DROP FOREIGN KEY title;
ALTER TABLE post DROP INDEX title;

ALTER TABLE post ADD CONSTRAINT post_author_fk FOREIGN KEY (author_id) REFERENCES author(id) ON UPDATE CASCADE;
ALTER TABLE post ADD CONSTRAINT post_author_fk FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE SET NULL ON UPDATE SET NULL;

select * from author;
select * from post;

show create table post;

select id, title, contents, 
case author_id
	when 1 then 'First Author'
    when 2 then 'Second Author'
    else 'Others'
end
as author_type from post;

-- if문법 사용해서 만약 id가 1이면 first author 그렇지 않으면 others 출력
-- id, title, contents, author_type

select 
	case id
		when 1 then 'first author'
        else 'others'
	end as id,
    title, contents from post;
    
select id, title, contents, ifnull(author_id, 'anonymous') from post;
-- 위에서 사용한 ifnull의 결과값을 동일하게 if문으로 출력
select id, title, contents, 
if(author_id is null, 'anonymous', author_id) as author_id from post;


