CREATE DATABASE IF NOT EXISTS menagerie;
CREATE TABLE IF NOT EXISTS pet (
	name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1), birth DATE, death DATE
);

ALTER TABLE pet ADD id int;
ALTER TABLE pet ADD PRIMARY KEY (id);
ALTER TABLE pet ADD sex CHAR(1);
alter table pet drop column sex;



INSERT INTO pet VALUES ('Puffball','Diane','hamster','f','1999-03-30',NULL);
INSERT INTO pet VALUES ('Fluffy','Harold','cat','f','1993-02-04',NULL);
INSERT INTO pet VALUES ('Claws','Gwen','cat','m','1994-03-17',NULL);
INSERT INTO pet VALUES ('Buffy','Harold','dog','f','1989-05-13',NULL);
INSERT INTO pet VALUES ('Fang','Benny','dog','m','1990-08-27',NULL);
INSERT INTO pet VALUES ('Bowser','Diane','dog','m','1979-08-31','1995-07-29');
INSERT INTO pet VALUES ('Chirpy','Gwen','bird','f','1998-09-11',NULL);
INSERT INTO pet VALUES ('Whistler','Gwen','bird','f','1997-12-09',NULL);	
INSERT INTO pet VALUES ('Slim','Benny','snake','m','1996-04-29',NULL);

INSERT INTO pet VALUES ('Puffball','Diane','hamster','1999-03-30',NULL,NULL,'f');
INSERT INTO pet VALUES ('Fluffy','Harold','cat','1993-02-04',NULL,NULL,'f');

select id, name, species from pet order by id desc;

CREATE TABLE animals (
     id MEDIUMINT NOT NULL AUTO_INCREMENT,
     name CHAR(30) NOT NULL,
     PRIMARY KEY (id)
);

INSERT INTO animals (name) VALUES
    ('dog'),('cat'),('penguin'),
    ('lax'),('whale'),('ostrich');
    
SELECT * FROM animals;

