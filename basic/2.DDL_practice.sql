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