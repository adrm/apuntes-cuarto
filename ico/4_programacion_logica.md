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

## Intérprete abstracto de un programa lógico
## Concepto de respuesta
## Programación lógica y negación
## Una implementación práctica: prolog estándar
## Anexo: árbol SLD
