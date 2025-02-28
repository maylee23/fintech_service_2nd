# 데이터베이스, 테이블 만들기
CREATE DATABASE sampleDB;
DROP DATABASE sampleDB;
CREATE DATABASE sample_db;

# 데이터베이스 조회하기
SHOW DATABASES;

USE sample_db;
# 테이블 만들기, 삭제하기
CREATE TABLE customers(id int, name varchar(100), sex varchar(20), phpne varchar(20), address varchar(255));
DROP TABLE customers;

SELECT * FROM create_db.test_table;
USE create_db;
INSERT INTO test_table VALUES(NULL, "고길동", "010-4444-5555", "서울");
SELECT * FROM test_table;
UPDATE test_table SET address="고양시" WHERE id=1;
INSERT INTO test_table VALUES(NULL, "둘리", "010-1234-5678", "남극");
DELETE FROM test_table WHERE id=3;
DESC test_table;

rollback;

INSERT INTO test_table VALUES(NULL, "둘리", "010-1234-5678", "남극"),
(null, '길동이', '010-3333-4444', '서울'),
(null, '또치', '010-4444-5555', '깐따삐야');

SELECT * FROM test_table;

SELECT @@autocommit;
SET autocommit=1;
