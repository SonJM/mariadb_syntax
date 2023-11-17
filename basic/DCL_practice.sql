UPDATE author set role='user' WHERE role is not null;
ALTER TABLE author MODIFY role ENUM('user','admin') NOT NULL DEFAULT 'user';

show index from author;
describe author;
select * from author;

UPDATE author set role='admin' where id = 11;

ALTER TABLE post MODIFY COLUMN createdTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;

UPDATE post set createdTime=CURRENT_TIMESTAMP where id = 7;
describe post;
select * from post;

select * from post where id <> 1;

select * from author where id not in(1,2,4);

select * from post where id between 2 and 4;

select * from post where not(id < 2 or id > 4);