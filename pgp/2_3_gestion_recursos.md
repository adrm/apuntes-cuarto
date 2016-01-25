## Gestión de recursos ([PDF](originales/tema_2/PGP_plan_proye_recursos_1516.pdf))
### Introducción
A lo largo del desarrollo de un proyecto se precisan distintos tipos de recursos. La idea es proporcionar pautas para la selección y adscripción de los recursos al proyecto a lo largo del tiempo. La forma de reservar los recursos puede implicar la existencia de restricciones sobre las tareas programadas y por lo tanto puede incidir en la planificación temporal considerada. Por tanto, una de las tareas del responsable del proyecto será buscar la concordancia entre las tareas planificadas y los recursos disponibles en cada momento.

Productos resultantes: calendarización de actividades, de recursos y del coste.

### Tipos de recursos
Según Pressman, los recursos pueden dividirse en:

- Personal (número, capacidad, ubicación)
- Software (componentes OTS, nuevo componentes, componentes probados, componentes de experiencia parcial)
- Entorno (herramienta software, hardware, recursos de red)

Cada recurso debe especificar: descripción, informe de disponibilidad, fecha de necesidad y tiempo durante el que se necesitará. En caso de RRHH, especificar las habilidades técnicas que requiere el recurso.

Hughes y Cotterell dividen los recursos en:

- Trabajo: Miembros del equipo de desarrollo, garantía de calidad, etc.
- Equipamiento: Material informático e infraestructura física para su funcionamiento, así como mobiliario.
- Materiales: Consumibles de informática, papel, etc.
- Espacio: En una organización existente, ya está disponible. Hay que contar con posible personal adicional.
- Servicios: Algunos proyectos requieren servicios especiales, como un sistema WAN u otros.
- Tiempo: Uno de los recursos principales que, a veces, está preestablecido.
- Dinero: Recurso secundario usado para comprar otros recursos.

### Identificación de las necesidades de recursos
Aunque muchos recursos están ligados a una actividad, hay otros que no pero son parte de la infraestructura del proyecto, ya sea física, como espacio para nuevo personal, o de personal, como el esfuerzo de planificación y seguimiento que hace el responsable del proyecto, y por tanto tienen que reflejarse en el plan. Lo más indicado es hacer una lista de necesidades de recursos lo antes posible.

La estimación de recursos debe darse en días/persona, y para tareas cortas se pueden usar horas/personas aunque sería más uniforme usar fracciones de días/persona.

### Rol de gestor de proyecto
El gestor de proyecto es quien decide quién hace qué y quién decide qué a lo largo del proyecto. Para ello, hay que considerar el balance entre posibilidades de aprendizaje frente a restricciones temporales, considerado las habilidades específicas necesarias para cada actividad. Este trabajo se facilita disponiendo de una especificación clara de los roles involucrados y un conocimiento del equipo.

Para cada rol, el gestor de proyecto debe definir tres aspectos: su responsabilidad, especificando qué está obligado a hacer; su autoridad, que es el derecho que tiene a realizar, mandar y tomar decisiones; y su exigencia, que dice en qué medida este rol asumirá la responsabilidad del éxito o fracaso de la actividad.

### Fichas de recurso
Se debe crear una ficha para cada recurso en que se especifiquen al menos las siguientes características:

- Descripción del recurso.
- Informe sobre su disponibilidad.
- Fecha de comienzo en la que se precisa el recurso.
- Tiempo durante el que se precisa el recurso.
- En caso de recursos humanos, habilidades técnicas que precisa el recurso para la tarea.

### Gestión de recursos humanos en el PMBOK
El PMBOK dedica un capítulo a la gestión de recursos humanos, dividiéndolo en cuatro partes:

- 9.1 Planificación de los recursos humanos: identificar y documentar los roles de proyecto, responsabilidades y relaciones de informe así como crear el plan de gestión del personal.
- 9.2 Adquirir el equipo de proyecto: obtener los recursos humanos necesarios.
- 9.3 Desarrollar el equipo del proyecto: mejorar las competencias y la interacción de los miembros del equipo para lograr un mejor rendimiento.
- 9.4 Gestionar el equipo del proyecto: hacer un seguimiento del rendimiento de los miembros del equipo, proporcionar retroalimentación, resolver polémicas y coordinar cambios a fin de mejorar el rendimiento del proyecto.

En este caso el PMBOK se enfoca más en aspectos relacionados con la gestión de recursos humanos que con la planificación de los mismos.

### Cuadro RACI
En el PMBOK se habla de una matriz de responsabilidades para el personal. Cada persona tiene una responsabilidad respecto a cada actividad. Estas responsabilidades pueden ser *Responsible* (Responsable), *Accountable* (Subordinado-responsable), *Consult* (Consultado) e *Inform* (Informado).

### Diagramas de planificación de recursos
Es útil poder ver únicamente las tareas que hay asignadas a cada recurso para comunicar a los participantes el uso de un recurso compartido, verificar que se usan de forma equilibrada o verificar que no se pretende usar ningún recurso más de lo posible. Para esto se usan el diagrama de Gantt y el de cargas.

### Asignación de recursos a tareas
A la hora de asignar recursos a tareas hay que tener en cuenta:

- Disponibilidad. Tiene que haber personas adecuadas para no alargar el proyecto.
- Criticidad. Asignar recursos con más experiencia a actividades del camino crítico puede ayudar a reducir la duración del proyecto o disminuir el riesgo de alargamiento.
- Riesgo. Es importante identificar tareas que plantean más riesgos y qué factores influyen en ello para asignar personal.
- Entrenamiento. La organización se beneficia asignando personas inexpertas en tareas no críticas donde, con la holgura, podrán ir formándose.
- Formación de equipo. La selección debe tener en cuenta las cualidades considerando las características del proyecto y que las personas deben trabajar conjuntamente.

### Conflictos sobre recursos
Se producen conflictos sobre recursos cuando el mismo recurso se precisa en más de un lugar al mismo tiempo. Se pueden resolver retrasando una de las actividades (aprovechando la holgura o retrasando la finalización del proyecto), moviendo un recurso desde una actividad no crítica, proporcionando recursos adicionales (aumenta el coste), dividiendo la actividad en dos para facilitar la asignación o permitiendo una sobrecarga de trabajo (también supone mayor coste).

Es conveniente priorizar las tareas de forma que la asignación de los recursos se haga siguiendo un orden racional predeterminado. Existen varias formas de proporcionar prioridades a los recursos:

- Prioridad por holgura total: Las tareas con menor holgura tienen la mayor prioridad a la hora de asignar recursos.
- Prioridad por lista ordenada: Las actividades que se realizan al mismo tiempo se ordenan según un criterio sencillo. Según Burman sería:
    - Actividad crítica más corta.
    - Actividad crítica.
    - Actividad no crítica más corta.
    - Actividad no crítica con menor holgura.
    - Actividad no crítica.

Se necesita maximizar el porcentaje de utilización de los recursos, es decir, reducir periodos vacíos entre tareas. Hay que balancear costes frente a anticipar la fecha de finalización. También es necesario permitir contingencias.

La planificación de recursos puede crear nuevas dependencias entre actividades incidiendo en los caminos críticos. Por ello, es mejor no añadir dependencias a la red de actividades para reflejar las restricciones de recursos. La restricción puede desaparecer durante el proyecto pero el enlace permanece.
