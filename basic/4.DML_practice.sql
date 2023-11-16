-- author 데이터 중 id가 4인 데이터를 email을 abc@naver.com, name을 abc로 변경
update author set email='abc@naver.com', name='abc' where id=4;
-- post에 글쓴적이 없는 author 데이터 1개 삭제

-- post에 글쓴적이 있는 author 데이터 1개 삭제 -> 에러 -> 조치 후 삭제
-- 방법 1
delete from post where author_id = 2;
delete from author where id = 2;
-- 방법 2
update post set author_id = null where author_id = 2;
delete from author where id = 2;