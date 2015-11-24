# Representación de conocimiento: Sistemas Basados en Reglas (SBR) ([PDF](originales/representacion_conocimiento/SBR - Completo.pdf))
## Introducción
Los **sistemas basados en reglas** o **sistemas de producción** se caracterizan por utilizar una única estructura para representar el conocimiento: la **regla**.

El esquema de la regla está compuesto por dos partes que se pueden denominar de distinta manera:

- condición -> acción
- antecedente -> consecuente
- lado izquierdo -> lado derecho (LHS -> RHS)
- si ... entonces ...

El interés por este tipo de sistemas radica en que es un formalismo adecuado para representar conocimiento heurístico a través de asociaciones entre los elementos del antecedente y del consecuente. Existen numerosos dominios (parcialmente) gobernados por reglas deterministas.

Es un acercamiento popular por su sencillez, ya que usa una única estructura, y por su eficiencia, pues sus mecanismos deductivos son computacionalmente más eficientes que los de la lógica.

## Componentes
- Base de conocimiento (BC, KB).
	- Base de reglas (BR): conjunto de reglas de producción.
	- Declaración de dominio: declaración de los elementos básicos que se referencian en hechos y reglas.
- Memoria de trabajo (MT, WM). Conjunto de hechos. Información que se considera cierta.
- Motor de inferencias (MI, IE). Genera nuevos hechos a partir de la memoria de trabajo usando la base de reglas.

## Lenguajes
Los elementos básicos de la representación son los **hechos**, que representan información que se posee relevante a una instancia o problema concreto, y las **reglas**, que es el conocimiento sobre el dominio del problema que permite derivar hechos adicionales.

Variantes <!-- TODO -->

### Lenguaje objeto-atributo-valor
El universo se conceptualiza en tripletes objeto, atributo y valor. El objeto representa aquello de lo que queremos hablar, el atributo una propiedad del objeto, y el valor es el valor de dicha propiedad. En un hecho, se establece el valor del atributo de un objeto. En una regla, se usan para derivar nuevo conocimiento.

### Declaración de dominio
Se puede dar un conunto definido de objetos (**declaración de objetos**) y una **declaración de atributos** (DA) que puede ser univaluada o multivaluada según si ese atributo puede tener más de un valor a la vez, y tipada o no tipada según si los valores que puede tomar son los que forman parte de un conjunto definido.

<!-- TODO Representación de DA -->

A partir de la declaración de objetos (O) y de la declaración de atributos (DA), la **declaración de dominio** es $DD = O \cup DA$

### Hechos en objeto-atributo-valor
Univaluado: $O_i.a=c, si x^s:\tau, c \epsilon \tau$

Multivaluado: $O_i.a=C, si x^m:2^\tau, C \epsilon \tau$

### Memoria de trabajo
La **memoria de trabajo** se considera formalmente como un conjunto (sin elementos repetidos, orden irrelevante) que contiene los hechos.

Ejemplo: $H = \lbrace paciente-1.sexo = varón, paciente-1.edad=25, paciente-1.sintoma=\lbrace dolorPecho, calambresPiernas \rbrace, ... \rbrace$


### Reglas en objeto-atributo-valor
<!-- En la diapo 23 está la sintaxis BNF -->

Una regla en lenguaje natural podría ser:

```
Si el paciente tiene un dolor abdominal y
	en la auscultación se percibe un rumor abdominal y
	se siente una masa pulsante en el abdomen
entonces el paciente tiene un aneurisma aórtico.
```

Una regla de producción equivalente sería:

```
if iguales(paciente-1, síntoma, dolorAbdominal) and
	iguales(paciente-1, evidencia, rumorAbdominal) and
	iguales(paciente-1, evidencia, masaPulsante)
then añadir (paciente-1, enfermedad, aneurismaAortico)
fi
```

### Condiciones
Las **condciones** se construyen con un predicado y sus argumentos: objeto, atributo y constante. Por ejemplo, `iguales(paciente, edad, 60)`.

Expresa una comparación (según el predicado) entre la constante especificada y el valor asociado al atributo del objeto en la memoria de trabajo.

Un predicado es una función booleana. Si tenemos el hecho `paciente.edad = 50`, el predicado `iguales(paciente, edad, 60)` evaluará a falso.

El antecedente de una regla (`if ...`) se satisface (`then ...`) si dicho antecedente evalúa a cierto.

### Semántica de los predicados
La interpretación de los predicados en un sistema de producción es **operacional**.

`iguales(o,a,c)` es cierto si existe algún hecho `o.a = c` en la memoria de trabajo. El comportamiento depende del motor de inferencias: si es hacia adelante, solo se consulta el contenido actual de memoria de trabajo; si es hacia atrás, puede forzar la búsqueda del hecho.

A diferenica con la lógica, el predicado solo es cierto si se puede derivar el hecho necesario. <!-- TODO ¿Y cuál es la diferencia con la lógica? -->


<!-- TODO Diapo 31 -->

## Inferencia en un sistema de producción
## Encadenamiento hacia adelante
## Encadenamiento hacia atrás
## Lenguajes con variables
## Algoritmo de Rete
