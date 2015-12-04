# Gestión de configuraciones de software
## Conceptos generales
El crecimiento de los sistemas implica un descenso de la productividad, aumento de la complejidad, incremento del número de participantes, artefactos independientes entre sí, peor comunicación, desorden, y cambios consSegtantes. Por ello, es preciso acompañar los desarrollos con algún mecanismo que permita frenar o atenuar los efectos de todo eso.

La gestión de configuraciones de software es una disciplina cuya misión es controlar la evolución de un sistema.

Según [BABI86]:

> El arte de identificar, coordinar y controlar las modificaciones del software construido por un equipo de programación.

> En una frase, el arte de coordinar un proyecto para minimizar la confusión.

Según [WHIT91]:

> Colección de técnicas que sirven para coordinar y controlar la construcción de software.

Según [BERS84]:

> Proceso software para controlar los cambios sistemáticamente y mantener la integridad a lo largo del ciclo de vida.

Es la identificación unívoca, almacenamiento controlado, control del cambio e información sobre el estado de los elementos seleccionados de cualquier tipo de artefacto producido durante el ciclo de vida.

Su propósito es mantener la integridad de los productos cuando éstos evolucionan a través de sus ciclos de vida de desarrollo y producción.

Según el glosario de la IEEE:

> [La GCS sirve para] identificar y documentar las características funcionales y físicas de un elemento de configuración, controlar los cambios en dichas características, registrar e informar del proceso de cambios y el estado de la implementación, y verificar la conformidad con los requisitos especificados.

La GCS no es únicamente control de versiones, no se aplica solo a la gestión de código fuente y no es únicamente para la fase de desarrollo. Seleccionar y utilizar herramientas es importante, pero el diseño y la gestión del proceso de GCS son cruciales para el éxito de los proyectos.

La GCS es una actividad de garantía de calidad del softwre que se aplica en todas las fases del proyecto de ingeniería del sofware, incluída la planificación.

La GCS debería poder responder a preguntas como ¿quién hace los cambios?, ¿qué cambios se realizan?, ¿cuándo se hacen los cambios? o ¿por qué se hacen los cambios?. Esto se implementa normalmente con solicitudes de integración que llevan la respuesta a estas preguntas asociada a cada conjunto de cambios.

En el proceso de gestión de configuraciones hay que especificar cómo se introducen elementos de gestión de configuraciones en el proyecto. Desde los procesos de desarrollo se envían solicitudes al proceso de gestión de configuraciones. Demasiadas solicitudes de cambio pueden saturar este proceso.

Un item de configuración primero es identificado, después se pasa a producción (se crea) y se almacena asociado a una versión. Cuando aparecen cambios se genera una solicitud de cambio controlada que genera una nueva implementación asociada a una nueva versión.

Este proceso debe poder generar informes sobre lo que se tardan en aceptar solicitudes de cambio, o en qué medida colabora cada uno de los miembros del equipo.

Algunos escenarios posibles que permite la GCS son:

- Ver versiones concretas de un fichero y el historial de cambios.
- Volver un fichero a una versión anterior.
- Conocer qué cambios pertenecen a una release.
- Trabajo coordinado de personas en remoto.
- Rastrear los cambios: cuáles han sido, quién los ha realizado y cuándo.
- Conseguir informes sobre el progreso del proyecto.

### Elementos de configuración
Un EC es un entregable (o artefacto según RUP) aprobado y aceptado para el que los cambios deben realizarse mediante un procedimiento formal. Algunos ejemplos son el plan de gestión, documento de requisitos, especificación de diseño, código fuente y ejecutable, etc.

Un EC se debe poder definir y controlar de forma separada.

A partir de esta definición, se puede ver la configuración del software como el conjunto de toda la información o productos que se utilizan o producen en el desarrollo de software, es decir, el conjunto de todos los EC del proyecto.

### Versión, variante y revisión
Una versión es un elemento de configuración en un punto de su desarrollo. Incluye una revisión y variante.

Una revisión es un elemento de configuración enlazado con otro mediante la relación "revisión de" y ordenado en el tiempo.

Una variante es una versión funcionalmente equivalente pero diseñada para distintas características de hardware o software (arquitecturas, etc).

Una rama es una secuencia de versiones en una línea temporal.

Una gestión de configuraciones elemental debería ser capaz de gestionar las versiones (posibilidad de recuperar versiones antiguas) y de gestionar las releases. Una release es una lista de versiones concretas de cada archivo.

Las revisiones de un componente pueden ser lineales, pero suelen ir hacia una estructura arbórea. En el tronco quedan las variantes principales. Del tronco salen distintas ramas. Los cambios de una versión a la anterior se denominan "deltas". Los deltas pueden ser directos si van de una versión a la siguiente, o inversos si van de una versión a la anterior.

### Línea base
Punto de referencia o configuración de referencia en el proceso de desarrollo del software. Es un conjunto de elementos revisados formalmente y fijados en un momento determinado del ciclo de vida del software. Su objetivo es permitir cambios rápidos e informales sobre los EC antes de que formen parte de la línea base y cambios formales una vez formen parte de ésta.

Es una colección de versiones de elementos que han sido revisadas formalmente y conforman una versión de configuración. Marca hitos y sirve como una base para otros desarrollos. Solo se puede cambiar mediante un proceso formalizado de gestión de cambio. Una línea base más un conjunto de cambios crean nuevas líneas base. Una línea base es un entorno aislado en el que un desarrollador puede trabajar (editar, cambiar, compilar y probar) sin interferir con otros desarrolladores.

Un **workspace** puede ser un directorio local bajo control de versiones o puede estar en un servidor. Las operaciones habituales sobre un workspace son importar (incluir recursos en el control de versiones en el almacén), actualizar (conseguir la última versión en la rama por defecto), checkout (volcar una versión del almacén en el espacio de trabajo) y checkin (consolidar los cambios en el almacén).

Un **almacén o repositorio** almacena versiones. Es habitual centralizarlo en un sistema, denominando repositorio al almacén central. El repositorio permite ahorrar espacio evitando guardar duplicados comunes a varias versiones o configuraciones, y facilita la posibilidad de almcenar la evolución del sistema. No es lo mismo repositorio que línea base.

La **base de datos de configuraciones** se utiliza para registrar cualquier información relevante relacionada con las configuraciones de software, no solo las versiones. Facilita el conocimiento sobre la evolución del cambio y el impacto del mismo. Debe responder preguntas como qué clientes disponen de una versión concreta del sistema software, infraestructura de hardware y software necesaria para una versión, cuántas versiones se han creado y cuándo, qué versiones podrían verse afectadas ante un cambio en un componente, cuántas peticiones de cambio se han hecho sobre una determinada versión, o cuántos fallos registrados existen sobre una versión. Esta base de datos se puede crear como un sistema separado, o bien integrada con el sistema de gestión de versiones de software y el de control sobre los documentos formales del proyecto.

### Modelos de control de versiones
El problema del trabajo colaborativo es que dos personas pueden leer una versión, modificarla de forma separada, y que en el repositorio la última persona sobreescriba la versión de la primera sin darse cuenta.

Para solucionarlo hay varios modelos. En el pesimista, se bloquea un fichero concreto para una persona hasta que termina de editarlo. En el optimista, se detecta si se intenta actualizar el repositorio desde una versión antigua, se hace una mezcla de las diferencias y se genera una nueva versión para evitar sobreescribir.

### GCS como actividad de garantía de calidad
La GCS es una actividad de garantía de calidad que se aplica en todas las fases del proceso de ingeniería de software.

Algunos beneficios son:

- Mejora la protección del producto.
- Mejora la visibilidad del producto.
- Mejora el control del producto.
- Mejora la comunicación del equipo.
- Mejora la confianza del usuario.
- Disminuye el "rework".
- Disminuye la confusión.
- Disminuye el riesgo del proyecto.

Algunas actividades son:

- Identificación de la configuración.
- Control de cambios en la configuración.
- Generación de informes de estado.
- Auditoría de la configuración.

Y algunos autores añaden:

- Gestión de releases.
- Planificación de la gestión de configuraciones.

### Aspectos a contemplar en el plan de gestión de configuraciones según Métrica 3
- Identificación de todos los productos que deben ser controlados, su clasificación y relaciones entre ellos, así como el criterio o norma de identificación.
- Ubicación y localización de los productos.
- Definición del ámbito y alcance del control de la configuración describiendo los procesos incluidos en él.
- Definición de las reglas de versionado de los productos y los criterios de actuación para cada caso, teniendo en cuenta el motivo por el cual se realiza el cambio de versión.
- Definición del ciclo de estados para cada tipo de producto y los criterios de trazabilidad entre los mismos.
- Descripción de funciones y responsabilidades.
- Identificación de la información necesaria de control para auditoría.
<!-- TODO Diapo 13/44 y reorganizar todo -->
