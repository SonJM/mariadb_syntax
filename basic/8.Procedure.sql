-- 프로시저 실습
DELIMITER //
CREATE PROCEDURE getUser(IN userId INT)
BEGIN
	SELECT id, name FROM author WHERE id = userId;
END //
DELIMITER ;

SHOW CREATE PROCEDURE GETUSER;
CALL getUser(4);

-- post 테이블에 쉽게 insert할 수 있는 post관련 프로시저 생성
-- 사용자에게 title, contents, author_id만 입력받아 insert하는 insert문 생성
DELIMITER //
CREATE PROCEDURE insert_post2(IN input_title VARCHAR(255), IN input_contents VARCHAR(3000), IN input_author_id INT)
BEGIN
	INSERT INTO board.post(title, contents, author_id) VALUES (input_title, input_contents, input_author_id);
END //
DELIMITER ;

CALL insert_post('title10', 'contents10', '3');
DROP PROCEDURE insert_post;

-- post 테이블에 if문 활용하여 고액 원고료 작가 조회
DELIMITER //
CREATE PROCEDURE my_procedure(IN in_author_id INT)
BEGIN
	DECLARE in_price INT DEFAULT 0;
    SELECT avg(price) FROM post WHERE author_id = in_author_id INTO in_price;
    IF in_price > 1000 THEN
		SELECT '고액 원고료 작가입니다..' AS PRICE;
	ELSE
		SELECT ' 고액 원고료 작가가 아닙니다.' AS PRICE;
	END IF;
END //
DELIMITER ;

CALL my_procedure(1);
DROP PROCEDURE my_procedure;