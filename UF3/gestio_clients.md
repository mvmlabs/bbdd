## UF3. Llenguatges SQL: DCL i extensió procedimental

### Gestió de clients

1. Creem la base de dades on desenvoluparem el projecte (**gestio_clients**). 

```
CREATE DATABASE IF NOT EXISTS gestio_clients;
```

2. Indiquem al DBMS que treballarem dins d'aquesta db:

```
USE gestio_clients;
```

3. Creem la taula per a emmagatzemar articles:

```
CREATE TABLE IF NOT EXISTS article (
	codi_article VARCHAR(6) NOT NULL,
	nom_article VARCHAR(25) NOT NULL,
	preu FLOAT DEFAULT NULL,
	quantitat INT DEFAULT NULL,
	PRIMARY KEY (codi_article)
);

```

4. Inserim un registre i executem una consulta bàsica, per veure que tot és correcte:

```
INSERT INTO article (codi_article, nom_article, preu, quantitat) 
VALUES ('AR001', 'pantaló', 20.50, 50), ('AR002', 'camisa', 17.50, 75), ('AR003', 'samarreta', 10.00, 100), ('AR004', 'gorra', 6.00, 25);

SELECT * FROM article;
```