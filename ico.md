0. Introducción
===============

0.1. Caracterización y perspectiva de agente
--------------------------------------------

### 0.1.1. Caracterización
La IA se refiere al diseño y análisis de agentes autónomos. Son sistemas software o máquinas físicas con sensores y actuadores. Un **sistema inteligente** tiene que percibir su entorno, actuar racionalmente hacia sus tareas preasignadas, interaccionar con otros agentes y con seres humanos.

### 0.1.2 ¿Qué es un sistema inteligente?
Un sistema inteligente es un agente inteligente o, mejor dicho, racional. Se verá más adelante.

### 0.1.3 Concepto de agente
Entidad que percibe su entorno a través de sensores y modifica el entorno mediante actuadores. El típico ejemplo del termostato.

### 0.1.4 Comportamiento de un agente
Teóricamente la **función de agente**, que consiste en, dada una secuencia de percepciones, ejecutar una serie de acciones.

### 0.1.5 Mundo del aspirador
Fila de dos casillas. El agente detecta su situación y si la casilla en la que está está sucia. Sus posibles acciones son derecha, izquierda, asiparar y noop. Su función de agente es: si la casilla actual está sucia, aspirar. Si no, ir a la otra casilla.

Tenemos pues secuencias de percepciones, acciones y una función de agente que las relaciona, pero también tenemos un entorno. El entorno puede ser:

+ Discreto o continuo.
+ Estático (No cambia mientras el agente delibera) o dinámico.
+ Determinista (Las acciones siempre funcionan como se espera) o estocástico.
+ Uniagente o multiagente.
+ Episódico (La calidad de las acciones no depende de las decisiones previas) o secuencial.
+ Parcial o totalmente observable.

El mundo del aspirador es de cada una de estas opciones la más sencilla excepto en el último caso, puesto que el mundo es parcialmente observable.

### 0.1.6 ¿Cómo determinar la calidad de un agente?
Hay que definir una medida del rendimiento que cuantifique el grado de éxito, que sea objetiva y externa, es decir, desde el punto de vista del entorno.

Para el mundo del aspirador, se podrían definir las siguientes:
+ Suciedad aspirada en un turno de 8 horas.
+ Tiempo total en que el suelo está limpio.
+ Suelo limpio sin demasiado consumo eléctrico.

Cada una tiene sus pegas, hay muchas variables que intervienen y que queremos optimizar.


### 0.1.7 Agente racional
Según Rusell y Norvig:
> Aquél que para cada posible secuencia de percepciones, realiza la acción que se espera que maximice su medida de rendimiento, basándose en la evidencia proporcionada por su secuencia de percepción y el conocimiento que el agente mantiene almacenado.

¿El agente aspirador es racional? Depende.
Supone que:

+ el entorno tiene una geometría conocida y una distribución inicial de suciedad desconocida,
+ aspirar limpia una casilla y ésta permanece limpia,
+ derecha e izquierda mueven al agente a la derecha y a la izquierda sin errores, salvo si le sacan del entorno, que permanece en su casilla,
+ la percepción de situación y suciedad siempre es correcta,
+ tiene cuatro acciones perfectamente definidas (aspirar, dcha, izda, noop),
+ función de agente descrita anteriormente,
+ rendimiento medido como 10 puntos por casilla limpia por instante de tiempo.

En ese caso sí es racional porque ningún otro agente obtendrá un mejor rendimiento esperado. Si el comportamiento parece defectuoso se puede definir otra medida de rendimiento, por ejemplo, suponer que no queremos al agente moviédose en un entorno limpio. Añadimos a la medida de rendimiento una penalización de 1 punto por cada movimiento.

Para maximizar el rendimiento, añadimos a la función de agente que si la secuencia de percepciones incluye ambas casillas limpias, la acción será noop.

### 0.1.8 _Racionalidad_ no es perfección y requiere aprendizaje
Un comportamiento perfecto requiere saber por adelantado el resultado de las acciones del agente: solo se pide maximizar el rendimiento esperado.

Excepto para entornos sencillos e invariables, el conocimiento inicial del agente no puede garantizar maximizar el rendimiento a largo plazo.

La racionalidad normalmente requiere aprendizaje para proporcionar autonomía al agente.

### 0.1.9 Ejemplos de agentes y descripción REAS (Medida de Rendimiento, Entorno, Actuadores y Sensores)

<!-- ¿ToDo? -->

### 0.1.10 Estructura de agente
La función de agente no se implementa, pues no se suele conocer. Se implementa el **programa de agente**, que usa solo la percepción actual del entorno y el conocimiento y memoria que pueda tener para seleccionar la acción actual.

La mayor parte de los principios subyacentes a los sistemas inteligentes se pueden describir con 5 tipos básicos de programas de agente:

+ Agente reactivo simple
+ Agente reactivo basado en modelos
+ Agente basado en metas
+ Agente basado en utilidad
+ Agentes que aprenden


0.2. Paradigmas principales
---------------------------


0.3. Áreas de aplicación y ejemplos
-----------------------------------


PDFs originales
===============

[Introduccion_Ingenieria_Conocimiento_-_Grado_Informatica.pdf](https://gitlab.com/adrm/apuntes-cuarto/uploads/0e5b0b24bbe2365ed9e7fb426979f78f/Introduccion_Ingenieria_Conocimiento_-_Grado_Informatica.pdf)

[LogicaProposicional_1_.pdf](https://gitlab.com/adrm/apuntes-cuarto/uploads/f65016fa387c5bc4d8dc78e150bc0eef/LogicaProposicional_1_.pdf)

[LogicaPredicados.pdf](https://gitlab.com/adrm/apuntes-cuarto/uploads/9dc3f7f9f52f7efd0620c5c12ed91501/LogicaPredicados.pdf)

[EstrategiasResolucion.pdf](https://gitlab.com/adrm/apuntes-cuarto/uploads/94d45be57079e8fdd37ed88f9eae60ed/EstrategiasResolucion.pdf)

[ProgramacionLogicaProlog.pdf](https://gitlab.com/adrm/apuntes-cuarto/uploads/524f88e12a22eae975780baefd34f5d6/ProgramacionLogicaProlog.pdf)
