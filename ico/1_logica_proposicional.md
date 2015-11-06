# Lógica proposicional
## Introducción
Es el lenguaje lógico simbólico más sencillo. Representa sentencias simples del lenguaje mediante **fórmulas atómicas** que se van componiendo.

## Lenguaje
### Sintaxis
**Símbolos proposicionales** que representan proposiciones. Representados por letras del final del abecedario en minúscula, normalmente empezando por la `p`.

**Conectores lógicos**:

- `¬`: Negación lógica (no)
- `^`: Conjunción lógica (y)
- `v`: Disyunción lógica (0)
- `⊃`: Condición lógica (implica)
- `<->`: Bicondición lógica (sí y solo sí)

**Símbolos auxiliares**, que son los paréntesis y ayudan a expresar precedencia.

Estos tres grupos no pueden compartir símbolos entre sí.

El **alfabeto proposicional** está compuesto por la unión de los símbolos proposicionales, los conectores lógicos y los símbolos auxiliares.

Una **fórmula atómica o átomo** es cualquier símbolo proposicional.

Una **fórmula bien formada** (FBF) es:

- Un átomo.
- La negación de otra FBF.
- La conjunción, disyunción, condición o bicondición de dos FBF.

Se usan convenios de asociatividad y prioridad de los conectores para reducir el uso de paréntesis.

### Semántica
Una **interpretación** sobre los símbolos proposicionales es una función que asigna a cada átomo un valor de verdad:

```
I: SP ---> {T, F}
```

Una **función de evaluación** de FBFs, a partir de una interpretación `I`, se define de la siguiente forma:

```
V: L_{AP} ---> {T, F}
```
- Para átomos, el valor de la función es el mismo que el de la interpretación.
- Para átomos negados, la negación del valor interpretado del átomo sin negar.
- Para el resto de FBFs, se siguen las reglas de los conectores lógicos y la interpretación de cada uno de los átomos.

## Modelo, consistencia y validez
Una interpretación es **modelo** de una FBF si la evaluación de la FBF devuelve un valor verdadero. Una interpretación es modelo de un conjunto finito de FBFs si la evaluación es verdadera para todas las FBFs. Es decir, el modelo de una FBF es una interpretación que la hace verdadera.

Una FBF es **consistente o satisfactible** si y solo si tiene un modelo. Un conjunto finito de FBFs lo es si tiene modelo.

Una FBF, o un conjunto finito de ellas, es **inconsistente o insatisfactible** si no es consistente.

Una FBF es **válida o tautológica** si y solo si la FBF es cierta bajo todas las interpretaciones de sus símbolos proposicionales.

## Satisfactibilidad
El **problema de la satisfactibilidad** es demostrar la consistencia o inconsistencia de un conjunto finito de fórmulas.

Para probar en lógica proposicional...

- la consistencia, hay que obtener una interpretación que valide las fórmulas.
- la inconsistencia y validez, por medio de tablas de verdad o refutación.

Para probar por refutación la inconsistencia de `γ ≡ ((p ⊃ q) ∧ (p ∧ ¬q))`, suponemos que existe una interpretación tal que `V(γ) = T`, lo que implica que `V(p ⊃ q) = V(p ∧ ¬q) = T`, cosa que no puede ser cierta así que queda demostrado.

Para probar con tablas de verdad la inconsistencia de la misma FBF habría que considerar 2³ interpretaciones y una tabla con 7 entradas, mucho más costoso.

Una lógica es **decidible** si el problema de la satisfactibilidad es computable en esa lógica. Es decir, si se puede dar un procedimiento de cómputo que para cualquier conjunto finito de FBFs como entrada, devuelva si es o no consistente.

La lógica proposicional es decidible porque siempre se puede recurrir a las tablas de verdad. Sin embargo el problema es NP y O(2^n).

## Equivalencia
Dos FBFs son **equivalentes** (α = β) si y solo si ambas tienen los mismos valores de verdad bajo cualquier interpretación.

Leyes de equivalencia:

- Eliminación del bicondicional: conjunción de condicionales.
- Eliminación del condicional: (α ⊃ β) = (¬α ∨ β)
- Conmutativa de la conjunción y la disyunción.
- Asociativa de la conjunción.
- Distributiva de disyunción respecto de conjunción.
- Absorción:
- Contradicción:
- Exclusión de los medios:
- Idempotencia:
- Doble negación:
- De Morgan:
<!-- TODO Mirar bien leyes de equivalencia -->

## Consecuencia lógica
Una FBF es **consecuencia lógica** de una serie de premisas (más FBFs) si y solo si todo modelo de las premisas es modelo de la consecuencia lógica. Se denota por `α1, α2, ...  , αn |= α`.

### Teorema de refutación
Sean α, α1, α2, ...  ,αn FBF’s. Las siguientes expresiones son equivalentes

1. α1, α2, ..., αn |= α
2. ((α1 ∧ α2 ∧ ... ∧αn) ⊃ α) es una tautología
3. (α1 ∧ α2 ∧ ... ∧ αn ∧ ¬α) es inconsistente

El interés del teorema es que 3. nos proporciona un método para comprar si una fórmula es consecuencia lógica de unas premisas. (Si la negación de una FBF produce una FBF inconsistente al ponerlo en conjunción con una conjunción de FBFs, quiere decir que la FBF es una consecuencia lógica de las otras) <!-- TODO Creo -->
