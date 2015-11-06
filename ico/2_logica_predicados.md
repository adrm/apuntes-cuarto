# Lógica de predicados
## Introducción
Las fórmulas atómicas solo representan proposiciones simples, no permite acceder a los elementos de la proposición. La **lógica de primer orden o lógica de predicados** incluye el concepto de **término**, un componente de la fórmula atómica que referencia a los elementos que las forman.

Si se consideran las sentencias "Confucio es un hombre" y "todos los hombres son mortales", en lógica proposicional se representaría como "p ^ q". En lógica de predicados, podría representarse como "H(c) ^ para todo x tal que H(x) -> M(x)", permitiendo deducir que "M(s)" (Sócrates es mortal) si introducimos "H(c)" (Sócrates es un hombre), cosa que no podríamos haber deducido en lógica proposicional.

## Lenguaje de la lógica de primer orden
### Sintaxis
Las fórmulas del lenguaje se construyen con los siguientes **símbolos**:

- Constantes: Mayúsculas, palabras comenzando por una mayúscula.
- Funciones: Minúsculas con un entero asociado denominado grado o aridad que indica la cantidad de argumentos que tomará el símbolo de función, pero no suele representarse.
- Predicados: Mayúsculas, palabras en mayúsculas. También tienen asociado un grado o aridad.
- Variables: Minúsculas, puede que con subíndice para identificarlas más fácilmente.
- Conectores lógicos: ¬, ∨, ∧, ↔, ⊃
- Cuantificadores: Cuantificador universal (para todo) ∀ y cuantificador existencial (existe) ∃.
- Símbolos auxiliares: Paréntesis y coma.

Un **vocabulario** es una cuádrupla <C, F, P, d> donde C son los símbolos de constante, F los de función, P los de predicado y d la función que da la aridad de los símbolos de función y predicado. Los elementos de cualquiera de los conjuntos C, F y P no pueden estar en cualquier otro de esos conjuntos. Además, suponemos que no contienen símbolos de variable, conectores lógicos, cuantificadores o símbolos auxiliares.

> Una definición más adecuada elimina el conjunto C y considera los símbolos de constante como símbolos de función de grado 0.

Los **términos** de un vocabulario son sus constantes, variables, y funciones con tantos términos como parámetros como aridad tengan. Los términos denotan objetos. Una constante referencia siempre al mismo elemento, una variable representa a un elemento concreto dependiendo del contexto, y una función referencia a un elemento concreto de forma indirecta.

Las **fórmulas atómicas o átomos** son predicados con sus términos. Expresan relaciones entre los objetos que representan sus términos. Por ejemplo, la fórmula atómica H(s) puede significar que Sócrates es un hombre, y la fórmula PADRE(pepe, ana) puede significar que Pepe es el padre de Ana.

Una **fórmula bien formada** es una fórmula atómica, la negación de una FBF, la relación con conectores lógicos de dos FBFs, o la aplicación de cuantificadores a una FBF. Un conjunto de FBFs forman un lenguaje de primer orden sobre W denominado $L^1_w$, o $L^1$ si W es fijo.

El **alcance** de un cuantificador $Q$ sobre una FBF $Qx\alpha$, es $\alpha$.

Una ocurrencia de una variable está **ligada** si y solo si es la ocurrencia del cuantificador o está en el alcance de un cuantificador sobre esa variable.

Una ocurriencia de una variable es **libre** si no está ligada.

### Semántica
Una **interpretación** de un vocabulario es un par formado por el dominio o universo de discurso y una **función de interpretación**, que se define como:
<!-- TODO completar -->

A partir de una interpretación se define de forma única una **función de evaluación de términos y átomos** de la siguiente forma: <!-- TODO completar -->

Una **interpretación modificada** <!-- TODO completar -->

**Evaluación de términos y fórmulas atómicas modificada** <!-- TODO completar -->

A partir de una función de evaluación de términos y fórmulas atómicas se define de forma únca una **función de evaluación de FBFs** de la siguiente forma: <!-- TODO completar -->

Se dice que **una FBF es cierta bajo una interpretación** o **una interpretación satisface una FBF** si y solo si la evaluación de la FBF a partir de una interpretación es verdadera. Si no, la FBF es **falsa** bajo esa interpretación.

Una **sentencia o fórmula cerrada** es una FBF en la que no hay ocurrencias de variables libres.

<!-- TODO Faltan los lemas -->

## Modelo, consistencia y validez
Una interpretación es un **modelo** de una sentencia si y solo si la evaluación de esa sentencia bajo esa interpretación es verdadera. Es modelo de un conjunto finito de sentencias si y solo si es modelo de cada una de las sentencias.

Una sentencia es **consistente o satisfactible** si y solo si tiene un modelo. Un conjunto finito de sentencias lo es si tiene un modelo.

Una sentencia es **inconsistente o insatisfactible** si y solo si no es consistente. Un conjunto finito de sentencias es inconsistente si y solo si no es consistente.

Una sentencia es **válida o tautológica** si y solo si es cierta bajo todas las interpretaciones del lenguaje.

## Satisfactibilidad
Una lógica es **semi-decidible** si el problema de la satisfacibilidad no es computable en dicha lógica, pero se puede dar un procedimiento de cómputo que para cualquier conjunto finito de sentencias inconsistente termine indicando su inconsistencia. Por tanto, no se garantiza que el proceso termine para cualquier conjunto finito de sentencias.
