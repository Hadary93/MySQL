
USE LIFE;

select * from person;

select (name) from person;

select DISTINCT (`COMPANY`) from person;

select * from person where `ID` <5;

select * from person where `ID` BETWEEN 3 and 5;

select * from person where `NAME` LIKE "k%";

select * from person where `NAME` IN ("Hannah","Linda");

select * from person ORDER BY `BIRTHDATE` DESC,`NAME` ASC;

select * from person WHERE `ID` BETWEEN 1 and 20 and `NAME` LIKE "H%";

select * from person WHERE `ID` BETWEEN 1 and 2 or `NAME` LIKE "H%" and `INCOMEPERYEAR` < 55000;

select * from person where `NAME` not LIKE "A%";

select * from person where `NAME` IS NULL;

select * from person LIMIT 3;


select * from (select * from person where `NAME` not LIKE "A%" LIMIT 2) as r1 where `INCOMEPERYEAR` < 50000;


select MIN(`BIRTHDATE`) from person;

select MAX(`BIRTHDATE`) from person;

select COUNT(*) from person;

SELECT AVG(`INCOMEPERYEAR`) from person;


SELECT AVG(`INCOMEPERYEAR`) from person as averageIncome;


select CONCAT(`NAME`,",",`INCOMEPERYEAR`) from person;



select person.`NAME` , company.`NAME`  from person INNER join company on person.`COMPANY` = company.`ID`;

select person.`NAME` , company.`NAME`  from person LEFT join company on person.`COMPANY` = company.`ID`;

select COMPANY.`NAME` , person.`NAME` from company RIGHT join person on person.`COMPANY` = company.`ID`;


SELECT c.`NAME`, p.`NAME`
FROM company c
LEFT JOIN person p ON p.`COMPANY` = c.`ID`
UNION
SELECT c.`NAME`, p.`NAME`
FROM company c
RIGHT JOIN person p ON p.`COMPANY` = c.`ID`;

select person.`ID` as personalNumber from person where `ID` < 10 ORDER BY `ID` DESC;


SELECT SUM(EXPENSES.`AMOUNT`), EXPENSES.`PERSON` FROM expenses GROUP BY `PERSON`;


SELECT SUM(EXPENSES.`AMOUNT`), EXPENSES.`PERSON` FROM expenses  GROUP BY `PERSON` HAVING SUM(EXPENSES.`AMOUNT`) > 100;


select  `INCOMEPERYEAR` from person where EXISTS (select 1 from person WHERE person.`INCOMEPERYEAR`>58000)
