# 4. Ingeniería del Software basada en componentes
## 4.1 Especificación de componentes con UML
Un componente representa una parte modular del un sistema que encapsula su contenido y cuya manifestación es reemplazable dentro de su entorno. Se ve como una caja negra cuyo comportamiento está completamente definido por sus interfaces proporcionadas y requeridas, y puede ser sustituido por otros componentes que proporcionen el mismo protocolo.

Los componentes pueden ser físicos (instanciados directamente en tiempo de ejecución como un EJB) o lógicos (una construcción lógica como un subsistema, que solo se instancia indirectamente al instanciar sus partes).

**Intefaz proporcionada**: la interfaz que implementa el componente. Ofrece sus servicios.

![Interfaz proporcionada](img/interfazProporcionada.png)

**Interfaz requerida**: indica que el componente utiliza los servicios definidos por la interfaz.

![Interfaz requerida](img/interfazRequerida.png)

**Conectores de ensamblado**: conexión entre ambos tipos de interfaz.

![Conector de ensamblado](img/conectorEnsamblado.png)

**Representaciones de caja negra**:

![Representaciones de caja negra](img/cajaNegra.png)

**Representaciones de caja blanca**:

![Representaciones de caja blanca](img/cajaBlanca.png)

Un **puerto** especifica un punto de interacción entre un clasificador y su entorno. Se describe por sus interfaces proporcionadas y requeridas. Es un conjunto semánticamente cohesivo de interfaces, y puede tener un nombre.

![Puerto](img/puerto.png)

### Estructura interna
Internamente, un componente puede realizarse con clases o descomponerse en otros componentes. Las interfaces delegan en las partes internas, pudiendo mostrar los elementos anidados, conectados a él por relaciones de dependencia.

Se pueden mostrar clases que realizan el componente (compartimento de elementos empaquetados) o componentes internos (compartimento de estructura interna) con sus partes y conectores.

![Compartimento de elementos empaquetados](img/elementosEmpaquetados.png)
<!-- TODO Completar desde diapo 13 -->

### 4.1.1 Partición: subsistemas como componentes
El sistema se divide en subsistemas, que se dividen en módulos, que se dividen en sucesivos niveles de componentes que finalmente se implementan con clases y objetos.

Un **subsistema** es un componente que actúa como unidad de descomposición de un sistema para dividirlo en porciones manejables. Es un paquete UML. Se agrupan en el mismo subsistema las clases o componentes que se encuentrar en el mismo área de interés, pertenecen a la misma jerarquía, comparten casos de uso o están asociadas fuertemente.

No se puede instanciar un subsistema en tiempo de ejecución pero sí se pueden instanciar sus partes contenidas, y conectarse a otros subsistemas a través de interfaces para crear una arquitectura.

Una **arquitectura física** está formada por subsistemas e interfaces, con los subsistemas organizados según el patrón arquitectónico de capas. Cada capa contiene subsistemas de diseño: capa de presentación, de dominio, de servicios, de utilidades, etc. Las dependencias entre capas se definen cuidadosamente, van en una sola dirección y siempre a través de interfaces.

![Arquitectura en capas](arquitecturaCapas.png)

Es conveniente dividr el modelo que representa todo el dominio. Por ello, organizamos un paquete con los elementos comunes como subsistema y el resto de paquetes como subsistemas. <!-- TODO No está muy claro -->

La interfaz de usuario se comunica con un controlador de fachada, aplicando el patrón fachada. Para aplicar este patrón, se identifican las partes cohesivas del sistema, se empaquetan en un subsistema y se define una interfaz para interactura con ese subsistema. Las dependencias entre subsistemas se pueden implementar con conectores.

## 4.2 Diseño de componentes con JEE
En JSP se usa MVC, con JavaBean como modelo.

En JEE se diseñan los componentes en varias capas. Se parte de la especificación de los componentes en UML. Después se diseñan éstos en capas, se diseña la arquitectura de red, se programan y se realizan las pruebas unitarias.

En JEE existen las siguientes capas:

- Capa de presentación: controla lo que se muestra al usuario final.
- Capa de despliegue: publica las operaciones de las clases de dominio.
- Capa de dominio: procesa la lógica y las reglas de negocio a través de clases de dominio u objetos de negocio. Junto con la capa de despliegue, implementa la lógica de negocio.
- Capa de acceso a datos: gestiona la lectura, escritura, actualización y borrado de los datos almacenados. Podría funcionar con JDBC/JPA pero también con XML o ficheros.
- Capa de componentes arquitectónicos: componentes genéricos que pueden usarse en todas las capas.
- Capa de objetos de transferencia de datos: estructuras de información ligeras (DTOs) relacionadas con las clases de dominio usadas para compartir información a través de las capas.

### Capa de acceso a datos
Se implementa mediante clases de tipo Data Access Objects (DAO) u otro patrón equivalente. Gestiona el acceso al almacenamiento persistente independientemente del tipo que sea. El acceso a datos independiente permite cambiar las fuentes de datos y compartir el acceso a datos entre distintas aplicaciones.

### Lógica de negocio
#### Capa de dominio
Proviene de las clases del dominio y las reglas de negocio. Las clases de dominio deberían estar separadas de las capas DAO y de despliegue para maximizar sus posibilidades de reutilización.

Suele utilizar y coordinar varios DAOs. Suele usar patrones como adaptador, compuesto, estrategia, etc.

#### Capa de despliegue
Es específica de la arquitectura JEE. Incluye los EJBs de mensaje y sesión y/o los servicios web necesarios. Se puede tener un servicio web y un EJB para la misma capa de dominio.

<!-- Diapo 46 -->

### Diseño en capas
### Proceso de desarrollo: tareas de diseño
## 4.3 Diseño de las capas
### Patroles de las capas de persistencia, negocio y presentación
## 4.4 CBSE: Desarrollo para y con reutilización
## 4.5 Diseño basado en componentes
## 4.6 Despliegue de componentes
