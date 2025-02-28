USE korea_exchange_rate;
SHOW Tables;

SELECT * FROM exchange_rate WHERE date between "1997-01-01" and "2001-12-31";

CREATE VIEW exchange_rate_1997_2001 AS
SELECT 통화,
	MIN(현찰_살때_환율) AS 살때최저환율,
    MAX(현찰_살때_환율) AS 살때최고환율,
    ROUND(AVG(현찰_살때_환율), 2) AS 살때평균환율,
    ROUND(MAX(현찰_살때_환율) - MIN(현찰_살때_환율), 2) AS 살때환율변동량,
    MIN(현찰_팔때_환율) AS 팔때최저환율,
    MAX(현찰_팔때_환율) AS 팔때최고환율,
    ROUND(AVG(현찰_팔때_환율), 2) AS 팔때평균환율,
    ROUND(MAX(현찰_팔때_환율) - MIN(현찰_팔때_환율), 2) AS 팔때환율변동량
    FROM exchange_rate WHERE date BETWEEN "1997-01-01" AND "2001-12-31" GROUP BY 통화;

SELECT * FROM exchange_rate_1997_2001 WHERE 통화 = "미국 USD";

UPDATE exchage_rate_1997_2001 SET 통화='미국' WHERE 살때최저환율=855.34;