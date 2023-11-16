-- INSERT, SELECT, UPDATE, DELETE
insert into author(id, name, email) values(1, 'kim', 'abc@naver.com');

update author set email='abc2@test.com' where id=1;

delete from author where id=2;


select * from author where id=1;
select name, email from author where id=1;
select * from author where id > 1;
select * from author where id > 1 and name = 'kim';
