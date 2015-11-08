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
- Átomos: funciones separadas por comas.
- Cláusulas: Construidas con átomos, se componen de una cabeza y un cuerpo separados con una flecha.

Si una cláusula solo tiene cabeza, se denomina **hecho** (cláusula unitaria de programa). Si tiene cabeza y cuerpo, es una **regla** (cláusula de programa). Si no tiene cabeza, se trata de una **pregunta o meta**.

Un **programa** es un conjunto finito de cláusulas de programa.

## Resolución SLD
SLD: Resolución lineal con función de selección para cláusulas definidas.

Si tenemos una cláusula de programa con el literal (el único positivo) `a` a la izquierda de la flecha, y una pregunta con uno o más `a_n` en el cuerpo y sin variables en común con la cláusula de programa, seleccionamos un literal de la pregunta a través de una función de selección. Si el literal seleccionado y `a` unifican con un umg, el **resolvente SLD** del programa y la pregunta es la meta en cuyo cuerpo están todos los literales de la pregunta hasta el seleccionado, el cuerpo del programa y el resto de los literales de la pregunta (sin el seleccionado) compuestos con el umg.

### Derivación SLD (Cómputo de G por P)


### Refutación SLD
Es la derivación SLD de la cláusula vacía.

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
## Anexo: árbol SLD
