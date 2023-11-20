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