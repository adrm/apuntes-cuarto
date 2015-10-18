

# 1. Introducción
## 1.1. Información y datos
La información es valor que se extrae de los datos. Mucho software se dedica a gestionar datos. Esto es complicado debido a la cantidad de datos y a la complejidad de las relaciones entre estos datos.

> Por ejemplo, en una compañía telefónica gestionan, referido a la cantidad, datos sobre millones de llamadas, de clientes, tarifas, _tickets_...; y, referido a la complejidad, gestionan una gran cantidad de condiciones de tarificación como pueden ser fijo/móvil, horario, planes, roaming, datos, etc.

## 1.2. Base de datos (BD)
Una BD es una **colección organizada de datos** que **modela aspectos relevantes de la realidad**  y **da soporte a procesos de información**.

Un sistema gestor de BD (SGBD) es un **sistema de software que gestiona los datos** (MySQL, Redis, etc).

Las BD se diseñan, y los SGBDs se usan.

## 1.3. Gestión de datos
La gestión de datos involucra: almacenamiento, extracción, modificación, borrado, búsqueda, seguridad, integridad, compartición, etc.

Puede usarse un **modelo relacional en el que los datos se describen como tablas relacionadas**. Hay más modelos, cada uno con sus ventajas e inconvenientes.

Existe una excesiva orientación hacia el almacenamiento. <!-- ¿Qué quiere decir con esto? -->

## 1.4. Almacenamiento vs BD
1. Hardware
  - Visión demasiado hardware.
  - En último término, los datos tienen que ser almacenados así.
  - Persistencia de los datos (¿Qué se hace con los no persistentes?).

2. Físico
  - Datos de bajo nivel pero con forma de estructura de datos (lista encadenada).
  - Archivo en memoria secundaria.
  - La estructura de datos me da una forma de acceso.
  - Puedo servirme del sistema de archivos del SO.

- Lógico
  - Comprensible por agrupación de columnas.
  - Tiene estructura de tabla basada en entidades, relaciones y propiedades
  - La tabla no es una estructura de datos, aunque el fichero secuencial sí que lo es.
  - Problemas para almacenar todo en una sola tabla (Añadir las pruebas que se realizan a cada paciente).
  - Las líneas 1 a 3 son especiales (nombre del fichero, formato, esquema de los datos - Datos pacientes, CSV, nombre apellidos etc)

    > Grupo repetitivo: Almacenaje de un número indeterminado de valores del mismo tipo en una sola casilla de la tabla.

- Conceptual
  - Modelado de los conceptos que describen una organización en base a los datos que gestiona.
  - Visión global de alto nivel, basada en entidades, relaciones y propiedades o en clasificadores, asociaciones y atributos.
  - No se ven las instancias de los datos.
  - Confusión entre modelos/esquemas/diseños conceptuales y lógicos.

## 1.5. Sistemas de archivos
Los sistemas de archivos plantean varios problemas:

Estructura de almacenamiento: enormes volúmenes de datos. Compartición o replicación. Identificación o indexación de los datos.

Programas de acceso a los datos: Complejidad de las consultas y actualizaciones. Comprobaciones de integridad (en cada uno). Consistencia de accesos concurrentes. Consistencia ante fallos.

Seguridad: Directivas de seguridad para distintos accesos.

## 1.6. Sistemas de BDs
Las BDs dan respuesta completa y eficaz a los problemas descritos anteriormente..
1. Independencia lógica-física:
  - El usuario trata los datos a nivel lógico-conceptual, e internamente se puede cambiar el nivel físico. El usuario vería los datos igual, manteniendo intactas las aplicaciones.
  - La traducción la hace automáticamente el SGBD, manteniendo ocultos los detalles.
  - Facilita el cambio y mantenimiento haciendo eficiente el acceso a datos.

2. Integridad y seguridad de los datos:
  - El SGBD asegura las restricciones de integridad, en vez de los múltiples programas que acceden a los datos.
  - Se puede controlar los datos que son accesibles a cada usuario.

3. Centralización de los datos:
  - Minimiza redundancia, evitando inconsistencias.

4. Acceso concurrente y recuperación.
5. Reducción del tiempo de desarrollo y mantenimiento de aplicaciones.

## 1.7 Niveles de abstracción
<!-- Hasta diapo 5 - álgebra relacional -->
