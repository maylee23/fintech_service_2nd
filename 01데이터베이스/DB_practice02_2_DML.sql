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