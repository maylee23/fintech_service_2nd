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

