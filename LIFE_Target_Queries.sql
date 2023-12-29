USE LIFE;

--The Countries income from tourism

create TEMPORARY TABLE people_travelExpenses as
SELECT person.ID, expenses.AMOUNT 
FROM person 
INNER JOIN expenses ON person.ID = expenses.PERSON 
WHERE expenses.CATEGORY = (
    SELECT life.category.ID 
    FROM life.category 
    WHERE life.category.NAME = 'Travel'
);

select `NAME`,income from country INNER JOIN 
(select Travels.country, SUM(people_travelExpenses.amount) as income
from travels
INNER JOIN people_travelExpenses on people_travelExpenses.ID = travels.person GROUP BY travels.country) as countryID_income
ON country.`ID` = countryID_income.country;


--The most consuming expenses in family's life.

SELECT `FAMILY`,`NAME`,totalexpenses from category INNER join 
(select `FAMILY` , SUM(`AMOUNT`) as totalExpenses, `CATEGORY` from person
INNER JOIN expenses on person.`ID` = expenses.`PERSON` GROUP BY `FAMILY`,`CATEGORY`) as family_expenses_category
on family_expenses_category.category = category.`ID` ORDER BY `FAMILY`,totalexpenses DESC



