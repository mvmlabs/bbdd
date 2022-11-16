CREATE DATABASE IF NOT EXISTS casacolonies;

CREATE TABLE IF NOT EXISTS activitat(
	id INT NOT NULL AUTO_INCREMENT,
	nom_activitat VARCHAR(20) NOT NULL,
     	PRIMARY KEY (id)
); 

CREATE TABLE IF NOT EXISTS comarca(
	id INT NOT NULL AUTO_INCREMENT,
	nom_comarca VARCHAR(20) NOT NULL,
	superficie INT DEFAULT NULL,
	num_habitants INT DEFAULT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS casa_colonies(
	id INT NOT NULL AUTO_INCREMENT,
	nom_casa VARCHAR(20) NOT NULL,
	id_comarca INT NOT NULL,
	capacitat INT DEFAULT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_comarca) REFERENCES comarca(id)
);

CREATE TABLE IF NOT EXISTS nen(
	codi_nen INT NOT NULL AUTO_INCREMENT,
	id_casa INT NOT NULL,
	id_comarca INT NOT NULL,
	nom VARCHAR(20) DEFAULT NULL,
	cognom VARCHAR(20) DEFAULT NULL,
	telefon INT DEFAULT NULL,
	PRIMARY KEY (codi_nen),
	FOREIGN KEY (id_casa) REFERENCES casa_colonies(id),
	FOREIGN KEY (id_comarca) REFERENCES comarca(id)
);

CREATE TABLE IF NOT EXISTS oferta(
	id INT NOT NULL AUTO_INCREMENT,
	id_casa INT NOT NULL,
	id_activitat INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_casa) REFERENCES casa_colonies(id),
	FOREIGN KEY (id_activitat) REFERENCES activitat(id)	
);

INSERT INTO activitat VALUES (NULL, 'kayac'), (NULL, 'hípica'), (NULL, 'snorkel'), (NULL, 'vela');
INSERT INTO comarca VALUES (NULL, 'Bages', 1092, 178885), (NULL, 'Baix Camp', 697, 190973), (NULL, 'Cerdanya', 546, 18192), (NULL, 'Garraf', 185, 150887);
INSERT INTO casa_colonies VALUES (NULL, 'Albatros', 2, 50), (NULL, 'Castell de Fluvià', 3, 80), (NULL, 'Mas Pinsach', 1, 120), (NULL, 'Torreferrana', 2, 35), (NULL, 'La Garbinada', 1, 55);
INSERT INTO nen VALUES (NULL, 1, 1, 'Marta', 'Garcia', 651223241), (NULL, 2, 4, 'Joan', 'Puig', 623541122), (NULL, 3, 2, 'Cristina', 'Fernandez', 678554980);
INSERT INTO oferta VALUES (NULL, 1, 4), (NULL, 2, 1), (NULL, 3, 2), (NULL, 4, 3);

SELECT c.nom_casa, a.nom_activitat FROM oferta o
INNER JOIN casa_colonies c ON o.id_casa = c.id
INNER JOIN activitat a ON o.id_activitat = a.id;

SELECT c.nom_casa as casa, a.nom_activitat as activitat 
FROM oferta o INNER JOIN casa_colonies c ON o.id_casa = c.id 
INNER JOIN activitat a ON o.id_activitat = a.id;

