# 2. Modelado de datos: Introdcción al diseño de bases de datos ([PDF](originales/02-modeladoDatos.pdf))
## Etapas del diseño
¿Qué pasos se siguen en el diseño de bases de datos? Existen una serie de diseños que se realizan en un cierto orden.

1. Análisis de requisitos: Comprender los datos a gestionar, elicitar las necesidades del cliente a través de reuniones, discusiones, documentación... Es una etapa clave que puede ser muy costosa.
2. Diseño conceptual: Descripción de alto nivel de los datos y sus restricciones. Modelo que representa, organiza y clarifica la información. Normalmente, modelo Entidad-Relación. Es suficientemente preciso como para permitir su traducción a un modelo específico del SGBD.
3. Diseño lógico: Esquema de la BD acorde al SGBD elegido. Traducción del esquema ER a un esquema relacional.
4. Refinamiento de los esquemas: Reestructuración para garantizar propiedades importantes.
5. Diseño físico: Mejora de rendimiento en base a cargas típicas. Idealmente no supone un rediseño de las etapas anteriores.
6. Diseño de aplicaciones y seguridad: Procesos relacionados con las aplicaciones, como tareas y flujos de trabajo, y cuestiones de accesibilidad y seguridad.

## Diseño lógico o conceptual primero
Hay que preguntarse cuestiones como, en el caso del sistema de gestión telefónica, si dos clientes pueden tener la misma línea, si una línea puede tener dos tarifas, si son necesarias más tablas y cuáles, etc.

El diseño conceptual se realiza como diagrama ER (Entidad-Relación) con notación UML. Se describe cómo se estructuran los datos. Existen varias alternativas para un mismo escenario, y hay que decidir.

<!-- Diapositiva 6 -->
