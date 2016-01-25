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

Los elementos que conforman la línea base solo se pueden cambiar mediante procedimientos formales de control. Algunos ejemplos son:

- Funcional: requisitos del sistema revisados.
- Reservada: especificación de requisitos de software y de interfaz aprobados.
- De desarrollo: configuración de evolución del software en instantes determinados del ciclo de vida.
- Producto: el producto completo entregado para la integración del sistema.

#### Establecimiento de líneas base
Las líneas base serán hitos o marcas en el proceso de desarrollo. Las principales están marcadas por el ciclo de vida y metodología seleccionada. Hay dos objetivos fundamentales: identificar los productos de las fases del ciclo de vida y garantizar que las fases se van completando.

Las líneas base principales son las de función o definición, de distribución o asignación de funciones, de diseño preliminar, de diseño, de producto o de operación.

### Workspace
Un **workspace** puede ser un directorio local bajo control de versiones o puede estar en un servidor. Las operaciones habituales sobre un workspace son importar (incluir recursos en el control de versiones en el almacén), actualizar (conseguir la última versión en la rama por defecto), checkout (volcar una versión del almacén en el espacio de trabajo) y checkin (consolidar los cambios en el almacén).

### Almacén o repositorio
Un **almacén o repositorio** almacena versiones. Es habitual centralizarlo en un sistema, denominando repositorio al almacén central. El repositorio permite ahorrar espacio evitando guardar duplicados comunes a varias versiones o configuraciones, y facilita la posibilidad de almcenar la evolución del sistema. No es lo mismo repositorio que línea base.

### Base de datos de configuraciones
La **base de datos de configuraciones** se utiliza para registrar cualquier información relevante relacionada con las configuraciones de software, no solo las versiones. Facilita el conocimiento sobre la evolución del cambio y el impacto del mismo. Debe responder preguntas como qué clientes disponen de una versión concreta del sistema software, infraestructura de hardware y software necesaria para una versión, cuántas versiones se han creado y cuándo, qué versiones podrían verse afectadas ante un cambio en un componente, cuántas peticiones de cambio se han hecho sobre una determinada versión, o cuántos fallos registrados existen sobre una versión. Esta base de datos se puede crear como un sistema separado, o bien integrada con el sistema de gestión de versiones de software y el de control sobre los documentos formales del proyecto.

### Bibliotecas de software
Las bibliotecas de software son colecciones de software y/o documentación relacionada cuyo objetivo es ayudar en el desarrollo y mejorar la visibilidad del sistema. Algunos tipos de bibliotecas son de trabajo, de intergración, de producción, soporte o proyecto, maestra, de software o repositorio, o de backup.

### Modelos de control de versiones
El problema del trabajo colaborativo es que dos personas pueden leer una versión, modificarla de forma separada, y que en el repositorio la última persona sobreescriba la versión de la primera sin darse cuenta.

Para solucionarlo hay varios modelos. En el pesimista, se bloquea un fichero concreto para una persona hasta que termina de editarlo. En el optimista, se detecta si se intenta actualizar el repositorio desde una versión antigua, se hace una mezcla de las diferencias y se genera una nueva versión para evitar sobreescribir.

### Control de cambios
El control de cambios es la actividad de gestión de configuraciones software que perite gestionar adecuadamente los cambios. Es la tarea de GCS más importante. Normalmente se combinan procedimientos humanos con el uso de herramientas automáticas.

Hay varios niveles de control de cambios, que puede ser informal si el elemento de configuración no forma parte de la línea base y no afecta a ningún otro EC, semiformal si el EC forma pate de una línea base o no pero afecta a otros que sí forman parte de una línea base, o formal si el EC forma parte de la bibliotrca maestra.

Hay que crear un comité de control de cambios formado por los encargados de tomar decisiones acerca del estado y las prioridades de cambio formado por todos los miembros del proyecto, el jefe de proyecto y el bibliotecario.

Hay que describir el mecanismo para solicitar el cambio. Normalmente se hace con un formulario de solicitud lo más sencillo posible que contemple por qué se solicita el cambio, quién lo solicita, qué hay que cambiar, una estimación de daños, los elementos afectados y la aprobación del cambio.

El comité de control de cambios decide si se acepta o no el cambio en función del valor del cambio para la organización, el retorno de la inversión, el tamaño del cambio, la complejidad, los recursos disponibles para efectuar el cambio y otros factores.

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

### Identificación de la configuración
Refleja la estructura del producto, identifica sus componentes y su tipo, haciendo que todos ellos sean considerados como un todo y accesibles de alguna forma.

- Establecimiento de una jerarquía preliminar del producto: primera visión de la estructura y los elementos que tendrá el sistema software.
- Selección de los ECs y los niveles de control para cada uno de ellos: tener demasiados puede prvocar un exceso de cosas bajo control pudiendo llevar a ralentizar excesivamente el proceso, tener pocos puede producir falta de visibilidad sobre el producto.

Algunos de los criterios usados para seleccionar ECs son el número de personas que lo van a usar, cómo es de crítico, o si se trata de un EC que va a ser reutilizado o está siendo reutilizado desde otra aplicación. Cualquier entidad no necesita ser configurada necesariamente todo el tiempo. Hay que decidir qué debe ser identificado como un EC y cuándo colocarlo bajo control.

Aparece el dilema: si se empieza demasiado pronto se introduce mucha burocracia, pero si se empieza demasiado tarde se produce caos.

### Definición de relaciones
Es la actividad encargada de relacionar los ECs previamente identificados.

- Equivalencia: un mismo EC puede estar en distintos soportes pero su contenido ser el mismo.
- Dependencia: el modelo de procesos depende del modelo de datos y esta relación es de doble sentido.
- Derivación: normalmente se pueden identificar entre elementos que tienen un orden cronológico. El diseño de un sistema software deriva del análisis del mismo.
- Sucesión: describe la historia de cambios sobre un EC de una revisión a otra.
- Variante: variaciones sobre un mismo.
- Composición.
- Ser traza de.

### Esquema de identificación
Proporciona un identificador únívoco para cada EC. Se pueden cosiderar dos tipos: identificación significativa si proporciona información adicional, como la matrícula antigua que daba dónde se había matriculado el coche; o no significativa, como el DNI.

Un esquema de identificación debe proporcionar el código, nombre y descripción del EC, fecha de creación, proyecto al que pertenece, línea base a la que pertenece, y tipo de EC.

### Auditoría de configuración
Tiene como objetivo verificar que el producto de software integrado satisface los requisitos estándares o acuerdos contractuales y que los componentes que se integran se corresponden con las versiones vigentes. Trata de garantizar que el cambio se ha realizado adecuadamente. Está relacionada con la garantía de calidad de software.

Trata de verificar que todos los productos software han sido producidos, descritos e identificados correctamente y que todas las solicitudes de cambio han sido procesadas. Debe responder a preguntas como ¿se ha hecho el cambio especificado?, ¿se han seguido los estándares establecidos?, ¿se han seguido procedimientos para solicitar el cambio, registrarlo y comunicarlo?, ¿se han actualizado adecuadamente todos los EC relacionados?, ¿se ha especificado la fecha de cambio y el autor del mismo? o ¿se ha seguido el procedimiento establecido para señalar el cambio, registrarlo y difundirlo?

Además de otras, se realizan auditorías de línea base al final de cada fase del ciclo de vida o al final de cada nueva entrega. También hay auditorías de configuración funcional y física. Las realiza el personal dedicado a gestión de configuraciones o personal asignado del equiipo. Normalmente las auditorías son revisadas por el ingeniero de calidad de software. Las auditorías de línea base verifican su contenido, comprobando que se usan versiones correctas de los EC para construir la línea base o que la versión de la documentación correcta es la incluida.

### Generación de informes de estado
Algunos informes que se pueden obtener son:

- Estado de los cambios propuestos.
- Estado de los cambios aprobados.
- Agendas del comité de control de cambios y actas de las reuniones.
- Progreso de la versión actual hacia adelante o hacia atrás.
- Estimación de los recursos para finalizar una tarea.
- Errores identificados por la auditoría de configuración.

### Plan de gestión de configuraciones
Hay que determinar qé elementos se considerarán, quién será responsable de qué actividades, cómo se llevará a cabo, qué información mantener, qué recursos se precisan y cuántos, y qué métricas utilizar para medir el progreso y el éxito.

Algunos criterios a la hora de seleccionar la herramienta de gestión de configuraciones son:

- Soporte multiusuario
- Interfaz de usuario intuitiva
- Adecuación al entorno de desarrollo de la organización
- Escalabilidad
- Flexibilidad para integrarse con otras herramientas de software
- Entorno
- Facilidad de instalar y configurar
- Permitir el uso de modelos de proceso modificables
- Gestión del proceso
- Soporte exhaustivo para la fase de desarrollo
- Gestión de objetos que no son código
- Gestión de permisos

<!-- TODO reorganizar y reestructurar todo -->
