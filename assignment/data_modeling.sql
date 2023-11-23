-- 스키마 추가 및 변경
    --author 테이블을 나누어 author_address 테이블 추가
        --country.state_city, details, zip code, phonenumber
        --on delete cascade 옵션
        --1:1 관계 설정
    --author와 post의 관계가 N:M. 즉, 여러명이서 한 post를 수정할 수 있도록 스키마 수정

create table author_address(
		id INT AUTO_INCREMENT, 
		author_id INT, 
		country VARCHAR(255), 
		state_city VARCHAR(255), 
		details VARCHAR(1000), 
		zip_code VARCHAR(50), 
		phonenumber VARCHAR(20), 
		PRIMARY KEY(id), 
		FOREIGN KEY(author_id) REFERENCES author(id) ON DELETE CASCADE
    );
    
ALTER TABLE author DROP COLUMN address;



-- 필요 산출물
    -- ER 다이어그램을 통해 추상화
    -- 릴레이셔널 스키마를 통해 구체화
    -- 테이블 생성문(DDL)
    -- 테스트케이스

CREATE TABLE author_address(
    id INT AUTO_INCREMENT, 
    author_id INT, 
    country VARCHAR(255), 
    state_city VARCHAR(255), 
    details VARCHAR(1000), 
    zip_code VARCHAR(50), 
    phonenumber VARCHAR(20), 
    PRIMARY KEY(id), 
    FOREIGN KEY(author_id) REFERENCES author(id) ON DELETE CASCADE
);
    
DESCRIBE author_address;
SHOW INDEX FROM author_address;
ALTER TABLE author_address MODIFY COLUMN author_id INT UNIQUE;
ALTER TABLE author DROP COLUMN ADDRESS;

CREATE TABLE post_authors(
id INT, 
author_id INT, 
post_id INT, 
PRIMARY KEY(id), 
FOREIGN KEY(author_id) REFERENCES author(id), 
FOREIGN KEY(post_id) REFERENCES post(id)
);

-- 스키마 설계
-- 주문관리 서비스 설계
-- 요구사항
    -- 모든테이블 컬럼 자유 설계
    -- ordersystem 데이터베이스 생성
    -- 해당 서비스에서는 회원가입이 가능
        -- 회원의 종류가 user, admin, seller로 구성
    -- 판매자는 상품과 재고수량을 등록
        -- 상품명, 상품가격, 재고
        -- 누가 등록했는지에 대한 정보가 남아야 함에 유의
    -- user는 한꺼번에 여러 상품을 한꺼번에 주문 가능
-- 필요 산출물
    -- ER다이어그램을 통해 추상화

    -- 릴레이셔널 스키마를 통해 구체화

    -- 테이블 생성문(DDL)


