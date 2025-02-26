# 2025-02-25 DAY1
USE titanic;
SHOW Tables;
SELECT * FROM p_info;
SELECT Name FROM p_info;
SELECT Name, Sex, Age FROM p_info;
DESC p_info;
SELECT * FROM p_info LIMIT 10;
SELECT * FROM p_info WHERE Sex="male";
SELECT * FROM p_info WHERE Age >= 40;
SELECT * FROM p_info WHERE Sex = "male" AND Age <10;
SELECT * FROM p_info WHERE Sex = "male" OR Age <10;

SELECT * FROM p_info WHERE Sex = "female" AND Age >= 20;
SELECT * FROM p_info WHERE SibSp >= 1 AND Parch >= 1;
SELECT * FROM t_info WHERE Pclass = 1;
SELECT * FROM t_info WHERE Pclass = 2 OR Fare > 50;
SELECT * FROM survived WHERE survived = 1;
SELECT * FROM survived;
SELECT * FROM t_info;

SHOW tables;

SELECT * FROM p_info WHERE Sex="male"; 

SELECT * FROM p_info WHERE SibSp not in (1,2,3,4);
SELECT * FROM p_info WHERE Name LIKE "Rice, Master. Eugene";
SELECT * FROM p_info WHERE Name LIKE "Rice%";
SELECT * FROM p_info WHERE Name LIKE "%Eric";
SELECT * FROM p_info WHERE Name LIKE "%Oscar%";

SELECT * FROM p_info WHERE Age BETWEEN 20 AND 40;

SELECT * FROM p_info WHERE Age is NULL;
SELECT * FROM p_info WHERE Age = NULL;
SELECT * FROM p_info WHERE Age IS NOT NULL;

SELECT * FROM t_info WHERE Fare between 100 AND 10000;
SELECT * FROM t_info WHERE Ticket LIKE "PC%" AND Embarked in("C", "S");
SELECT * FROM t_info WHERE Pclass in (1, 2);
SELECT * FROM t_info WHERE Cabin LIKE "%59%";
SELECT * FROM p_info WHERE NAME LIKE "%James%" AND Age >= 40 AND Sex="male";

SELECT * FROM p_info WHERE Age IS NOT NULL AND Name LIKE "%Miss%" AND Age <= 40 AND Sex = "female" ORDER BY Age DESC;

SELECT Sex, AVG(Age) FROM p_info WHERE AGE IS NOT NULL GROUP BY Sex;

SELECT Pclass, AVG(Fare) FROM t_info GROUP BY Pclass;
SELECT Pclass, AVG(Fare) FROM t_info GROUP BY Pclass having AVG(Fare) > 50;

SELECT * FROM passenger LIMIT 10;
SELECT * FROM ticket LIMIT 3;

SELECT * FROM passenger INNER JOIN ticket ON passenger.PassengerId = ticket.PassengerId;

SELECT * FROM passenger LEFT JOIN ticket ON passenger.passengerId = ticket.passengerId;
SELECT * FROM passenger RIGHT JOIN ticket ON passenger.PassengerId = ticket.PassengerId;

SELECT passengerId, Name, Age, Pclass, Fare FROM passenger LEFT JOIN ticket ON passenger.PassengerId = ticket.PassengerId;
SELECT ticket.passengerId, Name, Age, Pclass, Fare FROM passenger LEFT JOIN ticket ON passenger.PassengerId = ticket.PassengerId;

SELECT t.passengerId, Name, Age, Pclass, Fare FROM passenger AS p LEFT JOIN ticket AS t ON p.PassengerId = t.PassengerId;

SELECT * FROM passenger p INNER JOIN ticket t ON p.PassengerId = t.PassengerId INNER JOIN survived s ON p.PassengerId = s.PassengerId;