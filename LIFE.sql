-- Active: 1702486969631@@127.0.0.1@3306@life

drop DATABASE life ;

CREATE DATABASE LIFE ;

USE LIFE ;


CREATE TABLE FAMILY(
    ID INT UNIQUE PRIMARY KEY
) ;

CREATE TABLE PERSON (
    ID INT UNIQUE PRIMARY KEY,
    NAME VARCHAR(45),
    BIRTHDATE DATE,
    INCOMEPERYEAR DECIMAL,
    FAMILY INT,
    FOREIGN KEY (FAMILY) REFERENCES FAMILY(ID)
) ;

CREATE TABLE NATIONALITY(
    PERSON INT NOT NULL UNIQUE,
    COUNTRY INT NOT NULL
) ;




CREATE TABLE CATEGORY(
    ID INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(25)
) ;


CREATE TABLE EXPENSES (
    AMOUNT DECIMAL,
    PERSON INT,
    CATEGORY INT
) ;




CREATE TABLE COMPANY (
    ID INT PRIMARY KEY UNIQUE NOT NULL,
    NAME VARCHAR(45)
) ;


CREATE TABLE Continent (
    ID INT PRIMARY KEY UNIQUE NOT NULL,
    NAME VARCHAR(45)
) ;

CREATE TABLE Country (
    ID INT PRIMARY KEY UNIQUE NOT NULL,
    NAME VARCHAR(45),
    GPDperCapota DECIMAL,
    continent int
) ;


CREATE TABLE Travels (
    country int not NULL,
    person int not null,
    arrival date not null,
    departure date not null
) ;

ALTER TABLE PERSON
  ADD COLUMN COMPANY INT ;


ALTER TABLE NATIONALITY
    add FOREIGN KEY (PERSON) REFERENCES PERSON(ID),
    add FOREIGN key (COUNTRY) REFERENCES Country(id) ;


ALTER TABLE EXPENSES 
    add FOREIGN KEY(PERSON) REFERENCES PERSON (ID),
    add FOREIGN KEY(CATEGORY) REFERENCES CATEGORY (ID) ;


ALTER TABLE PERSON
    ADD FOREIGN KEY(COMPANY) REFERENCES COMPANY(ID) ;


ALTER TABLE Travels 
    add FOREIGN key (country) REFERENCES country(id),
    add FOREIGN key (person) REFERENCES person(id) ;

ALTER TABLE Country 
    add FOREIGN KEY(continent) REFERENCES CONTINENT(ID) ;




INSERT INTO FAMILY (ID) VALUES (1), (2), (3),(4);



INSERT INTO PERSON (ID, NAME, BIRTHDATE, INCOMEPERYEAR, FAMILY)
VALUES
    (1, 'Alice', '1990-05-15', 50000.00, 1),
    (2, 'Bob', '1985-10-22', 60000.00, 2),
    (3, 'Charlie', '1993-03-08', 48000.00, 3),
    (4, 'David', '1988-12-18', 55000.00, 1),
    (5, 'Emma', '1995-08-29', 52000.00, 2),
    (6, 'Frank', '1980-07-12', 58000.00, 3),
    (7, 'Grace', '1992-01-25', 53000.00, 1),
    (8, 'Hannah', '1987-06-17', 59000.00, 2),
    (9, 'Isaac', '1998-09-03', 51000.00, 3),
    (10, 'Jessica', '1983-11-11', 56000.00, 1),
    (11, 'Kevin', '1991-04-02', 54000.00, 2),
    (12, 'Linda', '1989-02-14', 57000.00, 3),
    (13, 'Michael', '1994-07-21', 49000.00, 1),
    (14, 'Nancy', '1986-05-09', 60000.00, 2),
    (15, 'Oliver', '1997-12-30', 50000.00, 3),
    (16, 'Patricia', '1984-08-18', 55000.00, 1),
    (17, 'Quinn', '1990-03-05', 52000.00, 2),
    (18, 'Ryan', '1982-10-27', 58000.00, 3),
    (19, 'Samantha', '1996-06-13', 53000.00, 1),
    (20, 'Samantha', '1996-06-12', 53000.00, 1),
    (21, 'Thomas', '1981-09-20', 59000.00, 4);

INSERT INTO COMPANY (ID, NAME) VALUES
    (1, 'Company A'),
    (2, 'Company B'),
    (3, 'Company C'),
    (4, 'Company D');



INSERT INTO CONTINENT (ID, NAME) VALUES
    (1, 'Asia'),
    (2, 'Europe'),
    (3, 'Africa'),
    (4, 'North America'),
    (5, 'South America'),
    (6, 'Australia'),
    (7, 'Antarctica');

-- Insert random countries
INSERT INTO Country (ID, NAME, GPDperCapota, continent) VALUES
    (1, 'Country A', 50000.00, 1),
    (2, 'Country B', 60000.00, 2),
    (3, 'Country C', 48000.00, 3),
    (4, 'Country D', 55000.00, 4),
    (5, 'Country E', 52000.00, 5),
    (6, 'Country F', 58000.00, 6),
    (7, 'Country G', 53000.00, 1),
    (8, 'Country H', 59000.00, 2),
    (9, 'Country I', 51000.00, 3),
    (10, 'Country J', 56000.00, 4),
    (11, 'Country K', 54000.00, 5),
    (12, 'Country L', 57000.00, 6),
    (13, 'Country M', 49000.00, 1),
    (14, 'Country N', 60000.00, 2),
    (15, 'Country O', 50000.00, 3),
    (16, 'Country P', 55000.00, 4),
    (17, 'Country Q', 52000.00, 5),
    (18, 'Country R', 58000.00, 6),
    (19, 'Country S', 53000.00, 1),
    (20, 'Country T', 59000.00, 2);


INSERT INTO NATIONALITY (PERSON, COUNTRY) VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
    (6, 6), (7, 1), (8, 2), (9, 3), (10, 4),
    (11, 5), (12, 6), (13, 1), (14, 2), (15, 3),
    (16, 4), (17, 5), (18, 6), (19, 1), (20, 2);


INSERT INTO CATEGORY (NAME) VALUES
    ('Food'),
    ('Utilities'),
    ('Rent'),
    ('Transportation'),
    ('Entertainment'),
    ('Healthcare'),
    ('Education'),
    ('Clothing'),
    ('Travel'),
    ('Miscellaneous');


-- Generating unique expenses for each person in different categories
INSERT INTO EXPENSES (AMOUNT, PERSON, CATEGORY) VALUES
    (50.00, 1, 1),     -- Person 1, Food
    (120.00, 1, 2),    -- Person 1, Utilities
    (80.00, 1, 3),     -- Person 1, Rent
    (60.00, 2, 4),     -- Person 2, Transportation
    (30.00, 2, 5),     -- Person 2, Entertainment
    (70.00, 2, 6),     -- Person 2, Healthcare
    (90.00, 3, 7),     -- Person 3, Education
    (40.00, 3, 8),     -- Person 3, Clothing
    (100.00, 3, 9),    -- Person 3, Travel
    (45.00, 4, 10),    -- Person 4, Miscellaneous
    (55.00, 4, 1),     -- Person 4, Food
    (85.00, 4, 2),     -- Person 4, Utilities
    (75.00, 5, 3),     -- Person 5, Rent
    (65.00, 5, 4),     -- Person 5, Transportation
    (35.00, 5, 5),     -- Person 5, Entertainment
    (55.00, 6, 6),     -- Person 6, Healthcare
    (70.00, 6, 7),     -- Person 6, Education
    (40.00, 6, 8),     -- Person 6, Clothing
    (90.00, 7, 9),     -- Person 7, Travel
    (50.00, 7, 10),    -- Person 7, Miscellaneous
    (75.00, 8, 3),     -- Person 8, Rent
    (65.00, 8, 4),     -- Person 8, Transportation
    (35.00, 8, 5),     -- Person 8, Entertainment
    (55.00, 9, 6),     -- Person 9, Healthcare
    (70.00, 9, 7),     -- Person 9, Education
    (40.00, 9, 8),     -- Person 9, Clothing
    (90.00, 10, 9),    -- Person 10, Travel
    (50.00, 10, 10),   -- Person 10, Miscellaneous
    (75.00, 11, 3),    -- Person 11, Rent
    (65.00, 11, 4),    -- Person 11, Transportation
    (35.00, 11, 5),    -- Person 11, Entertainment
    (55.00, 12, 6),    -- Person 12, Healthcare
    (70.00, 12, 7),    -- Person 12, Education
    (40.00, 12, 8),    -- Person 12, Clothing
    (90.00, 13, 9),    -- Person 13, Travel
    (50.00, 13, 10),   -- Person 13, Miscellaneous
    (75.00, 14, 3),    -- Person 14, Rent
    (65.00, 14, 4),    -- Person 14, Transportation
    (35.00, 14, 5),    -- Person 14, Entertainment
    (55.00, 15, 6),    -- Person 15, Healthcare
    (70.00, 15, 7),    -- Person 15, Education
    (40.00, 15, 8),    -- Person 15, Clothing
    (90.00, 16, 9),    -- Person 16, Travel
    (50.00, 16, 10),   -- Person 16, Miscellaneous
    (75.00, 17, 3),    -- Person 17, Rent
    (65.00, 17, 4),    -- Person 17, Transportation
    (35.00, 17, 5),    -- Person 17, Entertainment
    (55.00, 18, 6),    -- Person 18, Healthcare
    (70.00, 18, 7),    -- Person 18, Education
    (40.00, 18, 8),    -- Person 18, Clothing
    (90.00, 19, 9),    -- Person 19, Travel
    (50.00, 19, 10),   -- Person 19, Miscellaneous
    (75.00, 20, 3),    -- Person 20, Rent
    (65.00, 20, 4),    -- Person 20, Transportation
    (35.00, 20, 5);    -- Person 20, Entertainment

INSERT INTO Travels (country, person, arrival, departure) VALUES
    (1, 3, '2023-01-10', '2023-01-20'),   -- Person 1, Country 1 in 2023
    (2, 7, '2024-02-05', '2024-02-15'),   -- Person 2, Country 2 in 2024
    (3, 10, '2025-03-20', '2025-03-25'),   -- Person 3, Country 3 in 2025
    (1, 13, '2023-04-12', '2023-04-20'),   -- Person 4, Country 1 in 2023
    (2, 16, '2024-05-02', '2024-05-10'),   -- Person 5, Country 2 in 2024
    (3, 19, '2025-06-15', '2025-06-25');   -- Person 6, Country 3 in 2025


UPDATE PERSON 
SET COMPANY = 
    CASE 
        WHEN ID IN (2, 6, 8, 11, 14) THEN 1
        WHEN ID IN (3, 4, 7, 12, 19) THEN 2
        WHEN ID IN (1, 5, 9, 13, 18) THEN 3
        WHEN ID IN (10, 15, 16, 17, 20) THEN 4
    END;





