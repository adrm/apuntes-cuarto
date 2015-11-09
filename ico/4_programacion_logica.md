# Programación lógica y prolog
## Introducción a la programación lógica
La **programación lógica** es la parte de la informática que se ocupa de la lógica como lenguaje de programación.

En este paradigma, un **programa** es un conjunto finito de FBFs, y la **computación** es la obtención de pruebas formales.

Una **cláusula definida** es aquella que tiene, a lo sumo, un literal positivo. En programación lógica se representa como `a <-- b1, b2, ..., bn` siendo `a` el único literal positivo de haberlo. Los `b` representan los literales que eran negativos en la fórmula clausal, pero se representan sin la negación en programación lógica. Además, todas las variables se consideran cuantificadas universalmente.

La parte izquierda de la flecha se denomina **cabeza** de la cláusula, y la parte derecha es el **cuerpo** de la cláusula.

### Caracterización de programas lógicos

- Programas definidos: Cláusulas de Horn o definidas.
- Programas normales: Cláusulas normales como extensión de la cláusula de Horn admitiendo literales negativos en el cuerpo de las cláusulas.
- Programas: Cualquier FBF.

## Programas definidos: sintaxis de Edimburgo

- Términos: constantes numéricas o atómicas, variables y funciones.
- Átomos: funciones con sus parámetros.
- Cláusulas: Construidas con átomos, se componen de una cabeza y un cuerpo separados con una flecha.

Si una cláusula solo tiene cabeza, se denomina **hecho** (cláusula unitaria de programa). Si tiene cabeza y cuerpo, es una **regla** (cláusula de programa). Si no tiene cabeza, se trata de una **pregunta o meta**.

Un **programa** es un conjunto finito de cláusulas de programa.

## Resolución SLD
SLD: Resolución lineal con función de selección para cláusulas definidas.

Si tenemos una cláusula de programa con el literal (el único positivo) `a` a la izquierda de la flecha, y una pregunta con uno o más `a_n` en el cuerpo y sin variables en común con la cláusula de programa, seleccionamos un literal de la pregunta a través de una función de selección. Si el literal seleccionado y `a` unifican con un umg, el **resolvente SLD** del programa y la pregunta es la meta en cuyo cuerpo están todos los literales de la pregunta hasta el seleccionado, el cuerpo del programa y el resto de los literales de la pregunta (sin el seleccionado) compuestos con el umg.

O, dicho de otra forma: se escoge con una función de selección (regla de cómputo) un átomo de la pregunta. Se unifica con alguna cabeza de las cláusulas de programa. La resolvente genera una nueva pregunta consistente en la pregunta anterior sin el átomo unificado más el cuerpo de la cláusula de programa con la que se unificó, aplicando el umg que se usó para unificar los dos átomos.

### Derivación SLD (Cómputo de G por P)
Sean `P` un programa y `G` una meta. una **derivación SLD de `P U {G}`** consiste en tres secuencias, posiblemente infinitas, de metas, cláusulas de P renombradas y umg's de una cláusula renombrada con la meta de la cláusula previa; tal que la meta de la cláusula siguiente es el resolvente SLD de la meta actual y la cláusula de P siguiente, usando el siguiente umg. <!-- TODO Esto no está muy claro... -->

La **refutación SLD** es la derivación SLD de la cláusula vacía.

## Intérprete abstrácto de un programa lógico
Trata de unificar el átomo elegido de la meta con la cabeza de cláusulas renombradas del programa. Si alcanza la cláusula vacía, devuelve la meta con los unificadores aplicados. Si no puede unificar con ninguna cabeza, devuelve fallo.

Este tipo de intérpretes tienen que elegir la regla de cómputo (el literal sobre el que se resuelve, dado por la función de selección) y la regla de búsqueda (criterio de selección de la cláusula que resuelve o reduce la meta). La regla de cómputo es arbitraria, no afecta a la terminación, como mucho al orden de las respuestas. La regla de búsqueda no es determinista y sí afecta a la terminación.

### Concepto de respuesta
Una **respuesta para `P U {G}`** es una sustitución para las variables de `G` o "No".

Una respuesta es **correcta** si y solo si es consecuencia lógica del programa. "No" también es respuesta correcta si y solo si `P U {G}` es satisfactible.

Una respuesta es **computada** si y solo si es la sustitución obtenida seleccionando de todas las sustituciones intermedias las ligaduras de las variables que ocurren en `G`.

### Teorema de solidez de la resolución SLD
Toda respuesta computada de la unión de un programa con una meta definida también es correcta.

### Teorema de complitud de la resolución SLD
La respuesta computada puede ser más general que la correcta.

### Diferencias entre la respuesta correcta y la computada
Puede que no se computen respuetas pero sí haya respuestas correctas.

### Teorema de la independencia de la regla de cómputo
Si se usan reglas de cómputo distintas, las respuestas obtenidas son variantes alfabéticas.

## Intérprete abstracto de un programa lógico
## Concepto de respuesta
## Programación lógica y negación
Un **programa definido** es un conjunto de hechos y reglas que describen explícitamente qué es cierto, sin información explícita sobre qué es falso.

## Una implementación práctica: prolog estándar
Prolog implement a un modelo de programación lógica de forma secuencial. Sirve para programas normales. Usa como regla de cómputo el primer literal a la izquierda, y como regla de búsqueda el primero en profundidad (con backtracking).

Prolog no es completo por la regla de búsqueda que usa. Tampoco es sólido porque SLDNF (al usar programas normales y no programas definidos) no lo es. Por eso es bueno evitar variables libres en literales negativos seleccionados no incluyéndolos o intentando forzar la ligadura operacionalmente.

Prolog se desvía del modelo lógico porque no comprueba ocurrencias, da respuestas computadas no correctas y puede producir bucles infinitos. Introduce el operador de corte, que impide explorar un subárbol del árbol SLD pero afecta a la complitud de programas definidos y normales y a la solidez de los normales.

## Anexo: árbol SLD
