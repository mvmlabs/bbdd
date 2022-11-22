CREATE DATABASE IF NOT EXISTS personal;
USE personal;

CREATE TABLE IF NOT EXISTS person (name varchar(45), age int);
INSERT INTO person VALUES ('Matthew', 25), ('Mark', 20);
SELECT * FROM person;

CREATE TABLE average_age (average double);
INSERT INTO average_age SELECT AVG(age) FROM person;
SELECT * FROM average_age;

CREATE TABLE person_archive (
	name varchar(45),
	age int,
	time timestamp DEFAULT NOW()
);
--Inici trigger person_au
delimiter //
CREATE TRIGGER person_au AFTER UPDATE
ON person
FOR EACH ROW
UPDATE average_age SET average = (SELECT AVG(age) FROM person); //
--Final trigger person_au
--Retornem al delimitador habitual
delimiter ;

--Inici trigger person_bi
delimiter //
CREATE TRIGGER person_bi BEFORE INSERT
ON person
FOR EACH ROW
IF NEW.age < 18 THEN
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Edat de la persona ha de ser més gran de 18';
END IF; //
--Final trigger person_bi
--Retornem al delimitador habitual
delimiter ;

INSERT INTO person VALUES ('John', 14);
