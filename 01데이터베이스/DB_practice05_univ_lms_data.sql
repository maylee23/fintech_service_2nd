USE mydb;
SHOW tables;

SELECT * FROM department;
INSERT INTO department VALUES(1, '수학');
INSERT INTO department VALUES(2, '국문학');
INSERT INTO department VALUES(3, '정보통신공학');
INSERT INTO department VALUES(4, '모바일공학');

-- 학생 (student) 테이블 데이터 삽입
INSERT INTO student VALUES (1, '가길동', 177, 1);
INSERT INTO student VALUES (2, '나길동', 178, 1);
INSERT INTO student VALUES (3, '다길동', 179, 1);
INSERT INTO student VALUES (4, '라길동', 180, 2);
INSERT INTO student VALUES (5, '마길동', 170, 2);
INSERT INTO student VALUES (6, '바길동', 172, 3);
INSERT INTO student VALUES (7, '사길동', 166, 4);
INSERT INTO student VALUES (8, '아길동', 192, 4);

-- 교수 (professor) 테이블 데이터 삽입
INSERT INTO professor VALUES (1, '가교수', 1);
INSERT INTO professor VALUES (2, '나교수', 2);
INSERT INTO professor VALUES (3, '다교수', 3);
INSERT INTO professor VALUES (4, '빌게이츠', 4);
INSERT INTO professor VALUES (5, '스티브잡스', 3);

-- 개설과목 (course) 테이블 데이터 삽입
INSERT INTO course VALUES (1, '교양영어', '2016/9/2', '2016/11/30', 1);
INSERT INTO course VALUES (2, '데이터베이스 입문', '2016/8/20', '2016/10/30', 3);
INSERT INTO course VALUES (3, '회로이론', '2016/10/20', '2016/12/30', 2);
INSERT INTO course VALUES (4, '공업수학', '2016/11/2', '2017/1/28', 4);
INSERT INTO course VALUES (5, '객체지향프로그래밍', '2016/11/1', '2017/1/30', 3);

-- 수강 (student_course) 테이블 데이터 삽입
INSERT INTO student_course VALUES (1, 1);
INSERT INTO student_course VALUES (2, 1);
INSERT INTO student_course VALUES (3, 2);
INSERT INTO student_course VALUES (4, 3);
INSERT INTO student_course VALUES (5, 4);
INSERT INTO student_course VALUES (6, 5);
INSERT INTO student_course VALUES (7, 5);


SELECT * FROM student;
SELECT * FROM department;
SELECT * FROM professor;
SELECT * FROM course;
SELECT * FROM student_course;


############### 문제

# 1
SELECT student_id, student_name, height, s.department_id, department_name FROM student s INNER JOIN department d ON s.department_id = d.department_id;

# 2
SELECT professor_id FROM professor WHERE professor_name = "가교수";

# 3
SELECT d.department_name, COUNT(d.department_name) FROM department d LEFT JOIN professor ON d.department_id = professor.department_id GROUP BY d.department_name;

# 4
SELECT student_id, student_name, height, s.department_id, department_name FROM student s LEFT JOIN department d ON s.department_id = d.department_id WHERE department_name='정보통신공학';

# 5
SELECT professor_id, professor_name, d.department_id, department_name FROM professor p LEFT JOIN department d ON p.department_id = d.department_id WHERE department_name = '정보통신공학';

# 6
SELECT student_name, department_name FROM student s LEFT JOIN department d ON s.department_id = d.department_id WHERE student_name LIKE "아%";

# 7
SELECT COUNT(student_id) FROM student WHERE height BETWEEN 180 AND 190;

# 8
SELECT department_name, MAX(height), ROUND(AVG(height)) FROM student s LEFT JOIN department d ON s.department_id = d.department_id GROUP BY department_name ORDER BY department_name;

# 9 !!
SELECT student_name FROM student WHERE department_id = (SELECT department_id FROM student WHERE student_name = "다길동");

# 10
SELECT student_name, course_name FROM student s LEFT JOIN student_course sc ON s.student_id = sc.student_id LEFT JOIN course c ON sc.course_id = c.course_id WHERE start_date LIKE "2016/11%";

# 11
SELECT student_name, course_name FROM student s LEFT JOIN student_course sc ON s.student_id = sc.student_id LEFT JOIN course c ON sc.course_id = c.course_id WHERE course_name="데이터베이스 입문";

# 12
SELECT COUNT(*) FROM student s LEFT JOIN student_course sc ON s.student_id = sc.student_id WHERE course_id = (SELECT course_id FROM professor p LEFT JOIN course c ON p.professor_id = c.professor_id WHERE professor_name="빌게이츠");


SELECT COUNT(s.student_id) FROM student s LEFT JOIN student_course sc ON s.student_id = sc.student_id LEFT JOIN course c ON sc.course_id = c.course_id LEFT JOIN professor p ON c.professor_id = p.professor_id WHERE professor_name="빌게이츠";

