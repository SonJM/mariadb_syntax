show index from author;
describe author;
select * from author;

drop index name_3 on author;
update author set name='son' where email='son3@naver.com';
create index name_email_index on author(name,email);
alter table author drop constraint name;

select * from author where name='son';
select * from author where name='son' and email='s';

-- GRANT
SELECT * from mysql.user;
SHOW GRANTS FOR 'root'@'localhost';

create user 'testuser'@'localhost' identified by '1234';
SHOW GRANTS FOR 'testuser'@'localhost';
GRANT SELECT ON board.author_view TO 'testuser'@'localhost';
REVOKE insert on board.author from 'testuser2'@'%';
FLUSH privileges;

drop user 'testuser'@'localhost';

create view author_view as
select name, email
from author;	

select * from author_view;
show index from author_view;