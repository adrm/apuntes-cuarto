# 3 Tecnologías y marcos de trabajo para desarrollo de sistemas componentes distribuidos
## 3.1 Tecnología Java: EJB y JEE
Enterprise Java Beans no tiene nada que ver con Java Beans. La arquitectura EJB proporciona un formato para componentes especializados en la lógica de negocio que se implantan en un entorno JEE. EJB está más relacionado con Servlets y JSP que JavaBeans con cualquiera de ellos.

Un EJB es un componente del lado del servidor que encapsula la lógica del negocio de una aplicación.

JEE es una plataforma para construir aplicaciones de negocios portables, reutilizables y escalables usando el lenguaje de programación Java. Soporta un modelo de aplicación distribuida multinivel basado en componentes Java.

Los componentes web son Servlets y Java Server Pages (JSP/JSF).

Los componentes de negocio son Enterprise JavaBeans (EJB).

Los componentes del Sistema Información Empresarial (EIS).

### Objetivos de JEE

- Definir una arquitectura de componentes estándar para la construcción de aplicaciones distribuidas basadas en Java.
- Separar los aspectos de lógica de negocio de otros soportados por la plataforma: transacciones, seguridad, ejecución multihilo, pooling y otros elementos de bajo nivel.
- Filosofía java: escribir una vez y ejecutar en cualquier parte.
- Cubrir los aspectos de desarrollo, despliegue y ejecución del ciclo de vida de una aplicación.

### Características de EJB 3
Los EJB contienen la lógica de negocio, que opera sobre los datos de la empresa.

Las instancias de un EJB son administradas en ejecución por un contenedor. El acceso del cliente es mediado por el contenedor donde el EJB está desplegado. El acceso es transparente para el cliente. El contenedor asegura que los beans pueden ser desplegados en múltiples ambientes de ejecución sin recompilar.

Los aspectos como transacción y seguridad pueden ser especificados junto con la lógica del negocio de la clase EJB en forma de anotaciones o bien en un descriptor de despliegue XML.

El framework EJB es la suma de los EJB y el contenedor. Tambien se puede ver como una plataforma de componentes. El contenedor proporciona servicios que los EJB usan.

### Arquitectura de EJB
EJB sigue una arquitectura basada en contenedores. Un contenedor es un proceso donde se ejcutan los componentes. Gestiona su ciclo de vida y proporciona acceso a servicios de la plataforma como transacciones, seguridad o conectividad.

El desarrollador especifica dos tipos de elementos: los componentes de la aplicación (JSPs o JSF, Servlets, EJB) y los descriptores de despliegue (ficheros XML que describen los componentes de la aplicación).

En este tipo de arquitectura no solo se reutiliza el código específico de la aplicación, sino que también se reutiliza el diseño. El bucle de eventos y otros servicios están en el contenedor y no en la lógica específica de la aplicación.

Existen contenedores web (páginas web, Servlets) y contenedores EJB. Los contenedores (también el navegador es contenedor cuando ejecuta un applet) se comunican entre ellos por APIs web o IPC.

JEE proporciona servicios para cada contenedor en forma de APIs como:

- Java Beans Active Framework (JAF)
- Servicios web (JAXWS)
- Java Transaction API (JTA)
- Java Persistence API (JPA)
- Java Message Service (JMS)
- Java Naming Direct Interface (JNDI)
- JavaMail
- Java API for XML Processing (JAXP)
- Java Authentication and Authorization Service (JAAS)

Uno de los servidores JEE más típicos es GlassFish. Tiene un contenedor web, contenedor EJB y proveedor de persistencia que se comunican entre sí.

### Ventajas de los EJB
Un EJB es un componente portables, reutilizable y puede ser desplegado en cualquier servidor que implemente los estándares de las APIs JEE.

Permiten simplificar el desarrollo delegando algunos servicios como administración de transacciones y seguridad al contenedor.

Permiten desacoplar el cliente del servidor almacenando la lógica de negocio en el EJB y no en el cliente.

Pueden ser distribuidos en múltiples máquinas, residiendo en servidores distintos y siendo invocados por clientes remotos. Permite entornos multi-usuario, tanto locales como remotos.

Permiten crear aplicaciones escalables.

Al soportar transacciones y administración del acceso concurrente a objetos compartidos se asegura la integidad de los datos de las transacciones.

## 3.2 Tipos de componentes EJB
### 3.2.1 Session Beans
Permiten encapsular los procesos de negocio (la interfaz de sistema en los DSS<!-- TODO Diagramas de secuencia? --> encontrada a partir de los casos de uso).

Tienen una vida corta, de forma que el servidor falla si la sesión se pierde. No se comparten entre clientes. No manejan directamente la persistencia, pero pueden actualizar y crear "entities" que son persistentes.

Un cliente (un Servlet o una aplicación Java) interacciona con un Session Bean a través de la invocación de sus métodos. Una invocación se denomina sesión. El cliente primero hace el lookup del Session Bean en un JNDI (Java Naming and Directory Interface) donde se registran los EJB. Una vez localizado, le envía un mensaje de creación para poder ejecutar métodos sobre una instancia del Session Bean.

Un Session Bean está compuesto por una o más interfaces y una clase de implementación POJO. El cliente solo pordrá acceder al Session Bean a través de métodos definidos en la interfaz del Bean.

El Session Bean puede ser invocado a través de una interfaz local, remota a través de RMI o incluso un web service. En el caso de la invocación remota, el cliente está en una JVM distinta, pero la ubicación del EJB que está usando es transparente para el cliente.

Para definir una interfaz como remota, se define la interfaz anotada con `@Remote`, y se define la clase `@Stateless` o `@Stateful` que implementa dicha interfaz.

#### Interfaz local
En una invocación local, el cliente reside en la misma instancia que el Session Bean. El contenedor web hace una llamada local al contenedor EJB 3, ambos dentro de un contenedor Java EE en una sola JVM.

La interfaz local es la interfaz por defecto. El cliente local puede ser un componente web u otro EJB. Para definir un Session Bean con interfaz local, hay que definir la interfaz anotada con `@Local` y definir la clase `@Stateless` o `@Stateful` que implementa la interfaz.

### Stateless y stateful session beans
El estado de un objeto se compone de los valores de sus variables de instancia. Los valores de las variables representan el estado de una única sesion cliente/Bean. El estado de la interacción del cliente con el Bean es llamado **estado conversacional**, y tiene dos modos: stateful y stateless.

#### Stateless Session Bean
Un Stateless Session Bean no mantiene el estado conversacional con el cliente. Cuando el cliente invoca métodos del Stateless Bean, las variables de instancia pueden contener un estado específico del cliente durante la invocación, y si el método finaliza, el estado para el cliente específico se pierde.

Los Stateless Beans ofrecen mejor escalabilidad para aplicaciones con gran cantidad de clientes. Pueden servir para implementar un web service.

El contenedor tiene un pool de instancias compartidas por los clientes. Cuando un cliente invoca un método se le asigna una instancia, y al terminar la instancia vuelve al pool.

El ciclo de vida de un Stateless Bean es iniciado por el cliente, que obtiene una referencia al Session Bean (`@PostConstruct` callback) y éste pasa a estado Ready. Al destruirlo (`@PreDestroy` callback) pasa a Does not exist.

Los callbacks son métodos del Bean que no están expuestos en la interfaz y reflejan una transición del ciclo de vida de un Bean. Estos métodos se marcan con las correspondientes anotaciones.

#### Stateful Session Bean
En este caso, el estado se mantiene durante la sesión del cliente con el Bean. La instancia se reserva para el cliente y cada una almacena la información del cliente. La sesión finaliza si el cliente elimina el bean llamando al método `@Remove` o si finaliza la sesión por timeout.

En una sesión, el cliente hace llamadas consecutivas a métodos de un mismo Bean, similar a una transacción con una base de datos.

Su ciclo de vida comienza pasando a estado Ready cuando se inyecta como dependencia, y se dispara el callback `@PostConstruct`. De ahí se puede pasar a Passive disparándose los callbacks `@PrePassive`, y se puede volver a Ready disparando los callbacks `@PostActivate`. De cualquiera de esos dos estados se puede pasar a Does not exist ejecutando el método `@Remove` o por timeout. El estado pasivo implica que el Bean queda eliminado temporalmente y guardado en la memoria secundaria.

### JNDI e inyección de dependencias
Con Java Naming Direct Interface, es responsabilidad del cliente localizar y obtener la referencia a un objeto, componente o recurso. Con EJB 3 y la inyeccción de dependencia, el contenedor localiza un objeto basándose en la declaración del cliente.

JNDI es un servicio de nombres que permite a un componente localizar otros componentes o recursos como por ejemplo bases de datos via JDBC. El objeto remoto se registra y el cliente hace lookup en el registro para después invocar los métodos en el objeto remoto.

JNDI permite que las apliaciones acceda a múltiples servicios de nombres y de directorios como NDS, DNS, NIS, JDBC, etc. permitiendo acceder a cualquier objeto Java, recurso o sistemas legados.

Para localizar un recurso, hay que definir explícitamente la búsqueda con JNDI (lookup):

```
Context context = new InitialContext();
//JDBC
DataSource dataSource = (DataSource) context.lookup
	("java:comp/env/jdbc/ActionBazaarDS");
Connection connection = dataSource.getConnection();
Statement statement = connection.createStatement();
//Bean
PlaceBid placeBid = (PlaceBid)context.lookup
	("java:comp/env/ejb/PlaceBid");
```

Un cliente de aplicación JEE puede referirse a un EJB con la anotación `@EJB`. El contenedor EJB inyecta en cada objeto los EJB según las anotaciones que incluya.

```
import javax.ejb.EJB;

public class PlaceBidServlet extends HttpServlet {

	@EJB
	private PlaceBid placeBid;
	public void service(HttpServletRequest request,
	HttpServletResponse response) throws ServletException, IOException {
		...
	}
	...
}
```

### 3.2.2 Message-driven beans
Los Session Beans son síncronos, con lo que puede haber bloqueos y esperas. Los Session Beans están acoplados con el servidor, deben conocerlo y dependen de él. Además, no están pensados para múltiples clientes y servidores puesto que cada llamada tiene una instancia de un Bean.

Con mensajes, podemos tener procesamiento sin bloquear la interfaz de usuario. Los mensajes se envían sin conocer el receptor. Aunque el servidor se caiga, se garantiza la entrega. Puede haber múltiples clientes y servidores en cada llamada.

Entre cliente y servidor se interpone un middleware MOM (Message-oriented middleware) de mensajería. El estándar es Java Message Service (JMS), que es un estándar de mensajería para evitar usar APIs propietarias similar a JDBC. Hay dos modelos:

- Publish/subscribe, donde los productores añaden mensajes a un "tema" del que leen varios consumidores suscritos.
- Punto a punto, donde varios productores pueden enviar mensajes a una cola por cada consumidor.

```
// 1: localizar la factoría de conexiones con el contexto
TopicConnectionFactory factory =
	(TopicConnectionFactory) ctx.lookup(“jms/TopicConnectionFactory”);

// 2: la factoría de conexiones crea la conexión JMS
TopicConnection connection = factory.createTopicConnection();

// 3: la conexión crea la sesión
TopicSession Session =
	connection.createTopicSession(false,Session.AUTO_ACKNOWLEDGE);

// 4: localizar destino
Topic topic = (Topic) ctx.lookup(“jms/Topic”);

// 5: crear el emisor de mensajes
TopicPublisher publisher = session.createPublisher(topic);

// 6: crear y publicar un mensaje
TextMessage msg = session.createTextMessage();
msg.setText(“mensaje de prueba”);
publisher.send(msg);
```

Para usar JMS con Session Beans basta con añadir una clase Java que reciba los mensajes y los reenvíe a los Beans ya existentes. Es posible, pero requiere escribir el código del listener, puede que haya que escribir código multihilo, la clase auxiliar no se beneficia de los servicios del contenedor EJB, y la clase auxiliar no es reutilizable puesto que depende de los detalles de JMS.

Un Message-driven Bean es un componente EJB especial que puede recibir mensajes JMS. Es invocado por el contenedor EJB cuando llega un mensaje en el destino. Está desacoplado del productor de mensajes. No tiene estado ni interfaz local o remota. Los mensajes no se le enían usando el estilo orientado a objetos clásico, sino que se implementan métodos listener genéricos para el mensaje entregado. Los métodos listener no devuelven valores de retorno ni lanzan excepciones para el cliente.

<!-- TODO Diapositiva 79 -->

## Persistencia: JPA y entities
A partir de la versión 3, se recomienda usar la API de persistencia estándar de Java en lugar de EJB de tipo entity.

## Despliegue de aplicaciones JEE
Una aplicación EJB debe contener:

- Componentes EJB.
- Interfaces que definen los métodos que implementan los componentes.
- Clases "helper": clases java de utilidad requeridas por los EJB (cálculos, DTOs, etc)

### Despliegue: EAR, WAR y JAR
Se empaquetan en un archivo .jar, son portables y pueden ser empaquetados a su vez en un archivo .ear, o junto con archivos web en un .war.

### Despliegue con anotaciones
En EJB 3 se usan anotaciones para indicar las características del EJB: `@Stateless`, `@Stateful`, `@MessageDriven`, `@Entity`... Así se simplifica la definición del EJB. También se usan anotaciones como `@PostConstruct`, `@PreDestroy`, `@PostActivate` o `@PreActivate` para definir los callbacks del ciclo de vida.

EJB 3 tambien permite utilizar descriptores XML. Con ellos, se puede cambiar la configuración sin tocar el código original.



## Modelo Vista Controlador
La vista es un JSP/JSF, el controlador es un servlet/JSF y el modelo está formado por EJBs y JPA.

La conexión con el modelo se realiza a través de un controlador de fachada que implementa la interfaz pública del componente. El servlet llama a la fachada, que envía mensajes a los EJB, que usan los proveedores de la JPA para obtener los datos de la base de datos.

### JPA (Java Persistence API)
Es una simplificación de la persistencia gestionada por contenedor. Tiene un enfoque en POJOs/JavaBeans. Permite el uso de las entidades fuera del contenedor, por ejemplo en un contenedor web o Java SE.

Esta forma de persistencia soporta modelos de dominio con herencias y polimorfismo. Guarda metadatos para el mapeo entre la representación de objeto y la relacional.

### Tecnologías de presentación: JSP y JSF
JSF es una propuesta de Sun alternativa a JSP/Servlets.

## Microsoft DCOM, COM+ y .NET Remoting
## Corba Component Model (CCM)
