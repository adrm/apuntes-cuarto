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
- Rastrear los cambios
