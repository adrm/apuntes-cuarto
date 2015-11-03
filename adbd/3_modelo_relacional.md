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
<!-- Diapositiva 5 -->
