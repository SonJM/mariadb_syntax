-- INSERT, SELECT, UPDATE, DELETE
INSERT INTO {table_name}(columns_name) values(...);
INSERT INTO {table_name} values;

UPDATE {table_name} SET {column_name}={value} WHERE {조건문};

DELETE FROM {table_name} WHERE {조건문};

SELECT * FROM {table_name} WHERE {조건문};
SELECT {column_name1}, {column_name2} FROM {table_name} WHERE {조건문};
SELECT * FROM {table_name} WHERE {조건문} (AND, OR, NOT, NOT IN, ...) {조건문};

-- DISTINCT KEYWORDS(중복 값을 제외하고 출력)
SELECT DISTINCT NAME FROM {table_name};

-- 흐름 제어문
-- CASE - WHEN - END
SELECT {column_name1}, ...
CASE {column_name2}
    WHEN { } THEN { }
    ...
    ELSE { }
END AS {result_name} FROM {table_name};

-- if문법 사용해서 만약 id가 1이면 first author 그렇지 않으면 others 출력
SELECT id, title, contents, 
IFNULL(author_id, 'anonymous')
FROM post;
-- 위에서 사용한 ifnull의 결과값을 동일하게 if문으로 출력
SELECT id, title, contents, 
IF(author_id IS NULL, 'anonymous', author_id)
AS author_id FROM post;