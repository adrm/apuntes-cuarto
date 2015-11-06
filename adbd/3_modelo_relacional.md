# 3. Modelo relacional
## Origen e importancia
Se plantea como un sistema sencillo y potente formado por una BD como conjunto de tablas con filas y columnas, con las tablas asociadas entre sí.

El modelo relacional se origina en los 70, sustituyendo a otros modelos como el jerárquico o en red. Es el modelo más ampliamente utilizado por la sencilla representación de los datos y la facilidad para formular consultas. Hay todo un ecosistema de RDBMS de diversas empresas.

Hay otros modelos competidores como el modelo objeto-relacional o la renovación de "viejas ideas" como los datos jerárquicos.

Un lenguaje relacional permite la definición (DDL) y la manipulación (DML) de los datos. El modelo soporta consultas sencillas y potentes con una **semántica precisa de consulta relacional**. El DBMS optimiza las operaciones.

El estándar SQL ha ido evolucionando. Son reseñables SQL-92, que supuso una importante revisión, y SQL-99, que añade extensiones importantes y es el estándar actual.

## Definiciones
Una base de datos relacional está compuesta de relaciones.

Una relación está compuesta de dos partes. Por un lado, un esquema que define el nombre de la relación y el nombre y tipo de cada columna (atributo, campo). Por otro lado, instancias que corresponden con valores de la tabla (registro, tupla) con todas las tuplas distintas<!-- TODO ¿Todas las tuplas distintas?-->.

## Creación de relaciones
Hay que crear la relación (tabla) con sus atributos, especificando los tipos para cada campo. El tipado se impone por el DBMS al añadir o modificar tuplas.

Es habitual la existencia de diversas tablas que estarán eventualmente relacionadas.

Ejemplo de creación de tablas:

```sql
CREATE TABLE Estudiante (
	nia INTEGER,
	nombre CHAR(20),
	login CHAR(10),
	edad INTEGER,
	notam REAL
)

CREATE TABLE Matricula (
	nia INTEGER,
	cod CHAR(20),
	nota REAL
)
```

## Destrucción y modificación
La destrucción de una relación implica su borrado del esquema y el borrado de todas su tuplas.

```sql
DROP TABLE Estudiante
```

La modificación de un esquema se puede hacer añadiendo, borrando o modificando campos. Para campos añadidos, todas las tuplas son extendidas con valor ```null``` en ese campo.

```sql
ALTER TABLE Estudiante
	ADD COLUMN matr DATE
```

## Añadir, borrar y modificar tuplas
Se puede insertar una tupla en la relación:

```sql
INSERT INTO Estudiante (nia, nombre, login, edad, notam)
	VALUES (5557, 'Rojo', 'rojo@cie', 23, 8.0)
```

El borrado se realiza indicando la condición que cumplirán todas las tuplas a ser borradas:

```sql
DELETE FROM Estudiante E WHERE E.nombre='Ledesma'
```

La modificación se realiza igualmente con una condición de selección de tuplas:

```sql
UPDATE Estudiante E SET E.edad=E.edad+1 WHERE E.nia=5557
```

## Restricciones de integridad
Las restricciones de integridad son condiciones de validez que tienen que cumplirse para cualquier instancia de la base de datos. Se especifican al definir el esquema y el DBMS las comprueba cuando se modifican las relaciones.

Una **instancia legal** es aquella que satisface todas las restricciones de integridad (RI).

En las RI se usa la semántica del mundo real descrito. Dominio, clave primaria, clave foránea. También se soportan otras más generales. <!--TODO No entiendo este párrafo -->

## Claves primarias y candidatas
Una clave (candidata) <!-- TODO ¿Diferencias entre clave primaria y candidata? ¿Qué es una clave candidata? -->es una identificación única de cada tupla por medio de un subconjunto mínimo de campos.

Las claves primarias fuerzan ciertas condiciones. No existen dos tuplas con los mismos valores en todos los campos de la clave (a tener en cuenta para valores ```null```), y ningún subconjunto de la clave puede ser un identificador único.

Una candidata debe ser elegida como clave primaria. <!--TODO Expandir un poco aquí -->

Las claves candidatas se especifican con ```UNIQUE```, y la que es elegida como primaria, con ```PRIMARY KEY```.

```sql
CREATE TABLE Matricula (
	nia	INTEGER,
	cod	CHAR(20),
	nota	REAL,
	PRIMARY KEY (nia, cod)
)

CREATE TABLE Estudiante (
	nia	INTEGER,
	nombre	CHAR(20),
	login	CHAR(10),
	edad	INTEGER,
	notam	REAL,
	UNIQUE (nombre, edad),
	CONSTRAINT claveEst PRIMARY KEY (nia)
)
```

En el ejemplo anterior se le da nombre a la restricción para identificar errores más fácilmente.

## Claves foráneas, integridad referencial
Una clave foránea (o externa) es un conjunto de campos en una relación que sirven para referenciar tuplas en otra relación. La referenciada debe ser una clave primaria para asegurar que solo se hace referencia a una única tupla.

La **integridad referencial** se refiere a la imposición de las restriciones referenciales. Por ejemplo: solo los estudiantes listados en Estudiante son admitidos en la Matrícula de cursos.

```sql
CREATE TABLE Matricula (
	nia	INTEGER,
	cod	CHAR(20),
	nota	REAL,
	PRIMARY KEY (nia, cod),
	FOREIGN KEY (nia) REFERENCES Estudiante
)
```

Una clave foránea puede hacer referencia a la misma relación en la que se encuentra. El ```null``` cumple la restricción de clave foránea pero no la de clave primaria.

## Cumplimiento de la integridad referencial
Para cumplir la integridad referencial, hay que decidir qué hacer en cada caso cuando ésta pueda incumplirse.

En inserción con una referencia no existente, se realiza ```NO ACTION```, es decir, se rechaza la inserción de la nueva tupla si tiene una referencia en una clave foránea que referencia a una tupla que no existe.

En el borrado de una tupla referenciada hay varias opciones:

- ```NO ACTION```: Acción por defecto. Rechaza el borrado de la tupla referenciada si tiene referencias. (No se borra el estudiante hasta que no tenga matrículas que le hagan referencia)
- ```CASCADE```: Se borra la tupla referenciada y todas aquellas que le referencian (se borra el estudiante y todas sus matrículas).
- ```SET DEFAULT```: Se asignan las referencias a la tupla que se borra a una clave por defecto (al borrar el estudiante, sus matrículas pasan a referenciar un ```nia``` por defecto).
- ```SET NULL``` (en SQL)<!--TODO ¿Esto quiere decir que está en el estándar pero no en MySQL? -->: Al borrar la tupla referenciada, las referencias apuntan a ```null```. Puede dar conflictos si la referencia (la clave foránea) se usa dentro de la clave primaria.

En la actualización de la clave primaria se actúa igual. <!-- TODO Igual que qué, que en el borrado de tupla referenciada? -->

```sql
CREATE TABLE Matricula (
	nia	INTEGER,
	cod	CHAR(20),
	nota	REAL,
	PRIMARY KEY (nia, cod),
	FOREIGN KEY (nia) REFERENCES Estudiante
		ON DELETE CASCADE
		ON UPDATE SET DEFAULT
)
```

La acción 'cascade' se propaga en cascada por las siguientes realciones que referencian a la tupla borrada o actualizada.

## Otras restricciones
Restricciones de columna, que pueden ser ```NOT NULL```, que evita que se asignen nulos a la columna, o ```CHECK```, que especifica una condición de integridad.

```sql
CREATE TABLE Estudiante (
	nia	INTEGER,
	nombre	CHAR(20),
	login	CHAR(10),
	edad	INTEGER,
	notam	REAL NOT NULL,
	UNIQUE (nombre, edad),
	CONSTRAINT claveEst PRIMARY KEY (nia),
	CONSTRAINT notampos CHECK (notam>=0)
)
```

Otras restricciones son las aserciones y disipadores, que se verán más adelante.

## Diseño lógico: ER -> Relacional
ERD

ER

SQL
<!-- Diapositiva 16: Aclarar esto -->

## Tipos de relación -> tablas
Si la relación es `1-1`, comprobamos si se pueden poner en términos de una única entidad.

Si la relación es `1-*`, referenciamos en el lado `*` el valor único del lado `1`.

Si la relación es `*-*`, habría que representar la relación como una nueva entidad que se relaciona con los dos extremos, siendo la nueva entidad el lado `1` en las dos nuevas relaciones creadas.

## Traducción de la opcionalidad
Si la relación tiene `0` en algún extremo supone que pueden existir nulos.

## Entidades débiles
