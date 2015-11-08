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
Un **literal puro**...<!-- TODO -->

La **estrategia de eliminación de literales puros** consiste en eliminar todas las cláusulas que contengan literales puros, solo al conjunto inicial. Es una estrategia completa.

#### Eliminación de tautologías
Las cláusulas tautológicas no afectan a la satisfactibilidad, por lo que la **estrategia de eliminación de tautologías** consiste en eliminar dichas cláusulas, tanto iniciales como las que se vayan generando. Es una estrategia completa.

#### Eliminación de cláusulas subsumidas
Una cláusula **subsume** a otra si y solo si todos los literales que aparecen en ella aparecen también en la otra.

La **estrategia de eliminación de cláusulas subsumidas** puede ser hacia adelante si la resolvente puede ser subsumida o hacia atrás si la resolvente puede subsumir.

Es completa cuando se usa con saturación por niveles, pero puede que no lo sea con alguna otra estrategia de restricción. Es muy eficiente, su aplicación suele ser imprescindible.

#### Asociación de procedimientos
Consiste en evaluar funciones o literales básicos sobre un dominio. Afecta a la satisfactibilidad pues estamos fijando una interpretación parcial. No es completa.

**Evaluar una función** consiste en asociar un símbolo de función con un procedimiento cuya evaluación devuelva un elemento del dominio, reemplazando el término funcional por el elemento del dominio.

**Evaluar un literal** consiste en asociar un símbolo de predicado con un procedimiento cuya evaluación devuelva un valor de verdad. Si el literal evalúa a un valor verdadero, eliminar la cláusula. Si evalúa a un valor falso, eliminar el literal de la cláusula.

### Estrategias de restricción
#### Estrategia del conjunto soporte
Un **conjunto soporte** es un subconjunto de una forma clausulada distinto de ésta y distinto del conjunto vacío.



#### Resolución lineal


#### Resolución por entradas
#### Resolución unitaria

## Procedimiento de extracción de respuesta
Consiste en extraer la respuesta mediante la refutación por resolución. Es el proceso de encontrar los elementos del dominio que hacen cierto el teorema a demostrar.

## Demostradores de teoremas
Son programas que dada una teoría y una FBF intentan comprobar si existe un conjunto de axiomas propios que demuestran dicha FBF. Generalmente aceptan FBFs de la lógica de primer orden como entrada. Suelen estar basados en refutación por resolución. Aplican estrategias de control para limitar la búsqueda.

### Prolog Technology Theorem Prover (PTTP)

### Organized Techniques for Theorem-proving and Effective Research (OTTER)
