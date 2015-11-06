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
Una lógica es **semi-decidible** si el problema de la satisfacibilidad no es computable en dicha lógica, pero se puede dar un procedimiento de cómputo que para cualquier conjunto finito de sentencias inconsistente termine indicando su inconsistencia. Por tanto, no se garantiza que el proceso termine para cualquier conjunto finito de sentencias. La lógica de primer orden es semi-decidible.

En la práctica, un procedimiento para comprobar la inconsistencia de un conjunto finito de sentencias puede terminar normalmente indicando la consistencia o inconsistencia o terminar porque se queda sin recursos. En este último caso, el conjunto de sentencias puede ser inconsistente o no.

## Equivalencia
Dos sentencias son equivalentes si tienen los mismos valores de verdad para cualquier interpretación de un vocabulario.

Las leyes de equivalencia son las siguientes:

- Eliminación del bicondicional: conjunción de condicionales.
- Eliminación del condicional: (α ⊃ β) = (¬α ∨ β)
- Conmutativa de la conjunción y la disyunción.
- Asociativa de la conjunción.
- Distributiva de disyunción respecto de conjunción y viceversa.
- Absorción: La conjunción de una FBF con otra válida es equivalente a la primera FBF. La disyunción con una inconsistente también.
- Contradicción: La conjunción de una FBF con su opuesto o con una FBF inconsistente es equivalente a una FBF inconsistente.
- Exclusión de los medios: La disyunción de una FBF con su opuesto o con una FBF válida es equivalente a una FBF válida.
- Idempotencia: La conjunción o disyunción de una FBF consigo misma es equivalente a la FBF.
- Doble negación.
- De Morgan: Negación de la conjunción, disyunción de negaciones. Negación de la disyunción, conjunción de negaciones.
- La conjunción o disyunción de una FBF sin ocurrencias libres de `x` con una FBF cuantificada es equivalente a la cuantificación de la conjunción o disyunción de la primera FBF con la FBF cuantificada.
- De Morgan con cuantificadores: La negación de un cuantificador es equivalente al cuantificador contrario aplicado a la negación de la FBF cuantificada.
- Distributiva de la conjunción respecto del cuantificador universal y viceversa.

Cambiar FBFs dentro de una FBF por sus equivalentes, o cambiar el nombre de las variables en una FBF genera FBFs equivalentes. <!-- TODO Falta lema 6 -->

## Consecuencia lógica
Una sentencia es **consecuencia lógica** de una serie de premisas si y solo si todo modelo de las premisas es un modelo de la sentencia.

### Teorema de refutación
Al igual que con FBFs, pero con sentencias.

## Reglas de inferencia
Las **reglas de inferencia** son reglas de manipulación sintáctica que permiten generar nuevas fórmulas a partir de unas fórmulas dadas.

Un **patrón de FBF** es un esquema de FBF que consta de ocurrencias de conectores lógicos, símbolos auxiliares y variables cuyo rango es el conjunto de FBFs. A partir de un esquema se obtienen FBFs remplazando las variables por otras FBFs.

Una **regla de inferencia** es una estructura con la forma `antecedente → consecuente`, donde el **antecedente o premisas** y el **consecuente** son secuencias de patrones de FBF. Una regla de inferencia se puede aplicar si los patrones del antecedente se pueden particularizar a fórmulas de un conjunto finito de FBFs, y si su efecto es obtener las FBFs resultantes de particularizar el consecuente. <!-- TODO repasar lo de cuándo se pueden aplicar las reglas de inferencia -->

Una regla de inferencia es **sólida** si y solo si las fórmulas que permite generar son consecuencia lógica de las fórmulas sobre las que se aplica.

Las reglas de inferencia más comunes son las siguientes:

- Modus Ponens: `α ⊃ β, α → β`
- Modus Tollens: `α ⊃ β, ¬β → ¬α`
- Abducción: `α ⊃ β, β → α`
- Eliminación and: `α ∧ β → α, β`
- Instanciación universal: `∀xα → β`, donde `β` se obtiene reemplazando las ocurrencias libres de `x` en `α` por un término `t` que sea libre respecto a `x` en `α`, condición que se cumple si y solo si `x` no ocurre, en `α`, en el alcance de un cuantificador de una variable de `t` salvo, quizás, la propia `x`. <!-- TODO repasar IU -->

### Teoría
Dado un conjunto finito de FBFs, un conjunto finito de reglas de inferencia y una secuencia de FBFs, dicha secuencia es una **derivación** de una de las FBFs a partir del conjunto finito de FBFs usando el conjunto de reglas de inferencia si y solo si para todas las FBFs de la secuencia o bien pertenecen al conjunto finito de FBFs, o bien existen fórmulas previas de la secuencia y una regla de inferencia del conjunto que permiten generarla. <!-- TODO Aclarar esto -->

La existencia de una **prueba** se denota por `Ω |-- R α`, siendo `Ω` el conjunto finito de FBFs, `R` el conjunto finito de reglas de inferencia, y `α` la FBF derivada.

Un **axioma propio** es un conjunto finito de FBFs consistente.

Una **teoría de axiomas propios** es el conjunto de axiomas propios de una lógica. La teoría se denomina por $Th(AP)L$., donde $AP$ son los axiomas propios y $L$ la lógica.

Dada una teoría, una FBF y un conjunto de reglas de inferencia, esa FBF es un **teorema** de la teoría usando las reglas de inferencia si la FBF es una prueba de la teoría.

Una teoría es **sólida** si y solo si todos sus teoremas son consecuencia lógica de sus axiomas propios, y es **completa** si y solo si todas las consecuencias lógicas de sus axiomas propios son teoremas de la teoría.

## Unificación
La **unificación** es un procedimiento que permite comprobar si, dadas dos fórmulas cuantificadas universalmente, la regla de inferencia de instanciación universal permite obtener otras dos fórmulas no cuantificadas de modo que éstas sean sintácticamente iguales. Esta comprobación suele ser un paso previo a la aplicación de cualquier regla de inferencia.

### Sustituciones
Una **ligadura** es un par ordenado formado por un término y una variable que no ocurra en dicho término. Se representa como `t / x`.

Una **sustitución** es un conjunto finito de ligaduras tales que no hay dos variables (segundo término de la ligadura) iguales, y ninguna variable (de las del segundo término) ocurre en ningún término.

Una **expresión** es un término o una FBF.

Una **particularización por sustitución** de una expresión mediante una sustitución a la expresión obtenida sustituyendo las variables de la expresión ligadas en la sustitución por los términos de sus ligaduras correspondientes. Si la particularización no contiene variables, se denomina **particularización básica**.

Dos expresiones son **variante alfabética** si y solo si se diferencian en el nombre de las variables.

La sustitución $s2$ sería **distinta** de la sustitución $s1$ si y solo si ninguna variable ligada de $s1$ ocurre en $s2$.

Si $s2$ es distinta a $s1$, se denomina **composición** de $s2$ con $s1$ y se denota $s2s1$ a la sustitución obtenida aplicando $s2$ a los términos de $s1$ y añadiendo al conjunto resultante las ligaduras de $s2$

### Unificador más general
La **particularización del conjunto finito de expresiones** `C` por la sutitución `s` se denomina `Cs` y se define como la aplicación de `s` a cada expresión de `C` eliminando las particularizaciones repetidas.

`s` es un **unificador** de `C` si y solo si `Cs` tiene un único elemento. En ese caso, se dice que `C` es **unificable**.

Siendo `g` un unificador de `C`, `g` es el **unificador más general** si y solo si para cualquier otro unificador de `C` existe una sustitución que al ser compuesta con `g` es equivalente a ese unificador.

**Teorema de unificación**: si un conjunto finito de expresiones es unificable, su unificador más general existe y es único salvo variantes alfabéticas.

## Algoritmo de unificación
El **conjunto de desacuerdos** de un conjunto finito de expresiones se obtiene localizando el primer símbolo por la izquierda en el que no todas las expresiones del conjunto tienen el mismo símbolo, y extrayendo de cada expresión la subexpresión que comienza por el símbolo que ocupa dicha posición.

El **algoritmo de unificación** tiene como entrada un conjunto finito de expresiones `Ω`, y como salida, el unificador más general de dicho conjunto o fallo si el conjunto no es unificable. El algoritmo es:

1. Hacer `k = 0, Ω_k = Ω, s_k = 0`.
2. Si `Ω_k` tiene más de un elemento, crear su conjunto de desacuerdos. En caso contrario, devolver `s_k`, que es el unificador más general del conjunto de entrada.
3. Si no existen `v_k, t_k` en el conjunto de desacuerdos tales que `v_k` no ocurra en `t_k`, devolver fallo pues `Ω` no es unificable.
4. Elegir `v_k, t_k` tales que `v_k` no ocurra en `t_k` y hacer `s_{k+1} = s_k·{t_k / v_k}` y `Ω_{k+1} = Ω_k · {t_k}`
5. Hacer `k = k+1` e ir a 2.
