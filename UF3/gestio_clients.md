## UF3. Llenguatges SQL: DCL i extensió procedimental

### Gestió de clients

1 - Implementem la base de dades on desenvoluparem el projecte (**gestio_clients**). 

```
CREATE DATABASE IF NOT EXISTS gestio_clients;
```

2 - Indiquem al DBMS que treballarem dins d'aquesta db:

```
USE gestio_clients;
```

3 - Implementem la taula per a emmagatzemar articles:

```
CREATE TABLE IF NOT EXISTS article (
	codi_article VARCHAR(6) NOT NULL,
	nom_article VARCHAR(25) NOT NULL,
	preu FLOAT DEFAULT NULL,
	quantitat INT DEFAULT NULL,
	PRIMARY KEY (codi_article)
);

```

4 - Inserim un registre i executem una query bàsica, per comprovar que tot és correcte:

```
INSERT INTO article (codi_article, nom_article, preu, quantitat) 
VALUES ('AR001', 'pantaló', 20.50, 50), ('AR002', 'camisa', 17.50, 75), ('AR003', 'samarreta', 10.00, 100), ('AR004', 'gorra', 6.00, 25);

SELECT * FROM article;
```

5 - Implementem la taula per a registrar canvis a la taula d'articles, mitjançant el trigger (log_article):

```
CREATE TABLE IF NOT EXISTS log_article (
	codi_article VARCHAR(6) NOT NULL,
	usuari VARCHAR(25) NOT NULL,
	data DATETIME NOT NULL,
	PRIMARY KEY (codi_article)
);
```

6 - Definim el trigger, que s'executar després d'inserir un registre en la taula d'article. Després inserim un registre, per comprovar que funciona correctament:

```
--NEW.codi_article: retorna el codi de l'article inserit 
--CURRENT_USER(): retorna l'usuari que executa l'acció (inserció article)
--NOW(): retorna la data i hora en la que s'executa l'acció
delimiter //
CREATE TRIGGER article_ai AFTER INSERT ON article 
FOR EACH ROW	
	INSERT INTO log_article (codi_article, usuari, data) 
	VALUES (NEW.codi_article, CURRENT_USER(), NOW()); //
delimiter ;


INSERT INTO article (codi_article, nom_article, preu, quantitat) 
VALUES ('AR006', 'vestit', 105.20, 10);

```

7 - Si volem enregistrar els valors antics i nous d'un article, cal modificar la taula **log_article** per poder emmagatzemar aquesta valors:

```
ALTER TABLE log_article CHANGE COLUMN codi_article codi_article_old varchar(6) NOT NULL;
ALTER TABLE log_article ADD codi_article_new VARCHAR(6) DEFAULT NULL; 
ALTER TABLE log_article ADD nom_article_old VARCHAR(25) DEFAULT NULL;
ALTER TABLE log_article ADD nom_article_new VARCHAR(25) DEFAULT NULL;
ALTER TABLE log_article ADD preu_old FLOAT DEFAULT NULL;
ALTER TABLE log_article ADD preu_new FLOAT DEFAULT NULL;
ALTER TABLE log_article ADD quantitat_old INT DEFAULT NULL;
ALTER TABLE log_article ADD quantitat_new INT DEFAULT NULL;
```

8 - Implementem el trigger per tal que s'executi en actualitzar un registre i actualitzem un article per comprovar que funciona correctament:

```
delimiter //
CREATE TRIGGER article_au AFTER UPDATE ON article 
FOR EACH ROW	
	INSERT INTO log_article (codi_article_old, codi_article_new, nom_article_old, nom_article_new, preu_old, preu_new, quantitat_old, quantitat_new, usuari, data) 
	VALUES (OLD.codi_article, NEW.codi_article, OLD.nom_article, NEW.nom_article, OLD.preu, NEW.preu, OLD.quantitat, NEW.quantitat, CURRENT_USER(), NOW()); //
delimiter ;

UPDATE article SET preu = 105.5 WHERE codi_article = 'AR007';
```