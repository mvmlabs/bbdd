## UF1. Introducció a les bases de dades

### 1. Introducció

Una **dada** és una representació simbòlica (numèrica, alfabètica, …) d'una entitat (objecte de la vida real). No té valor semàntic (sentit) per si mateixa. En canvi, si contextualitzem aquesta dada, estem generant **informació**. El ordinadors no són capaços d’interpretar la informació per si mateixos (a diferència dels éssers humans, que sí que ho podem fer). Els programes informàtics però,  necessiten dades (d’entrada) per a poder executar-se, que analitzen i transformen, i així retornar noves dades (de sortida) de valor per a l’usuari del programa.

Les **metadades** són dades sobre les dades. És tota aquella informació descriptiva sobre el context, qualitat, condició o característiques d'un recurs, dada o objecte amb la finalitat de facilitar-ne la recuperació, autentificació, avaluació, preservació i/o interoperabilitat.

Així, disposem de moltes dades que calen relacionar i emmagatzemar, per tal de generar coneixement i per poder accedir a la informació, en qualsevol moment. La col·lecció de dades rellevant per a una entitat (empresa, escola, …) s’anomena **base de dades** (_database_, DB).

### 2. Gestió de les bases de dades

Com s'han gestionat les dades al llarg dels anys? A continuació analitzem les característiques principals de cada periode:
 
**Anys 60 - 70**
- Aplicacions de propòsit específic i processament per lots
- Diferents tipus de suports per a emmagatzemar les dades (cintes magnètiques, targetes microperforades, fitxers)
- **DB redundants**: a cada inserció/modificació es creava un nou fitxer (màster i còpies)
- Bases de dades en xarxa i jeràrquiques

![Photo by Arnold Reinhold](images/dbms_6070.png)
[The CDC 6600 supercomputer, 1964](https://www.advsyscon.com/blog/batch-processing-system/)

**Anys 70 - 80**
- L’aparició dels PCs (Personal Computers) estén la informàtica (empreses i institucions)
- Model E-R (entity-relationship) per Peter Chen (1976)
- Model de base de dades relacional proposat per E. F. Codd al 1970
-- DB relacionals 
-- Primers SGBD comercials (DB2/IBM, Oracle)
- SQL (Structured Query Language) per a gestionar DB relacionals (inicis dels anys 80)

**Anys 90**
- Boom de les DB open source (MySQL, PostgreSQL)
- 4GL pel desenvolupament d’aplicacions basades en DB
- Accés online a les DB  (entorn client/servidor)
- Bases de dades distribuïdes

**Actualment**
- TAD (Tipus de Dades Abstractes)
- XML DB per a emmagatzemar tipus de dades complexes
- DB orientades a objectes (OODB)
- NoSQL per a Big Data i aplicacions web en temps real
- Cloud DB (distribució i accés al núvol)

### Bibliografia

- [**Fundamentos de bases de datos. SILBERSCHATZ, KORTH, SUDARSHAN. 6ª Edición. McGrawHill Education**](https://www.casadellibro.com/libro-fundamentos-de-bases-de-datos/9788448190330/2303933)
- [**Bases de dades. Planas, Jaume Sistac. Edicions de la Universitat Oberta de catalunya, 1a Edició (2000)**](https://www.editorialuoc.cat/bases-de-dades)
