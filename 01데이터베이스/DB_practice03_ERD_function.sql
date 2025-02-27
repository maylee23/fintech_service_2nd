USE korea_stock_info;
SHOW tables;
SELECT * FROM stock_company_info;
SELECT * FROM 2024_09_stock_price_info;

USE korea_exchange_rate;
SHOW Tables;
SELECT * FROM exchange_rate;
SELECT COUNT(*) FROM exchange_rate;
SELECT * FROM exchange_rate WHERE DATE >= "2020-01-01" AND DATE <= "2020-12-31" AND 통화 = "유로 EUR";

# 2020년 1월1일부터 12월31일까지 데이터에서 통화별 '현찰_살때_환율'의 최소, 최대 평균값
SELECT 통화, MIN(현찰_살때_환율) AS 최소, MAX(현찰_살때_환율) AS 최대, ROUND(AVG(현찰_살때_환율), 2) AS 평균 FROM exchange_rate WHERE DATE >= "2020-01-01" AND DATE <= "2020-12-31" GROUP BY 통화;

USE korea_stock_info;
SHOW Tables;
SELECT * FROM 2024_08_stock_price_info;

CREATE TABLE stock_2024_all AS
SELECT * FROM 2024_07_stock_price_info UNION ALL
SELECT * FROM 2024_08_stock_price_info UNION ALL
SELECT * FROM 2024_09_stock_price_info;

##################################################################################################

# SQL 함수
# SELECT 함수(값)
SELECT MIN(), MAX()

# 절대값 ABS()
SELECT ABS(-34), ABS(1), ABS(-256);

# 문자열의 길이 측정 LENGTH(문자열);
SELECT LENGTH("MYSQL");

# 반올림, 올림, 내림
SELECT ROUND()
SELECT ceil()
SELECT floor()

# 연산자를 통한 계산
SELECT 7/2;
SELECT 7*2;
SELECT 7%2;
SELECT 7 dic 2;
SELECT 7 mod 2;

# power(제곱), sqrt(루트), sign(음수양수) 확인
SELECT power(4, 3);
SELECT sqrt(3);
SELECT sign(5), sign(-78)

# truncate(값, 자릿수) 버림
SELECT ROUND(2.2345, 3), TRUNCATE(2.2345, 3);
SELECT ROUND(1153.2345, -2), TRUNCATE(1153.2345, -2);

# 문자열 함수

# 문자의 길이를 알아보는 함수
# 한/영 에 관계없이 문자를 세려고 하면 'char length'
SELECT char_length('my sql'), length('my sql'); # 6, 6
SELECT char_length('홍 길동'), length('홍 길동'); # 4, 10

# 문자를 연결하는 함수 concat()
SELECT concat('this', ' is ', 'mysql') as concat1;
SELECT concat('this', null, 'mysql') S concat1;

# 원하는 구분자로 연결하는 함수 concat_ws()
SELECT concat_ws(' ', 'this', 'is', 'mysql') as concat1;

# 대문자를 소문자로 lower(), 소문자를 대문자로 upper()
SELECT lower('ABcd');
SELECT upper('efgh');

# 문자열의 자릿수를 일정하게 하고 빈 공간을 지정한 문자로 채우는 함수
# lpad(값, 자릿수, 채울문자), rpad(값, 자릿수, 채울문자)
SELECT lpad('sql', 7, '#');
SELECT lpad('sql', 7, ' ');
SELECT rpad('sql', 7, '=');
SELECT rpad('sql', 7, ' ');

# 공백을 없애는 함수 ltrim(문자열), rtrim(문자열), trim(문자열)
SELECT ltrim('    SQL    ');
SELECT rtrim('    SQL    ');
SELECT trin('    My SQL study    ');

# 문자열을 잘라내는 함수 left(문자열, 길이), right(문자열, 길이)
SELECT left('this is my sql', 4);
SELECT right('this is my sql', 5);

# 문자열을 중간에서 잘라내는 함수 substr(문자열, 시작위치, 길이)
SELECT substr('this is my sql', 6, 5);
SELECT substr('this is my sql', 9);

# 문자열의 공백을 앞, 뒤로 삭제하고 문자열 앞, 뒤에 포함된 특정 문자도 삭제하는 함수
# trim(leading '삭제할 문자' from, 전체 문자열);
SELECT trim('     my sql    ');
SELECT trim(leading '*' from '****my sql****');
SELECT trim(trailing '*' from '****my sql****');
SELECT trim(both '*' from '****my sql****');
SELECT trim(both '*' from '****my * sql****'); # 문자 사이에 있는 것은 삭제하지 않는다!

# 날짜 관련 함수
SELECT curtime();
SELECT now();
SELECT current_timestamp();

SELECT dayname(now());
SELECT dayname("2025-05-05");

# dayofweek(날짜), 일(1), 월(2), 화(3), 수(4), 목(5), 금(6), 토(7)
SELECT dayofweek(now());
SELECT dayofweek("2025-5-5");

SELECT dayofyear("2025-02-27");
SELECT dayofyear(now());

# 현재 달의 마지막 날
SELECT last_day(now());

SELECT year(now());
SELECT year("2025-10-01");

SELECT monthname(now());
SELECT monthname("2025-10-01");

SELECT quarter(now());
SELECT quarter("2025-12-23");

SELECT weekofyear(now());
SELECT weekofyear("2025-05-14"));

SELECT date(now());
SELECT time(now());

# date_add(날짜, interval 더할 날 수 day);
SELECT date_add(now(), interval 5 day);
SELECT adddate(now(), 5); # 위의 결과와 같음
SELECT extract(year_month from now());
SELECT extract(YEAR_MONTH from now());
SELECT extract(day_hour from now());
SELECT extract(DAY_HOUR from now());
SELECT extract(DAY_HOUR from "2025-02-27 05:39:05 PM");
SELECT extract(day_hour from "2025-02-27 05:39:0");

# subdate(날짜, interval 뺄 날 수 day);
SELECT subdate(now(), interval 5 day)
SELECT subdate(now(), 5);

# extract(옵션, from 날짜시간)
SELECT extract(YEAR_MONTH from now());
SELECT extract(DAY_HOUR from now()); # now()와 같이 쓰면 작동X
SELECT extract(minute_second from now());

# datediff(날짜1, 날짜2)
SELECT datediff(now(), '2024-12-25');
SELECT datediff('2024-12-25', now());

# 날짜 포맷 함수
# %Y 연도 4자리(####), %y 연도 2자리(##)
# %M 월 영문 표기(January, Febuary), %m 월 2자리 표기(##), %b 월 의 축약 영문 표기(Jan, Feb)
# %d 일 2자리 표기(##), %e 일 1자리 표기(#)
SELECT date_format(now(), '%d-%b-%Y');
SELECT date_format(now(), '%d-%M-%Y');
SELECT date_format(now(), '%e-%M-%Y');
SELECT date_format("2025-01-01", "%e-%M-%Y");
SELECT date_format("2025-01-01", "%d-%M-%Y");
SELECT date_format("2025-01-01", "%d-%m-%y");

# 시간 표기
# %H 24시간, %h 12시간, %p AM/PM 표기
# %i 분 2자리 표기(##)
# %S 초 2자리(##)
# %T 24시간 표기법 ex) 시:분:초
# %r 12시간 표기법 ex) 시:분:초 AM/PM
# %W 요일 영문 표기, %w 요일 숫자 표기 일(0), 월(1)
SELECT date_format(now(), "%p %h");
SELECT date_format(now(), '%H:%i:%S');
SELECT date_format(now(), '%h:%i:%S %p');
SELECT date_format(now(), '%r');
SELECT date_format(now(), '%T');
SELECT date_format(now(), '%r %W');
SELECT date_format(now(), '%r %w');
SELECT date_format("2025-02-23 17:23:54", "%W %r");
SELECT date_format("2025-02-23 17:23:54", "%w %r");
