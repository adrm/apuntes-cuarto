# Estrategias de resolución
## Introducción
La utilidad de la lógica simbólica radica en la representación de problemas mediante fórmulas bien formadas (a través de teorías, conjuntos de FBFs consistentes) y en solucionar problemas de forma deductiva usando reglas de inferencia de la lógica y el proceso de búsqueda en el espacio de las FBFs.

La dificultad es que la aplicación no controlada de reglas de inferencia da lugar a un problema de explosión combinatoria. El número de FBFs generadas crece exponencialmente.

## Refutación por resolución
Los **métodos uniformes de demostración** utilizan una única regla de inferencia, siendo una forma de reducir la complejidad de la búsqueda, pero requieren transformar las fórmulas a un formato estándar.

Existen dos aproximaciones básicas:

- **Sistemas de resolución**: Hay que transformar las FBF a forma de cláusula y aplicar la resolución hasta generar la cláusula vacía. Se reduce la complejidad sin limitar la capacidad de representación seleccionando las estrategias adecuadas.
- **Programación lógica**: Solo admite cláusula de Horn. Se realiza a través de la resolución SLD. Reduce la complejidad limitando la capacidad de representación a las cláusulas de Horn.

La **refutación por resolución** dice que para probar que una sentencia es consecuencia lógica de una serie de premisas (`Ω |= α`), hay que probar que la unión de las premisas con la negación de la sentencia (`Ω ∪ ¬α`) es inconsistente. Usa por tanto una única regla de inferencia: la resolución.

El procedimiento para la refutación por resolución es el siguiente:

Sea `T` una teoría sólida y completa (axiomas), y `t` una FBF (teorema). Para probar que existe una teoría `T` que prueba `t` (`∃ T ⊢ t`) mediante refutación por resolución:

1. Convertir los axiomas de `T` a forma normal conjuntiva (FNC) y crear el conjunto `S_0` como la conjunción de todas las cláusulas obtenidas.
2. Negar `t` y convertir a FNC. Añadir las cláusulas obtenidas a `S_0`, obteniendo `S`.
3. Repetir hasta obtener cláusula vacía o no se generen nuevas cláusulas; seleccionar dos cláusulas que se puedan resolver (buscar su unificador más general y obtener la resolvente). Si el resolvente no es cláusula vacía, añadir a `S`.

La lógica proposicional es decidible así que el algoritmo siempre termina, ya sea generando cláusula vacía y por tanto `S` es inconsistente y `t` es consecuencia lógica de `S_0` y de la teoría `T`, o bien no se generan neuvas resolventes en cuyo caso `S` es consistente y `t` no es consecuencia lógica de `S_0` ni `T`.

La lógica de primer orden es semi-decidible, puede que el cómputo de nuevas resolventes no termine y el proceso finalice por consumo de recursos. Por tanto, si el cómputo termina las conclusiones son las mismas que para la lógica proposicional. Pero si termina por consumo de recursos, no sabemos nada y ambas opciones serían posibles.

## Estrategias de resolución
La generación incontrolada de cláusulas hace que estas crezcan de forma exponencial. Por tanto se hace necesario planear estrategias que eviten esta explosión combinatoria.

Se puede simplificar (eliminando o reemplazando), dirigir (eligiendo la siguiente cláusula a considerar) o restringir (evitando la generación de resolventes).

Una estrategia de resolución es **completa** para la refutación si y solo si, usada con una regla de inferencia completa, garantiza que encuentra una derivación de la cláusula vacía a partir de una forma clausulada inconsistente. La regla de resolución es completa para la refutación.

### Estrategias de dirección: saturación por niveles
Siendo `S` el conjunto de todas las cláusulas de partida, `S⁰=S`. Si `k` pertenece a `S`, `k` es una cláusula de nivel 0. Los sucesivos conjuntos `S^i` (niveles) se forman con la resultante entre una cláusula de los niveles previos y otra del nivel inmediatamente anterior. La estrategia es obtener primero todas las resolventes de un nivel antes de obtener resolventes del siguiente. Es completa pero ineficiente.

### Estrategias de simplificación
#### Eliminación de literales puros
Un literal es un **literal puro** si y solo si no existe ningún otro literal negado que unifica con él. Es decir, `L` es un literal puro si y solo si no existe ningún `¬L'` tal que `L` y `L'` unifiquen.

La **estrategia de eliminación de literales puros** consiste en eliminar todas las cláusulas que contengan literales puros, solo al conjunto inicial. Es una estrategia completa.

#### Eliminación de tautologías
Las cláusulas tautológicas no afectan a la satisfactibilidad, por lo que la **estrategia de eliminación de tautologías** consiste en eliminar dichas cláusulas, tanto iniciales como las que se vayan generando. Es una estrategia completa.

#### Eliminación de cláusulas subsumidas
Una cláusula **subsume** a otra si y solo si todos los literales que aparecen en ella aparecen también en la otra, bien sin sustituciones o si existe una sustitución que haga cumplir la condición.

La **estrategia de eliminación de cláusulas subsumidas** puede ser hacia adelante si la resolvente puede ser subsumida o hacia atrás si la resolvente puede subsumir.

Es completa cuando se usa con saturación por niveles, pero puede que no lo sea con alguna otra estrategia de restricción. Es muy eficiente, su aplicación suele ser imprescindible.

#### Asociación de procedimientos
Consiste en evaluar funciones o literales básicos sobre un dominio. Afecta a la satisfactibilidad pues estamos fijando una interpretación parcial. No es completa.

**Evaluar una función** consiste en asociar un símbolo de función con un procedimiento cuya evaluación devuelva un elemento del dominio, reemplazando el término funcional por el elemento del dominio.

**Evaluar un literal** consiste en asociar un símbolo de predicado con un procedimiento cuya evaluación devuelva un valor de verdad. Si el literal evalúa a un valor verdadero, eliminar la cláusula. Si evalúa a un valor falso, eliminar el literal de la cláusula.

### Estrategias de restricción
#### Estrategia del conjunto soporte
Un **conjunto soporte** es un subconjunto de una forma clausulada distinto de ésta y distinto del conjunto vacío.

Un **conjunto soporte de nivel i-ésimo** es el conjunto soporte de las resolventes... <!-- TODO completar -->

Una cláusula tiene **T-soporte** si dicha cláusula pertenece a un conjunto soporte de algún nivel.

La **estrategia del conjunto soporte**... <!-- TODO completar -->

**Teorema del conjunto soporte**... <!-- TODO completar -->

#### Resolución lineal
Se elige una cláusula central de partida y solo permite obtener como resolventes otras cláusulas centrales que sean resolvente de la cláusula central anterior y otra distinta.

Teorema complitud resolución lineal... <!-- TODO completar -->

#### Resolución por entradas
Las **cláusulas de entrada** son las del conjunto base. Las **resolventes de entrada** son aquellas con al menos un padre cláusula de entrada.

La **estrategia de resolución por entradas** solo permite obtener resolventes de entrada. No es completa.

#### Resolución unitaria
Un **resolvente unitario** es aquel en el que al menos una de las cláusulas padre es unitaria.

La **estrategia de resolución unitaria** solo permite obtener resolventes unitarios. No es completa.

##### Teorema de equivalencia de la resolución unitaria y por entradas
Se puede llegar a la cláusula vacía a través de la resolución unitaria si y solo si se puede llegar con la resolución por entradas.

#### Cláusulas de Horn
Una **cláusula de Horn** es aquella que tiene, a lo sumo, un literal positivo. Por tanto, se pueden interpretar como implicaciones con el literal positivo a la derecha del símbolo de implicación.

**Teorema complitud resolución por entradas (unitaria)** <!-- TODO Completar -->

## Procedimiento de extracción de respuesta
Consiste en extraer la respuesta mediante la refutación por resolución. Es el proceso de encontrar los elementos del dominio que hacen cierto el teorema a demostrar.

Las **preguntas** son, en general, cualquier FBF; pero por motivos prácticos se usan sentencias en forma normal prenexa (FNP) con una matriz en forma de conjunción de literales y un prefijo que contiene solo cuantificadores existenciales (`∃ x ∃ y(P(x) ∧ Q(x, y))`). De esta forma, la negación de estos teoremas da lugar a una única cláusula.

Un **literal respuesta** es la respuesta para todas las variables que ocurren en una pregunta. Para obtener la respuesta hay que negar la pregunta para transformarlo en cláusulas, formar la disyunción de las cláusulas obtenidas con el literal respuesta y buscar derivaciones de cláusulas que solo contengan literales respuestas.

La respuesta puede contener más de un literal y no es única, sino que depende de la derivación que la produce.

## Demostradores de teoremas
Son programas que dada una teoría y una FBF intentan comprobar si existe un conjunto de axiomas propios que demuestran dicha FBF. Generalmente aceptan FBFs de la lógica de primer orden como entrada. Suelen estar basados en refutación por resolución. Aplican estrategias de control para limitar la búsqueda.

### Prolog Technology Theorem Prover (PTTP)
Búsqueda con descenso iterativo. Completa. La inferencia es completa con la regla de resolución lineal y por entradas. Se implementa una rutina para probar `P` y otra para probar `¬P` (negación lógica). Reintroduce chequeo de ocurrencias en la unificación.

### Organized Techniques for Theorem-proving and Effective Research (OTTER)
Es uno de los primeros y más populares demostradores de teoremas y aplica refutación por resolución. Se usa en investigación matemática y verificación de hardware.

Como entrada recibe hechos importantes sobre el dominio (conjunto de soporte, etc), conocimiento sobre el problema (axiomas de utilidad), demoduladores (reglas de reescritura) y parámetros y cláusulas que definen la estrategia de control.
