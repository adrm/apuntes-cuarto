# Tema 3: Proceso unificado (RUP)
## Introducción
El **Proceso Unificado (RUP)** es un proceso de desarrollo de software aunque según sus desarrolladores es todo un marco de trabajo genérico que puede especializarse para gran cantidad de sistemas software, diferentes áreas de aplicación, tipos de organizaciones, etc.

Está basado en componentes, lo que indica que el sistema a construir estará formado por componentes software interconectados a través de interfaces. Usa UML como lenguaje de modelado.

Los tres elementos clave que resumen el proceso unificado son:

- es dirigido por casos de uso,
- está centrado en la arquitectura,
- es iterativo e incremental.

Los objetivos de RUP son: proporcionar un marco de trabajo para gestionar proyectos software; proporcionar guías prácticas para planificar, gestionar el personal, ejecutar, realizar y seguir proyectos; y proporcionar un marco para gestionar riesgos. No cubre otras cosas como el reclutamiento, formación, etc. de personal; la gestión de presupuestos; o la gestión de contratos con proveedores y usuarios.

Está enfocado hacia un proceso de desarrollo iterativo, gestionando los riesgos, planificando el proyecto iterativo a través del ciclo de vida y planificando cada iteración particular, y monitorizando el progreso del proyecto iterativo obteniendo métricas.

El proceso de desarrollo de software debe estar adaptado al entorno, a las personas y a los objetivos de las organizaciones que lo utilizan. Ningún proceso puede ser adecuado a todas las organizaciones y por tanto un proceso debe ser adaptable y configurable.

Algunos factores que se deben tener en cuenta para la adaptación del proceso son el dominio de la aplicación, las personas y factores organizativos, los factores relacionados con el ciclo de vida del producto, o los factores de proceso como el cumplimiento de estándares.

El RUP consiste en una estructura estática de personas, actividades, artefactos y flujos de trabajo, y una estructra dinámica de ciclos, fases, iteraciones, hitos y relaciones entre ellos.

Una **actividad** es una unidad de trabajo que puede ejecutar uno o varios individuos en un rol específico. Tiene un propósito claro expresado en términos de actualizar un artefacto. La granularidad de una actividad es generalmente de horas o pocos días. Ejemplos son planificar una iteración, encontrar casos de uso y actores, o revisar el diseño.

Un **artefacto** es una pieza de información producida, modificada y utilizada en un proceso, un producto tangible del proyecto. Se utiliza por los roles como entrada para la realización de sus actividades, y también es el resultado de las actividades que realizan. En el metamodelo, la clase "rol" tiene como métodos las actividades y como parámetros los artefactos.

Un recurso humano puede desempeñar uno o más roles, que le permiten ejecutar las actividades asociadas a tales roles.

## Flujos de trabajo fundamentales
El ciclo de desarrollo del proceso unificado se divide en cuatro fases en las que los distintos flujos de trabajo se desarrollan con distinta intensidad. Cada fase está dividida en iteraciones. Estas cuatro fases son:

- Inicio (inception): define el ámbito del proyecto y desarrolla los casos de negocio. Define los objetivos.
- Elaboración: se elabora el plan de proyecto, se especifican las características y el marco de referencia de la arquitectura. Define la arquitectura.
- Construcción: se construye el proyecto. Define la funcionalidad inicial.
- Transición: se pasa el producto a los usuarios. Define la versión final del producto.

Al final de cada iteración se dispone de una nueva versión de los entregables.

Los flujos de trabajo de ingeniería o de proceso son:

- modelado de negocio,
- requisitos,
- análisis y diseño,
- implementación,
- prueba,
- lanzamiento.

Los flujos de trabajo de apoyo o accesorios son:

- gestión de configuración,
- gestión del proyecto,
- entorno.

Los casos de uso van progresando a través de las fases. Al terminar la fase de inicio, la mayoría del modelo de negocio ha sido terminado y la mayoría de los casos de uso han sido identificados. Muy pocos se describen, se analizan, y mucho menos se implementan. Al terminar la fase de elaboración el modelo de negocio está terminado, la inmensa mayoría de casos de usos han sido identificados y muchos de ellos han sido descritos. Algunos de ellos han sido analizados y apenas ninguno ha sido diseñado, implementado y probado. Al terminar la fase de construcción, todos los casos de usos tienen que haber sido identificados, descritos, analizados, diseñados, implementados y probados.

Beneficios del desarrollo iterativo:

- Se produce una mitigación, en las capas iniciales, de los riesgos más críticos (técnicos, requisitos, objetivos, facilidad de uso, etc.).
- El progreso es visible desde muy pronto.
- La realimentación temprana, la implicación del usuario y la adaptación conducen a un sistema refinado que satisface más estrechamente las necesidades reales de los "usuarios".
- La complejidad se gestiona, el equipo no se abruma por la "parálisis del análisis" o por etapas muy grandes y complejas.
- El aprendizaje que se va obteniendo en cada iteración se puede utilizar metódicamente para mejorar el proceso de desarrollo, iteración a iteración.

A medida que se avanza en el desarrollo de la ingeniería de software se debe definir un modelo de proceso para soportar una evolución de los planes, requisitos y arquitectura junto con puntos de sincronización bien definidos; una gestión de requisitos y medidas objetivas de progreso y calidad; y una evolución de las capacidades del sistema a través de demostraciones de funcionalidad incremental.

El ciclo de vida se divide en dos etapas. La etapa de ingeniería, con equipos más pequeños, es donde se realizan actividades menos previsibles de diseño y síntesis. La etapa de producción es donde se realizan las actividades más previsibles relacionadas con construcción, prueba y lanzamiento, en un equipo más grande.

Aspecto del ciclo de vida | Énfasis durante etapa de ingeniería | Énfasis durante etapa de producción
--- | ---- | ---
Reducción del riesgo  | Planificación, factibilidad técnica | Coste
Productos | Línea base de la arquitectura | Líneas base de entregas de producto
Actividades | Análisis, diseño, planificación | Implementación, pruebas
Valoración | Demostración, inspección, análisis | Pruebas
Economía | Resolución de la _diseconomía_ de escala | Explotación de la economía de escala
Gestión | Planificación | Operaciones

La transición entre ingeniería y producción es un evento crucial para los "stakeholders".

### Los diez puntos fundamentales del RUP

- Desarrollar una visión
- Gestionar el plan
- Identificar y mitigar los riesgos
- Asignar y seguir características
- Examinar los casos de negocio
- Diseñar una arquitectura de componentes
- Construir de forma iterativa e incremental y probar el producto
- Verificar y evaluar resultados
- Gestionar y controlar los cambios
- Proporcionar apoyo a los usuarios

### Modelos
Un modelo es una simplificación de la realidad con el objetivo de representar un sistema grande y complejo que sería difícil de comprender al considerarlo completamente. Un modelo no es la realidad sino una representación de ella. Un modelo único no puede cubrir todos los aspectos del desarrollo de software. Se necesitan múltiples modelos para cubrir todos ellos, coordinados de forma adecuada.

Los modelos son representaciones completas y consistentes del sistema a construir.

Partimos de un **modelo de casos** de uso que modela los casos de uso y sus relaciones con los actores. El modelo de casos de uso es especificado por un **modelo de análisis** que refina los casos de uso y realiza una visión inical del comportamiento del conjunto de objetos. Es realizado por un **modelo de diseño** que define la estructura estática del sistema como subsistemas, clases e interfaces y define los casos de uso como colaboraciones de subsistemas, clases e interfaces. Es implementado por un **modelo de implementación** que incluye componentes representados por su código fuente y la correspondencia entre clases y componentes. Es distribuido por un **modelo de despliegue** que define los nodos físicos y establece la correspondencia entre componentes y nodos. Es verificado por un **modelo de pruebas** que describe los casos de prueba que verifican los casos de uso.

### Fase de inicio
Objetivos principales:

- Establecer el ámbito y los límites del proyecto, incluyendo conceptos operativos y criterios de aceptación.
- Localizar los casos de uso críticos y los escenarios principales que dirigirán los objetivos fundamentales del diseño.
- Comprobar al menos una arquitectura candidata frente a algunos de los escenarios principales.
- Estimar el coste completo y la planificación temporal del proyecto completo.
- Estimar los riesgos potenciales.

Actividades esenciales:

- Formular el ámbito del proyecto.
- Sintetizar la arquitectura.
- Planificar y preparar un caso de negocio.

Algunos criterios de evaluación:

- ¿Coinciden los "usuarios" con la definición del ámbito y las estimaciones de coste y tiempo?
- ¿Se han entendido totalmente los requisitos?
- ¿Son creíbles dichas estimaciones, así como las prioridades, los riesgos y el proceso de desarrollo?
- ¿La profundidad y amplitud del prototipo arquitectónico demuestran el criterio precedente?

De no cumplirse los criterios de evaluación habrá que replantear aquellos elementos que no se han conseguido satisfacer en los puntos anteriores.

En la fase de inicio se establece la oportunidad y alcance del proyecto, incluyendo conceptos operativos y criterios de aceptación. También se identifican todos los actores externos con los que se tratan y se define la interacción a un alto nivel de abstracción, identificando todos los casos de uso y localizando aquellos que son críticos y los escenarios principales que dirigirán los objetivos fundamentales del diseño.

La oportunidad de negocio incluye criterios de éxito, identificación de riesgos, estimación de recursos necesarios, y plan de las fases incluyendo hitos.

Los productos resultantes de la fase de inicio son:

- Un documento de visión general con los requisitos generales del proyecto, las características principales y las restricciones.
- Un modelo inicial de casos de uso con aproximadamente un 15% de ellos listos.
- Un glosario inicial con la terminología clave del dominio.
- Caso de negocio con un contexto, criterios de éxito y pronóstico financiero.
- Identificación inicial de riesgos.
- Plan de proyecto mostrando fases e iteraciones.
- Modelo de negocio si es necesario.
- Uno o más prototipos exploratorios para probar conceptos o la arquitectura candidata.

El hito que marca el fin de la fase de inicio debe suponer el acuerdo entre las partes interesadas sobre el alcance y la estimación de tiempo y coste, así como la comprensión de los requisitos plasmados en casos de uso.

### Fase de elaboración
Objetivos:

- Analizar el dominio del problema.
- Establecer una arquitectura base sólida.
- Desarrollar un plan de proyecto ajustado para la fase de construcción.
- Eliminar los elementos de mayor riesgo para el desarrollo exitoso del proyecto.

Actividades esenciales:

- Elaborar la visión. Desarrollar los casos de uso a un nivel que dirija las decisiones de la arquitectura o de planificación.
- Elaborar el proceso y la infraestructura.
- Elaborar la arquitectura y los componentes seleccionados.

Productos:

- Modelo de casos de uso prácticamente terminado con descripciones detalladas.
- Otros requisitos no funcionales o no asociados a casos de uso.
- Descripción de la arquitectura del software.
- Un prototipo ejecutable de la arquitectura.
- Lista revisada de riesgos del caso de negocio.
- Plan de desarrollo para el resto del proyecto.
- Un manual de usuario preliminar.

La fase de elaboración es la más crítica del proceso. Al final de la misma, toda la ingeniería "dura" está hecha y se puede decidir si vale la pena seguir adelante. A partir de aquí, la arquitectura, planes de desarrollo y requisitos son estables. Ya hay menos riesgos y se puede planificar con menos incertidumbre el resto del proyecto. Se construye una arquitectura ejecutable que contemple los casos de uso críticos y los riesgos identificados.

El hito que marca el fin de la fase de elaboración debe cumplir los siguientes criterios de evaluación:

- ¿Es estable la visión del proyecto?
- ¿Es estable la arquitectura?
- ¿Las pruebas de ejecución demuestran que los riesgos han sido abordados y resueltos?
- ¿El plan de proyecto es algo realista?
- Las personas involucradas, ¿están de acuerdo con el plan?

### Fase de construcción
Objetivos principales:

- Minimizar los costes de desarrollo optimizando los recursos e impidiendo la realización del trabajo dos veces.
- Conseguir una calidad adecuada.
- Conseguir versiones estables.

Actividades esenciales:

- Gestión y control de los recursos y optimización del proceso.
- Desarrollo de componentes completos y prueba de los mismos frente a criterios de evaluación.
- Valoración de las versiones de producto frente a los criterios de aceptación.

Algunos criterios de evaluación:

- ¿El producto es lo suficientemente estable y maduro como para ser entregado al usuario? La existencia de algunos defectos o cambios pendientes no son obstáculo para conseguir el propósito de la entrega en la fase siguiente.
- ¿Están los usuarios dispuestos para la transición?
- ¿Los gastos actuales de recursos son aceptables todavía frente a los planeados?

El hito que marca el fin de esta fase es la obtención de un producto beta y la decisión sobre si ponerlo en ejecución sin mayores riesgos.

### Fase de transición
Objetivos principales:

- Conseguir que el usuario sea capaz de mantener el producto.
- Conseguir la aceptación por el usuario (stakeholder) de que lo entregado es completo y consistente con el criterio de evaluación fijado en la visión inicial del proyecto.
- Conseguir un producto final tan rápido y eficiente respecto al coste como práctico.

Actividades esenciales:

- Sincronización e integración de los incrementos de construcción concurrentes en líneas base de entrega consistente.
- Realizar una ingeniería específica de entrega (producción y empaquetamiento comercial, plan de formación del personal, etc.).
- Valoración de las líneas base de entrega frente a la visión global y los criterios de aceptación en el conjunto de requisitos.

Algunos criterios de evaluación:

- ¿El usuario está satisfecho?
- ¿La utilización de recursos actual es aceptable frente a la planificada?

### Arquitectura
Visualizar, especificar, construir y documentar un sistema software precisa de una visión del sistema desde distintos puntos de vista.

Cada actor implicado en el proceso mira al sistema desde una perspectiva diferente a lo largo de la vida del proyecto. La arquitectura del sistema es uno de los productos más importantes que se pueden utilizar para gestionar estos puntos de vista y, por tanto, para controlar el desarrollo del sistema a través de su ciclo de vida.

Una arquitectura del sistema abarca el conjunto de decisiones importantes sobre:

- la organización del sistema software,
- la selección de los elementos estructurales y sus interfaces,
- su comportamiento, especificado como colaboración entre los distintos componentes,
- la composición de estos elementos (estructurales y de comportamiento) en subsistemas cada vez más grandes,
- el estilo arquitectónico que guía las organizaciones.

Hay cinco vistas con sus respectivos diagramas que las representan:

- Vista de usuario, con diagramas de casos de uso. Los casos de uso especifican la función, la arquitectura y la forma. Debe existir un balance entre casos de uso y arquitectura. Esta vista es central a las otras cuatro.
- Vista estructural o de diseño, con diagramas de clases y objetos. Representa clases, interfaces, colaboraciones.
- Vista de implementación, con diagramas de componentes. Representa componentes.
- Vista de comportamiento o de proceso, con diagramas de secuencia, de colaboración, de estados y de actividad. Representa clases activas.
- Vista del entorno o de lanzamiento, con diagramas de despliegue. Representa nodos.

## Desarrollo iterativo e incremental
Un proceso basado en casos de uso implica ajustarse a las necesidades reales del usuario. Que esté centrado en la arquitectura quiere decir que el trabajo de desarrollo se centra en obtener un patrón que dirigirá la construcción del sistema en las primeras fases. La mejor forma de conseguir equilibrar casos de uso y arquitectura, que es como equilibrar forma y función, es el desarrollo iterativo e incremental. De esta forma se plantea una estrategia de desarrollo para productos software basada en pequeños pasos manejables: se planifica poco, se especifica, diseña e implementa un poco, se integra, prueba y ejecuta un poco en cada iteración.

Si en cada paso el resultado es satisfactorio, se avanza. Además esto nos permite ajustar los objetivos concretos en cada paso. Cada iteración tiene todo lo que debe tener un proyecto de software: planificación, desarrollo de una serie de flujos y preparación para la entrega. Pero una iteración no es algo totalmente independiente, sino que es una etapa dentro de un proyecto.

Cada iteración permite avanzar en la comprensión de cuestiones relativas al proyecto. Por ejemplo las primeras nos ayudan a comprender los riesgos, determinar la viabilidad, etc.

En resumen, no hay un proceso universal. El proceso unificado está diseñado para ser flexible y extensible, permitiendo una variedad de estrategias de ciclos de vida, seleccionando qué artefactos producir, definiendo actividades y trabajadores, y considerando los conceptos de los modelos.

Un white paper de Rational en 2011 considera que RUP facilita las siguientes buenas prácticas para desarrollo de software:

1. Desarrollo de software iterativo.
2. Gestión de los requisitos.
3. Uso de arquitecturas basadas en componentes.
4. Modelado visual de software.
5. Verificación de la calidad del software.
6. Control de cambios del software.

Esto genera una serie de beneficios:

- Reducción temprana de los errores.
- Gestión de los cambios.
- Mayor nivel de reutilización.
- Evaluación y mejoras periódicas.
- Mejor calidad final.

El proceso unificado equilibra más el peso de cada una de las actividades del proyecto que procesos convencionales como waterfall.
