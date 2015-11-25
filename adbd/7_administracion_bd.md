# Diseño de Bases de datos: Introducción a la administración de BD ([PDF](originales/07-abd.pdf))
## Tipos de usuarios
Hay distintos tipos de usuarios de una base de datos con distintas responsabilidades y competencias.

Un **usuario de BD** interactúa con la BD a través de aplicaciones.

Un **desarrollador de aplicaciones** diseña y desarrolla la aplicación incluyendo la estructura de la base de datos. Estima requisitos de almacenamiento, eficiencia, seguridad, etc.

El **administrador de la BD** (DBA) instala y actualiza el DBMS y las herramientas asociadas. Establece y reserva el sistema de almacenamiento. Crea los objetos primarios (tablas, vistas, índices) una vez que los desarrolladores han realizado el diseño.

<!-- TODO -->

## Tareas típicas
## Metadatos
## Concurrencia y transacciones
## Recuperación
## Optimización
La optimización es vital porque define el rendimiento de las aplicaciones, y sabemos que este valor es crucial para la experiencia del usuario.

El SGBD puede realizar algunas optimizaciones que pueden reducir mucho el coste. Por ejemplo, normalmente las queries SQL se optimizan antes de ser ejecutadas, y si se necesita un rendimiento mayor para algunas consultas habituales se pueden generar índices.

## Diseño físico
Se puede decidir en qué tipo de estructura de datos queremos que se almacene cada tabla (normalmente, en MySQL no es tan flexible como en Oracle, por ejemplo).

### Secuenciales
Es una estructura de $n$ registros almacenados uno detrás de otro en bloques con $b$ registros.

Operación | Coste
----------|--------
Búsqueda  | Todo el fichero: $O(n/b)$
Inserción | En el último bloque si hay espacio
Borrado   |  Deja un espacio libre en el bloque y hay que recolectar basura
Modificación | ¿?

### Indexados
Para solucionar los problemas de la estructura secuencial, creo un índice  que apunta a la estructura secuencial para ayudar con la búsqueda.

En la búsqueda no densa, el índice apunta al primer registro de cada bloque. Si hay muchos cambios podría ser que el primer registro del bloque cambie y haya que reindexar.

Operación | Coste
--------- | -----
Búsqueda | Binaria ($O(log(n))$) + localización en el bloque.

### Árboles B
Es un árbol dirigido balanceado. La mejora respecto al índice es que la búsqueda no es binaria sino $O(log(k))$, y se puede conseguir un $k$ más alto haciendo niveles anchos. Es una estructura muy usada, y suele ser la usada por defecto en los SGBD.

### Dispersión
Se calcula la posición del registro a partir de la clave. Como suele haber más datos que espacio de memoria, se tienen que permitir colisiones. Si se produce una colisión, o se enlaza en ese campo otro campo a mayores, o se guarda en otro sitio.

Para evitar colisiones hay que mantener la estructura poco llena, ocupando mucho espacio. Aparte de estos problemas, la dispersión exige que se proporcione la clave completa y no solo una fracción, como sí permiten las otras estructuras. Eso permite cosas como búsquedas por rango, etc.

## Índices secundarios
