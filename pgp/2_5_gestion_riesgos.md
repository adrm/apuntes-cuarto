## Gestión de riesgos en desarrollo de software ([PDF](originales/tema_2/PGP_riesgos_1516.pdf))
### Introducción
Los proyectos de software pueden ir mal por múltiples razones como conocimiento poco adecuado de las necesidades del usuario, documentos de requisitos poco elaborados, gestión pobre de requisitos, arquitectura o diseño pobre o inexistente, codificar antes de plantear las preguntas, comprensión pobre del diseño o código legado, falta de revisión entre pares para detectar problemas en fases iniciales, personal sin experiencia o incompetente, pruebas poco efectivas...

Un **riesgo** es, según el PRINCE2, una "casualidad de exposición a las consecuencias adversas de eventos futuros" y, según el PMBOK, es "un evento o una condición de inciertos que, si ocurren, tienen un efecto positivo o negativo sobre los objetivos del proyecto".

Los riesgos se relacionan con posibles problemas futuros, no con los actuales. Implican por tanto una posible causa y su efecto. Un riesgo es una medida de la probabilidad y pérdida de que se produzca un resultado inadecuado que afecte al producto, proceso o proyecto software.

Por ejemplo, en un viaje en coche podríamos tener los siguientes riesgos:

| Situación imprevista | Problema | Plan de acción |
| :------------- | :------------- | :------------- |
| Congestión inusual de tráfico | Podría llegar tarde a una entrevista | Escuchar informes de tráfico por la radio. Planear rutas alternativas antes de empezar el viaje|
| Pinchazo de un neumático | Podría no llegar a la entrevista o llegar tarde | Asegurarse que el neumático de repuesto está utilizable e inflado |
| Rotura del coche o accidente | Probablemente no llegar a la entrevista | No hay |

Un riesgo está caracterizado por su probabilidad de ocurrencia y por sus consecuencias.

### Tipos y fuentes de riesgo
Una clasificación de tipos de riesgos es:

- De proyecto.
	- Operativo.
	- Organizativo.
	- Contractual.
- De proceso.
	- De gestión.
	- Técnico.
- De producto.
	- Conocidos.
	- Predecibles.
	- Impredecibles.

Los tipos de riesgos según Hughes & Cotterell son:

- Debidos a dificultades de estimación.
- Debidos a suposiciones hechas en el proceso de planificación.
- Imprevisibles.

Algunas causas de los riesgos de proyecto son las restricciones de recursos, las interfaces externas, las relaciones con los proveedores, las políticas internas, los problemas de coordinación interna del equipo o del grupo o la financiación no adecuada. Las causas de los riesgos de proceso pueden ser un proceso de software no documentado, la falta de revisiones efectivas de colegas, ausencia de prevención de defectos, un proceso de diseño pobre, una gestión pobre de requisitos o una planificación ineficaz. En cuanto a los riesgos de producto, sus causas pueden ser la falta de experiencia en el dominio, un diseño complejo, interfaces definidas deficientemente, sistemas de legado poco comprendidos o requisitos vagos o incompletos.

Los **factores de riesgo** pueden ser:

- debidos a la aplicación,
- debidos al personal,
- debidos al proyecto,
- métodos del proyecto,
- de hardware / software,
- debidos a cambios en el personal,
- debidos a los proveedores,
- debidos al entorno,
- factores ligados a la salud y a la seguridad.

Esta relación no implica que todos vayan a existir en todos los proyectos, pero sí que se deben considerar.

### Paradigma de la gestión de riesgos
Se denomina **gestión de riesgos** a la práctica de valorar y controlar los riesgos que afectan a un producto, proceso o proyecto software. Su propósito es identificar problemas potenciales antes de que ocurran. En general, la idea es describir inicialmente los objetivos y después describir los riesgos en términos de incertidumbre, pérdidas y tiempo.

Algunos conceptos básicos de la gestión de riesgos son: objetivos, incertidumbre, pérdidas (oportunidad y coste de oportunidad), tiempo, elección, tomar decisiones inteligentes, resolver el riesgo, prevenir problemas.

La gestión del riesgo es necesaria porque el desarrollo de software tiene riesgos inherentes, el riesgo aumenta a medida que aumenta la complejidad del sistema, y el riesgo podría impedir alcanzar los objetivos si éste no se considera.

Entre las características de la gestión de riesgos se encuentran: considerar las oportunidades y amenazas, analizar la incertidumbre incluyendo ambigüedades, o preocuparse de las raíces de la incertidumbre en términos de las "seis Ws": quién (who), por qué (why), qué (what), de qué forma (which way), con qué (wherewithal), cuándo (when).

#### Por qué se deben gestionar los riesgos
Todos los proyectos conllevan riesgos, y es muy probable que alguno ocurra. La gestión de riesgos es, por tanto, una inversión de futuro, pues muchas veces es más barato evitar un problema potencial que corregir uno que se ha producido. Si se corrigen los problemas a medida que se presentan, el flujo de problemas que se vayan produciendo podría mantenernos ocupados.

Es importante conocer dónde están los riesgos para enfocar sobre áreas esenciales de riesgos. La gestión intuitiva de los riesgos rara vez es suficiente en el caso de proyectos grandes, complejos. La gestión mejora la predictibilidad y control de los proyectos.

Gestionar los riesgos permite conseguir un conocimiento consistente de los riesgos en toda la organización. Además permite aprender de riesgos que se hayan producido.

#### Proceso de gestión de riesgos
Este proceso es continuo, orientado hacia el futuro, y es una parte importante de la gestión de proyectos. A pesar de su importancia, en muchos casos no se realiza debido a la dificultad de medir su éxito, a la novedad de la disciplina, a la dificultad de la comprensión del concepto de riesgo, a conflictos con la cultura interna de ciertas empresas que desaconseja la aproximación analítica a la gestión de riesgos, a que no se le da la importancia que merece, o a procesos de proyecto caóticos.

Una buena gestión de riesgos es proactiva, integrada, sistemática y disciplinada (personal, proceso, infraestructura e implementación)

#### Principios de la gestión de riesgos del software

- Mantenimiento de una perspectiva global.
- Tener una visión previsora, pensando en los riesgos que puedan aparecer en el futuro.
- Alentar la comunicación abierta, admitiendo sugerencias de riesgos potenciales de cualquier usuario o miembro del equipo.
- Integración del proceso de desarrollo de software con la consideración permanente de los riesgos.
- Enfatizar un proceso continuo.
- Desarrollar una visión conjunta del producto implicando a los usuarios.
- Alentar el trabajo en equipo.

#### Paradigma de la gestión de riesgos de software en SEI 92

- Identificar: Buscar y localizar riesgos antes de que se presenten los problemas.
- Analizar: Transformar los datos de riesgo en información para la toma de decisiones. Evaluar el impacto, probabilidad y establecer el tiempo, clasificar y priorizar los riesgos.
- Planificar: Trasladar la información sobre riesgos en decisiones y acciones de disminución de su efecto, tanto en el presente como en el futuro, e implementar dichas acciones.
- Seguir: Monitorizar los indicadores de riesgo y las acciones para mitigar su efecto.
- Controlar: Corregir las desviaciones sobre los planes de disminución de su efecto.
- Comunicar: Proporcionar información y realimentación

En cualquier caso, debe existir la comunicación de todas estas funciones de gestión de riesgo. Todas estas actividades pueden ser concurrentes entre los diferentes riesgos.

Hughes & Cotterell plantean el siguiente marco de trabajo para riesgos:

- Identificación del riesgo. ¿Qué riesgos puede haber?
- Análisis y priorización de los riesgos. ¿Cuáles son los riesgos más serios?
- Planificación de los riesgos. ¿Qué haremos si se presentan?
- Monitorización del riesgo. ¿Cuál es el estado actual del riesgo?

#### El proceso de gestión de los riesgos
La gestión de los riesgos es un ciclo que parte de una base de conocimientos de riesgos que se usa para **identificar** riesgos (lista de riesgos potenciales), después se **analizan** (lista priorizada), se **planifican** (evasión de riesgos y planes de contingencia), se **siguen** (valoración de los riesgos), se **resuelven** y se **aprende** del proceso, llevando el nuevo conocimiento a la base de conocimientos de riesgos.

#### La identificación de riesgos
Algunas tareas relacionadas con la identificación de riesgos son: la realización de una valoración de los riesgos a través de entrevistas, identificación sistemática de riesgos con listas de comprobación o tormentas de ideas, definición de los atributos de los riesgos, documentación de los riesgos identificados, o comunicación de riesgos identificados.

Algunas pautas para la identificación de riesgos son las siguientes:

- Comenzar con una tormenta de ideas abierta, que permite aprender y utilizar una técnica efectiva.
- Realizar una tormenta de ideas focalizada por área, stakeholder, objetivo, área técnica, etc.
- Utilizar una lista de comprobación para garantizar una cobertura suficiente, utilizando los elementos de la lista como puntos de discusión. Las listas se pueden personalizar a través de la experiencia.

La cuantificación de un riesgo está relacionada con su probabilidad y su impacto.

Los riesgos se ordenan según lo críticos que sean en función de su cuantificación.

La cuantificación de los riesgos parece conveniente puesto que permite una evaluación más crítica de las propuestas de soluciones, alienta el diseño con la percepción de riesgo, facilita la realimentación sobre riesgos que se han olvidado, permite la realimentación sobre el impacto de los riesgos que se han anticipado, facilita la reserva de recursos para tratar los riesgos, y nos permite determinar si un riesgo es aceptable.

El PMBOK define los siguientes puntos sobre la cuantificación de riesgos:

Entradas:

- Tolerancias del cliente al riesgo.
- Fuentes de riesgo.
- Eventos de riesgo potenciales.
- Estimaciones de coste.
- Estmiaciones de la duración de la actividad.

Herramientas y técnicas:

- Valor monetario esperado.
- Sumas estadísticas.
- Simulaciones usando por ejemplo PERT o CPM.
- Árboles de decisión.
- Juicio de expertos.

Salidas:

- Lista de amenazas a considerar o de oportunidades a seguir.
- Lista de amenazas a aceptar y de oportunidades a ignorar.

La documentación de los riesgos extraída de la identificación incluye relacionarlos con un proyecto, fecha, nombre, categoría, probabilidad, consecuencias, creador, fase y elemento de WBS.

Un método para identificar riesgos es crear una lista de comprobación de los elementos de riesgo:

- Tamaño del producto: riesgos asociados con el tamaño general del software a construir o modificar.
- Impacto en el negocio: riesgos asociados con las limitaciones de gestión o el mercado.
- Características del cliente: riesgos asociados con las características de los clientes y la forma de comunicación del desarrollador con el cliente.
- Definición del proceso: riesgos asociados con el grado de definición del proceso y su seguimiento por la organización.
- Entorno de desarrollo: riesgos asociados con la disponibilidad y calidad de las herramientas que se van a emplear en la construcción del producto.
- Tecnología a construir: riesgos asociados con la complejidad del sistema a construir y la tecnología que contiene el mismo.
- Tamaño y experiencia de la plantilla: riesgos asociados con la experiencia técnica y de proyectos de los ingenieros de software.

Dentro de la identificación de los riesgos se encuentra la tarea de la comunicación de estos. Hay que notificar a todas las partes afectadas, ya sean usuarios, responsables, equipo de gestión, márketing, ventas, soporte, finanzas, garantía de calidad, etc.

#### El análisis de los riesgos
Las actividades que comprende el análisis de riesgos son:

- Agrupamiento: eliminar riesgos redundantes, combinar riesgos relacionados, enlazar riesgos dependientes.
- Determinación de los conductores de riesgos (risk drivers): factores subyacentes que afectan a la gravedad de las consecuencias. Pueden afectar a la estimación de la probabilidad, consecuencia y exposición al riesgo. Aumentan el conocimiento de cómo se pueden mitigar los efectos de los riesgos.
- Ordenación de la probabilidad, consecuencia, exposición, marco temporal.
- Determinación de las causas raíz (fuentes del riesgo): análisis anterior de las causas, identificando causas comunes.

Tras este análisis se puede mantener una lista Top-n de los n riesgos más importantes a tener en cuenta para observar la evolución periódica de éstos.

La documentación de los riesgos extraída del análisis aporta un enunciado que describe brevemente el riesgo, el contexto del mismo (cuándo, cómo, dónde, por qué...) y un análisis de su impacto en el proyecto.

#### La planificación de los riesgos
Existen varias estrategias para resolver los riesgos:

- Evitación del riesgo: prevenir su ocurrencia reduciendo a cero su probabilidad.
- Protección del riesgo: reduce la probabilidad y/o consecuencias del riesgo antes de que ocurra.
- Reducción del riesgo: reduce la probabilidad y/o consecuencias del riesgo una vez ocurre.
- Investigación del riesgo: obtener más información para eliminar o reducir la incertidumbre sobre el riesgo.
- Reservar el riesgo: utilizar la planificación reservada previamente o la holgura del presupuesto.
- Transferencia del riesgo: reorganización que desplace el riesgo a otra parte.
- Aceptación del riesgo: si el coste de la evitación del riesgo puede ser mayor que el coste de asumirlo si se produce.

Actividades de la planificación de riesgos:

- Especificar escenarios: ¿cómo seríamos capaces de decir qué está ocurriendo?
- Definir umbrales cuantificados para los avisos iniciales: qué monitorizar, cuándo consideramos que el riesgo va a ocurrir.
- Desarrollar alternativas de resolución: formas de eliminar, mitigar o manejar el riesgo.
- Seleccionar la mejor aproximación a la resolución: ¿cuál es la que tiene mejor retorno de la inversión (ROI)?
- Especificar el plan de acción de riesgos, documentando las decisiones.

#### El seguimiento de los riesgos
Las actividades del seguimiento de riesgos abarcan:

- Monitorización de escenarios de riesgo, vigilando la aparición de signos de ocurrencia de un escenario de riesgo.
- Comparar los indicadores con las condiciones de disparo.
- Notificar a los stakeholders y ejecutar el plan de acción.
- Recoger estadísticas y actualizar la base de datos de riesgos.

Por cada item de riesgo se deben preparar las respuestas apropiadas a preguntas como quién es el responsable de la acción, cuándo se debe realizar, qué medida hay que vigilar y cuál es el valor de disparo de la medida.

La planificación y el seguimiento de riesgos añaden a la documentación del riesgo el escenario que describe qué sucedería si el riesgo ocurre, el indicador del riesgo (métrica que hay que seguir), la condición de disparo (valor que indica que se ha producido el riesgo), el punto de comprobación del indicador, la estrategia de resolución y el plan de acción.

#### La resolución de riesgos
Sus objetivos son, entre otros, asignar responsabilidad y autoridad al nivel de detalle más bajo posible, seguir un plan de acción perfectamente documentado, informar del esfuerzo dedicado a la resolución de riesgos, tomar acciones correctivas cuando sea necesario, estar preparado para adaptarse a circunstancias cambiantes, mejorar la comunicación dentro del equipo y controlar de forma sistemática los riesgos.

Las actividades abarcan:

- Reconocimiento con acuse de recibo de la notificación: permitir a los usuarios conocer que estás informado, indicar tiempo de respuesta, determinar la responsabilidad / pertenencia.
- Ejecutar el plan de acción: improvisar, adaptar y superar el riesgo usando el sentido común.
- Proporcionar actualizaciones continuas, permitiendo a los usuarios conocer el progreso realizado resolviendo el riesgo.
- Recoger estadísticas actualizando la base de datos de riesgos.

La resolución de riesgos aporta a la documentación la firma de todos los responsables: el ingeniero de software, de calidad, el gestor de proyecto y el responsable de márketing.

### Capacidad para la gestión de riesgos (modelo CMM del SEI)
Según la capacidad para gestionar riesgos en un proyecto, se pueden dar 5 niveles:

1. Riesgos ignorados o solo seguidos de forma ad-hoc.
2. Los riesgos se suelen registrar, son seguidos y se manejan en el momento en que se descubren.
3. Los riesgos son cuantificados, analizados, planificados, seguidos y resueltos de forma sistemática.
4. Los análisis cuantificados se utilizan para determinar la resolución coste / beneficio del proyecto.
5. Se usan las estadísticas de riesgos para realizar mejoras organizativas o de proceso.

También se puede clasificar esta capacidad según los siguientes niveles:

- Invisible: No hay evidencia sobre la realización de actividades de gestión de riesgos. La gestión de riesgos es intuitiva y se incluye implícitamente en la gestión de proyectos.
- Ad hoc: Los gestores de proyectos realizan de forma ocasional actividades de gestión de riesgos por iniciativa propia.
- Sugerida: Existen plantillas para documentar los resultados de las actividades de gestión de riesgos, como una selección de gestión de riesgos en el plan de proyecto o una lista de riesgos en el informe de progreso del proyecto, pero no son requeridas.
- Requerida: Los resultados de las actividades de gestión de riesgos son requeridos y comprobados formalmente, se solicita un plan de gestión de iresgos y se obtienen, actualizan y analizan las listas de riesgos con frecuencia.
- Apoyada: Existe un proceso definido para realizar la gestión de riesgos en la organización, incluyendo métodos, herramientas, pautas e infraestructuras de apoyo.
- Mejorada: Hay un proceso sistemático para capturar la experiencia en gestión de riesgos y mejorar las prácticas de dicha gestión basadas en las experiencias anteriores.

### Aprendiendo de los riesgos
En el post mortem hay que analizar cuáles fueron los riesgos no anticipados, la gravedad real de la consecuencia, si las estrategias de resolución funcionaron como se esperaba, qué riesgos se podían haber podido prevenir, transferir, protegido frente, reducir o manejar únicamente reservándole recursos extra.

A partir de ahí hay que sacar en claro qué medidas preventivas se pueden tomar en el futuro, qué problemas significativos de prestaciones para el vendedor / partner existen, y qué se puede compartir con otros equipos de proyecto.

### Los 10 riesgos más importantes según Boehm (1991)

- Fallos de personal.
- Planificaciones de tiempo y presupuesto no realistas.
- Desarrollo de funciones de software incorrectas.
- Desarrollo de interfaces incorrectas.
- "Chapado en oro" <!-- TODO No sé qué es -->
- Secuencia continuada de cambios en los requisitos.
- Fallos en las tareas realizadas externamente.
- Fallos en los componentes externos.
- Fallos en las prestaciones de tiempo real.
- Capacidades informáticas forzadas.

<!-- TODO No incluyo el material adicional: Método de identificación de riesgos del SEI -->
