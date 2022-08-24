## UF1. Introducció a les bases de dades

### 1. Introducció
Una **dada** és una representació simbòlica (numèrica, alfabètica, …) d'una característica d’una entitat (objecte de la vida real). No té valor semàntic (sentit) per si mateixa. En canvi, si contextualitzem aquesta dada, estem generant **informació**. El ordinadors no són capaços d’interpretar la informació per si mateixos (a diferència dels éssers humans, que sí que ho podem fer). Els programes informàtics però,  necessiten dades (d’entrada) per a poder executar-se, que analitzen i transformen, i així retornar noves dades (de sortida) de valor per a l’usuari del programa.

Les **metadades** són dades sobre les dades. És tota aquella informació descriptiva sobre el context, qualitat, condició o característiques d'un recurs, dada o objecte amb la finalitat de facilitar-ne la recuperació, autentificació, avaluació, preservació i/o interoperabilitat.

Així, disposem de moltes dades que calen relacionar i emmagatzemar, per tal de generar coneixement i per poder accedir a la informació, en qualsevol moment. La col·lecció de dades rellevant per a una entitat (empresa, escola, …) s’anomena **base de dades** (*database*, DB).

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
	- DB relacionals 
	- Primers SGBD comercials (DB2/IBM, Oracle)
- SQL (Structured Query Language) per a gestionar DB relacionals (inicis dels anys 80)

![Característiques principals de SQL](images/dbms_7080.jpg)
[Característiques principals de SQL](https://skylineittech.com/sql-course/)

**Anys 90**
- Boom de les DB open source (MySQL, PostgreSQL)
- 4GL pel desenvolupament d’aplicacions basades en DB
- Accés online a les DB  (entorn client/servidor)
- Bases de dades distribuïdes

![Principals DBMS](images/dbms_90.jpg)

**Actualment**
- TAD (Tipus de Dades Abstractes)
- XML DB per a emmagatzemar tipus de dades complexes
- DB orientades a objectes (OODB)
- NoSQL per a Big Data i aplicacions web en temps real
- Cloud DB (distribució i accés al núvol)

![Tendències actuals](images/dbms_nowadays.jpg)

#### DBMS (database management system)
Un database management system (*DBMS*) és un programari o conjunt d’aplicacions que permet accedir a les dades i operar amb elles (creació, modificació, eliminació...) així com atendre les sol·licituds d'accés a la base de dades que fan els usuaris i/o aplicacions a la base de dades. Els DBMS gestionen grans quantitats d’informació, garantint la seva fiabilitat.
#### IS (Information Systems, Sistemes d’Informació, SI)
Un sistema d'informació (*IS*, Information Systems) o SI, en canvi, és un sistema format per persones, dades, activitats, i en definitiva, el conjunt de recursos que processen la informació d'una organització. Els Sistemes d'Informació informàtics són el camp d'estudi de les Tecnologies de la Informació i la Comunicació (TIC).

``` 
Un _IS_ és diferent d'un _DBMS_ 
```

#### Evolució dels DBMS (database management systes)
![Esquema de l'evolució dels DBMS](images/evolucio_dbms.jpg)

### 3. Representació de les dades
Organitzem el nostre entorn en “mons”:
- el **món real**: constituït pels objectes (materials o no) de la realitat que ens interessen i amb els quals haurem de treballar
- el **món conceptual**: conjunt de coneixements o informacions obtinguts mitjançant l’observació de la part del món real que ens interessa
- el **món de les representacions**: format per les representacions informàtiques, o dades, del món conceptual, necessàries per poder treballar

#### Conceptualització del nostre entorn 
![Esquema dels 3 mons](images/conceptualitzacio_entorn.png)

No podem transformar les observacions del món real en dades informàtiques de manera automàtica, així que cal seguir el procés de disseny següent:
- **fase de disseny lògic**: es treballa amb el model abstracte de dades resultant de finalitzar l’etapa de disseny conceptual, per tal de traduir-ho al model de dades utilitzat pel DBMS amb el qual es vol implementar i mantenir la futura DB.
- **fase de disseny físic**: optimització de l’esquema lògic obtingut en la fase de disseny anterior, per tal d’incrementar l’eficiència en algunes de les operacions a fer amb les dades.

La informació és la conceptualització obtinguda a partir de l’observació del *món real*. Es caracteritza, fonamentalment, per tres elements: entitats, atributs i valors. 
- Les *entitats* són els objectes del món real que conceptualitzem. Són identificables, és a dir, distingibles els uns dels altres. I ens interessen algunes (com a mínim una) de les seves propietats (atributs).
Exemple: Cotxe, Alumne, Banc, Moble
- Els *atributs* són les propietats que ens interessen de les entitats. 
Exemple: color, edat, oficina, material
- Els *valors* són els continguts concrets dels atributs, les determinacions concretes que assoleixen.
Exemple: vermell, 17, BCN-003, fusta

```
A més dels tres elements bàsics que caracteritzen la informació (entitats, atributs i valors), cal tenir en compte el factor cronològic, ja que la informació no és independent del temps.
```

##### Entitats
Quan parlem d’una entitat, cal diferenciar entre **entitat tipus** i **entitat instància**.
- **entitat tipus (_template_)**: tipus genèric d’entitat (abstracció), que fa referència a una classe de coses (cotxe, arbre, alumne,...)
- **entitat instància**: conceptualització d’un objecte concret del món real (Ford Mustang Vermell), distingible dels altres objectes del mateix tipus, gràcies a alguna propietat (com podria ser el valor de l’atribut matrícula).

##### Atributs
Tal i com hem dit, els atributs són les propietats que ens interessen de les entitats que hem de modelar. Aquestes propietats poden tenir valors diferents i es poden realitzar una sèrie d’operacions entre aquests valors (calcular edats, comparar salaris, …).

Un **tipus de dada** defineix un conjunt de valors amb unes característiques comunes que els fan compatibles, per la qual cosa també defineix una sèrie d’operacions admissibles sobre aquests valors. Exemple: enters, caràcters, booleans,...

Perquè un valor d’un atribut sigui vàlid, ha de pertànyer al conjunt de valors acceptables per a l’atribut en qüestió. Aquest conjunt de valors vàlids s’anomena **domini**. Un domini pot ser predefinit (enters, reals,...) o definit per l’usuari (rang d’edat).

De vegades, el valor d’un atribut és desconegut o, fins i tot, no existeix. El **valor nul** indica que no hi ha cap valor associat a un atribut determinat d’una entitat instància concreta.

Un **atribut identificador** és el que permet distingir inequívocament cada entitat instància de la resta. En ser un valor és únic, aquest no es repeteix en les diferents entitats instància. Tot atribut o conjunt d’atributs que permeten identificar una entitat tipus rep el nom de **clau**.

#### Representacions informàtiques

Recordem que una *dada* és una representació simbòlica (numèrica, alfabètica, …) d'una característica d’una entitat (objecte de la vida real). Per tal de processar i analitzar un conjunt de dades, hi ha diversos tipus de representació. La forma més habitual és la **representació tabular**.

![Representació tabular de l'entitat Notes](images/representacio_tabular.jpg)

Cada taula representa una entitat tipus, i està estructurada en files (agrupacions horitzontals de cel·les) i columnes (agrupacions verticals de cel·les):
- cada fila representa una entitat instància (*registre*).
- cada columna representa un atribut (*camp*).
- cada cel·la (cada intersecció d'una fila i d'una columna) emmagatzema el *valor* que tingui l'atribut de l'entitat instància corresponent.

A més de poder emmagatzemar les dades, caldrà poder accedir i operar amb elles. Bàsicament, hi ha dues maneres d'accedir a les dades:
- L'**accés seqüencial** a un registre determinat, que implica l'accés previ a tots els registres anteriors.
- L'**accés directe** a un registre concret, que implica l'obtenció directa del registre desitjat.

A més, hi ha una altra classificació habitual de tipologies d'accessos:
- L'**accés per valor**, que permet l'obtenció del registre desitjat en funció del valor d'algun (o alguns) dels seus camps, sense considerar la posició que ocupa el registre.
- L'**accés per posició**, que obre l'accés a un registre que ocupa una posició determinada, sense considerar el contingut del registre.

Les quatre tipologies d'accés a dades més freqüents:
- **SP** (*accés seqüencial per posició*): un cop s’ha accedit a un registre que es troba en una posició determinada, s'accedeix al registre que ocupa la posició immediatament posterior.
- **DP** (*accés directe per posició*): s'obté directament un registre pel fet d'ocupar una posició determinada.
- **SV** (*accés seqüencial per valor*): un cop s’ha accedit a un registre que té un valor concret, s'accedeix al registre que ocupa la posició immediatament posterior, segons l'ordenació establerta a partir un camp determinat (o més). L'ordre serà creixent o decreixent, si es tracta d'un camp numèric, o alfabètic ascendent o descendent, si es tracta d'un camp de caràcters.
- **DV** (*accés directe per valor*): s'obté directament un registre pel fet de tenir un valor determinat en un dels seus atributs (o més).

|				 | P - posició | V - valor  |
| -------------- | ----------- | -----------
| S - seqüencial | SP 		   | SV			|
| D - directe    | DP          | DV			|


### Bibliografia

- [**Fundamentos de bases de datos. SILBERSCHATZ, KORTH, SUDARSHAN. 6ª Edición. McGrawHill Education**](https://www.casadellibro.com/libro-fundamentos-de-bases-de-datos/9788448190330/2303933)
- [**Bases de dades. Planas, Jaume Sistac. Edicions de la Universitat Oberta de catalunya, 1a Edició (2000)**](https://www.editorialuoc.cat/bases-de-dades)
