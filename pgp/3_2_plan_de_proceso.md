## Proceso unificado. Plan de proceso. ([PDF](originales/tema_3/PGP_plan_rup_1516.pdf))
### Introducción
No es difícil convencer a un gestor de proyectos de los beneficios de un proceso iterativo, pero a la hora de planificarlo surge la dificultad de que existen pocas técnicas para realizarlo. Surgen preguntas como cuántas iteraciones son adecuadas, cuál debe ser su duración, cómo determinar los contenidos y objetivos de cada iteración, cómo se puede seguir el progreso de una iteración, etc.

La planificación debe asignar responsabilidades y actividades a un equipo de personas a lo largo del tiempo. Se debe realizar el seguimiento del progreso relativo a la planificación y detectar problemas potenciales. También, el gestor de proyectos debe tratar con recursos inanimados como el equipamiento, presupuestos, etc pero estos aspectos no están afectados por la aproximación iterativa del proceso.

Antes de comenzar la fase de inicio, hay que tener en cuenta lo siguiente:

En organizaciones que desarrollan software para la venta general, suele haber mucha información porque ventas y dirección se han encargado de plantear la idea y puede que ya existan estudios exploratorios, así que parte de las tareas de inicio ya se han realizado.

En organizaciones que desarrollan software para la propia organización, puede que no se conozca muy bien lo que se pretende o que sí que estén bien desarrollados los requisitos.

En organizaciones que desarrollan software para un cliente que lo solicita, habitualmente la petición ya contiene muchos detalles.

También hay que considerar si se trata de una nueva versión de un producto existente o estamos hablando de un producto totalmente nuevo.

En general parece imposible realizar una planificación detallada con un nivel de granularidad de días. Para que los planes sean realistas, se debe comprender perfectamente lo que se está construyendo, tener unos requisitos y una arquitectura estables, y se debe haber construido antes algún sistema parecido.

### Planificación de procesos iterativos
Para planificar procesos iterativos, Krutchen recomienda basar el desarrollo en dos tipos de planes: uno a grandes rasgos denominado plan de fases, y varios planes más detallados denominados planes de iteración.

El **plan de fases** es único por cada proyecto y contiene las fechas de los hitos principales, como el final de cada fase y del proyecto; el perfil de los recursos humanos necesarios a lo largo del tiepo; y las fechas de los hitos secundarios, que corresponden con el fin de cada iteración y su objetivo principal, si se conocen.

El plan de fases se genera al principio de la fase de inicio y se actualiza cuando sea necesario, y su tamaño es de una o dos páginas para definir el alcance y restricciones del proyecto.

Para elaborar el plan de fase, se parte del esfuerzo que supone el proyecto y la fecha en la que tiene que estar finalizado, y se planifica hacia atrás.

El plan se ve influenciado por:

- El tamaño del esfuerzo de desarrollo de software: formalidad, estádndares, rigidez del proceso.
- El grado de novedad: si es el primer proyecto de este tipo, su ciclo de evolución y mantenimiento.
- Tipo de aplicación: si es misión crítica, si requiere ciertas prestaciones, si tiene restricciones de memoria.
- El proceso de desarrollo actual: madurez del proceso, experiencia de los gestores y desarrolladores.
- Factores organizativos: actitud del equipo ante los cambios, entusiasmo hacia el proyecto.
- Complejidad técnica y de gestión: tamaño del proyecto.

Habrá que ajustar la duración de cada una de las fases según los detalles concretos de cada proyecto y cada equipo.

El **plan de una iteración** es más detallado y hay uno por cada iteración, aunque puede haber dos activos en un proyecto a la vez si se tiene el plan de itreación actual, y el de la iteración siguiente que se comienza a generar al final de la iteración actual y está disponible en cuanto se termina. Se genera con técnicas y herramientas de planificación habituales, contiene fechas importantes y se puede considerar como una ventana que se desplaza por el plan de fases, detallando la imagen del tramo que recorre. Los pasos a seguir para elaborar el plan de iteración que asigna roles a las actividades e individuos a los roles son:

1. Definir criterios objetivos para saber si ha tenido éxito al finalizar. Se utilizarán estos criterios al final de la iteración, en un proceso de valoración, para decidir si la iteración ha finalizado con éxito o no.
2. Identificar los artefactos concretos y medibles que habrá que desarrollar y las actividades necesarias para conseguirlos.
3. Partiendo de una división de trabajo de iteración típica, ajustarla a lo que hay que hacer. Comenzar con una estructura típica de descomposición del trabajo (WBS) y adecuarla para tener en cuenta las actividades que se van a realizar.
4. Utilizar estimaciones para asignar duración y esfuerzo a cada actividad, ateniéndose al presupuesto.

Hay que plantear una iteración como un microproyecto concreto. Se recomienda una duración de dos a seis semanas. La rapidez de la iteración depende del tamaño de la organización y la jerarquía de la misma, pues cambiará el tiempo necesario para planificarse.

Una vez conocidos en cada caso los escenarios o casos de uso que deben ser considerados, pensando en la planificación hay que considerar qué artefactos serán afectados: qué clases deben ser revisadas, qué subsistemas son afectados o creados, qué interfaces necesitan ser modificadas o qué documentos deben ser actualizados. Después hay que identificar qué actividades están implicadas y colocarlas en el plan de proyecto. Algunas actividades se harán una vez por iteración, como elaborar el plan, mientras otras se hacen una vez por clase, caso de uso o subsistema. Hay que establecer las dependencias entre las actividades respectivas, y estimar el esfuerzo necesario para llevarlas a cabo.

### Fases
En la **fase de inicio** no hay una iteración real puesto que no se produce software. A veces es conveniente realizar una iteración para crear un prototipo no funcional para validar la idea o construir un prototipo para disminuir riesgos con tecnologías nuevas, o para verificar si se pueden alcanzar requisitos no funcionales. Por tanto, 0 o 1 iteraciones.

En esta fase puede que no se tenga suficiente información para poder planificarla. En ese caso hay que reunir y organizar toda la información relevante posible, reunir gente que sepa utilizar dicha información, y describir qué es lo que falta siendo conscientes de la fase en la que estamos.

Algunas fuentes de información previa son: si es para un software de venta general, pueden existir trabajos de responsables de márketing que permitan obtener información del sistema; si es para la propia empresa, se parte de un estudio global del tipo de planificación estratégica que aporta modelos de negocio; y si es para un cliente, se parte del documento de petición inicial.

Los artefactos de la fase de inicio son:

- Documento de visión del sistema: visión general de los requisitos principales, de las características fundamentales y de las restricciones más importantes.
- Esbozo de los modelos que representan la primera versión de casos de uso, modelos de análisis y de diseño. Primera versión de requisitos adicionales.
- Primer esquema de la arquitectura candidata.
- En algunos casos, prototipo exploratorio.
- Lista de riesgos y casos de uso.
- Esbozo de un plan para el proyecto total, incluyendo un plan general de fases.
- Primer borrador del análisis de negocio.

En la **fase de elaboración**, es necesaria al menos una iteración, pero si se realizan más (hasta 3) dependerá de si no se dispone de una arquitectura de entrada y se deben ajustar muchos factores nuevos.

Para definir los objetivos de una iteración en esta etapa hay que tener en cuenta:

- Riesgo. Cuanto más pronto se pueda eliminar un riesgo o disponer de un plan para mitigar su efecto, mejor.
- Recubrimiento. Hay que determinar si la arquitectura propuesta cubre todos los aspectos del software a desarrollar.
- Criticidad. Aunque los riesgos son muy importantes, no hay que perder de vista el objetivo principal del sistema a desarrollar. Es importante garantizar que se cubren todas las funciones o servicios críticos que se exigen al sistema, aunque a veces esto plantee compromisos con los aspectos de riesgo.

Productos clave:

- Preferiblemente, modelo completo de negocio que describe el contexto del sistema.
- Nueva versión de todos los modelos: casos de uso, análisis, diseño, despliegue e implementación.
- Línea base de la arquitectura y descripción de la misma.
- Lista de riesgos actualizada.
- Plan de proyecto para las fases de construcción y, a veces, la de transición.
- Versión preliminar del manual de usuario (opcional).
- Análisis de negocio completo, incluida la apuesta económica.

La **fase de construcción** también requiere al menos una pero son recomendables dos iteraciones. Dependiendo del proyecto, incluso tres.

Productos clave:

- Plan de proyecto para la fase de transición.
- Sistema software ejecutable.
- Todos los artefactos, incluyendo modelos del sistema.
- Descripción de la arquitectura modificada y actualizada mínimamente.
- Versión preliminar del manual de usuario, suficientemente destallado para que sirva a los usuarios de la versión beta.
- Análisis de negocio que refleja la situación al final de la fase.

La **fase de transición** requiere una, pero los defectos que se encuentran suelen obligar a realizar al menos otra.

Productos clave:

- Sistema software ejecutable, incluyendo el software de instalación.
- Documentos legales, como contratos, licencias, renuncias y garantías.
- Descripción completa y actualizada de la arquitectura.
- Versión completa y corregida de la línea base de la versión del producto, que incluya todos los modelos del sistema.
- Manuales y material de formación del usuario final, del operador y del administrador del sistema.
- Referencias, incluyendo las de la web, para ayuda del cliente sobre dónde encontrar más información, FAQ, etc.

### Tipos de ciclo de vida
Existen varios patrones de iteración. Se puede dar un **ciclo de vida incremental** en el que al principio se definen los requisitos del sistema y después se van añadiendo las funcionalidades planificadas iteración tras iteración. En el ciclo de vida incremental suele haber una única iteración de elaboración para definir los requisitos y establecer la arquitectura, y varias de construcción.

También existe el **ciclo de vida evolutivo** para los casos en que los requisitos no están totalmente definidos y en ese caso los requisitos se van refinando a medida que avanzan las iteraciones. En el ciclo de vida evolutivo, se dan varias iteraciones de elaboración en la que se va definiendo el proyecto y una de construcción en la que se realizan los casos de uso.

Otro es el **ciclo de vida de entrega incremental** en los que, en condiciones en las que el usuario da valor a las entregas incrementales de funcionalidad como en situaciones en las que urge salir al mercado, permite generar un producto funcional pronto. La fase de transición comienza muy pronto y tiene más iteraciones. Este tipo de ciclo de vida requiere una arquitectura muy estable, así que es complicado de conseguir para nuevos tipos de sistemas.
<!-- Diapo 27 (13) -->
