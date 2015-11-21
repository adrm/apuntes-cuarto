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

```java
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

```java
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

```java
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

El contenedor EJB consume los mensajes que llegan a un destino JMS según se especifique en el descriptor de despliegue.

La implementación consta de dos interfaces:

```java
public interface javax.jms.MessageListener {
	public void onMessage(Message message);
}
public interface javax.ejb.MessageDrivenBean
		extends javax.ejb.EnterpriseBean {
	//...
	public void setMessageDrivenContext(MessageDrivenContext ctx)
			throws EJBException;
}
```

Ejemplo de productor:

```java
@Stateful
public class GestorPedidosBean implements GestorPedidos{

	@Resource(name="jms/QueueConnectionFactory")
	private ConnectionFactory connectionFactory;

	@Resource(name="jms/ColaFacturacion")
	private Destination colaFact;
	//...
	@Remove
	public Long confirmarPedido() {
		//...
		facturar(pedido);
	}

	private facturar(Pedido pedido) {
		try {
			Connection connection = connectionFactory.createConnection();
			Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
			MessageProducer producer =session.createProducer(colaFact);
			ObjectMessage message = session.createObjectMessage();
			message.setObject(pedido);
			producer.send(message);
			producer.close();
			session.close();
			connection.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
}
```

Ejemplo de consumidor MDB:

```java
@MessageDriven(activationConfig = {
	@ActivationConfigProperty(propertyName="destinationName", propertyValue="jms/ColaFacturacion")
})
public class FacturacionMDB implements MessageListener {
	//...
	public void onMessage(Message message) {
		try {
			ObjectMessage objectMessage = (ObjectMessage) message;
			Pedido pedido = (Pedido) objectMessage.getObject();
		//...
		} catch (Exception e) {
			//...
		}
	}
}
```

## 3.3 Persistencia: JPA y entities
A partir de la versión 3, se recomienda usar la API de persistencia estándar de Java en lugar de EJB de tipo entity.

### JPA: Java Persistence API
Hay muchas opciones de ORM para hacer el mapping objeto-relacional, como Hibernate, IBatis, JDO... Estos proyectos se unifican con la JPA (Java Persistence API).

JPA simplifica la persistencia gestionada por el contenedor. Tiene un enfoque en POJOs/JavaBeans. Permite, por tanto, usar estas entidades fuera del contenedor EJB en un contenedor web o directamente en Java SE. Soporta herencia, polimorfiso, metadatos y anotaciones para representar fielmente el modelo de dominio. Los metadatos y anotaciones también aportan información para realizar el mapeo objeto-relacional.

De esta forma, se elimina la necesidad de crear objetos de transferencia de datos (DTO).

### Entidades JPA (Entities)
Una entity es una clase ligera, marcada con la anotación `@Entity` (no se usan interfaces), que gestiona los datos persistentes. Debe implementar `java.io.Serializable` puesto que las instancias se pasan por valor a una aplicación remota. A la entidad se le asigna una base de datos mediante anotaciones.

También soporta a través de anotaciones mapeo de relaciones y herencia.

Existe un EntityManager que gestiona el ciclo de vida de las instancias entidad, asociado con un contexto de persistencia. Una instancia de EntityManager gestiona un conjunto de entidades definido por una unidad de persistencia.

Hay dos contextos de persistencia. Las transacciones JTA se usan en servidores de aplicaciones Java EE. Las transacciones RESOURCE_LOCAL se usan en aplicaciones cliente/servidor. Esto se indica en el XML que define la unidad de persistencia.

Cada instancia de tipo entidad se crea con new o se recupera con una búsqueda en la BD (`find()`). La entidad se inserta, actualiza o borra (`persist()`, `merge()`, `remove()`) a través de la instancia de `EntityManager`.

Ejemplo de inserción:

```java
@PersistenceContext
private EntityManager em; //injección del EntityManager
//...
public void crearUsuario(String nom, String ape) {
	Usuario usuario = new Usuario();
	usuario.setFirstName(nom);
	usuario.setLastName(ape);
	em.persist(usuario);

	// Cuando el método devuelve el control, "usuario" está
	// en estado “persistido” con los valores autogenerados
}
```

#### Anotaciones básicas
Las anotaciones para indicar relaciones son `@OneToOne`, `@OneToMany`, `@ManyToOne` y `@ManyToMany`. Pueden ser bidireccionales (`mappedBy`) u obligatorias (`optional="false"`). Los parámetros cascade (que se borran en cascada) y fetch (que indica cómo se recuperan de la BD) completan la información.

<!-- TODO Diapositiva 100, ejemplos -->

Las relaciones de herencia se indican con la anotación `@Inheritance(strategy=InheritanceType.SINGLE_TABLE)` (u otra estrategia). Si se usa single table, todas las instancias que heredan se guardan en la misma tabla, y por tanto se indica con `@DiscriminatorColumn` la columna que guardará un valor que diferencie a qué clase pertenece cada fila de la tabla. En las clases que heredan se usa la anotación `@DiscriminatorValue(value="A")` que indica el valor con el que se representan las instancias de cada una de estas clases en la tabla, para poder diferenciarlas.

#### Queries
Para realizar una query, se puede usar JPQL o SQL nativo. En JDBC y SQL los pasos son:

1. Obtener conexión JDBC a la BD.
2. Crear una sentencia SQL.
3. Ejecutar la sentencia.
4. Recuperar los resultados en formato registro.

Mientras que con JPA y JPQL, los pasos son:

1. Obtener una instancia de EntityManager.
2. Crear una instancia de consulta.
3. Ejecutar la consulta.
4. Recuperar los resultados como objetos tipo "Entity".

En las entities se suelen crear `@NamedQuery` que dan un nombre a una query SQL parametrizada, para separar la query de la implementación de la clase.

## Despliegue de aplicaciones JEE
Hay dos tipos de aplicaciones web. Las simples, que funcionan con Java/JSP, y las más complejas que usan EJBs. En ambos casos se usan recursos comunes como JSP, servlets, html, imágenes, etc.

Los **servlets** son clases escritas en Java que procesan peticiones y construyen respuestas. Tienen un ciclo de vida completo. Primero "init", que se ejecuta al cargarse por primera vez, después "doGet" y "doPost" cuando recibe peticiones, y "destroy" al finalizar. Cada servlet se ejecuta en un hilo. Sus atributos son "request", "response" y "session".

**JSP** son documentos de texto con una plantilla de datos estática en un formato como HTML o XML, y elementos JSP (código Java) que determinan cómo la página construye el contenido dinámico. Se compila y se genera un servlet que maneja los mismos atributos.

Una aplicación web está organizada en una estructura jerárquica de directorios, con un directorio privado `WEB-INF` y un directorio público. El directorio público puede contener ficheros jsp, html, imágenes y otros documentos estáticos. El privado contiene el descriptor de despliegue, las clases Java y otras librerías Java. La aplicación web se puede empaquetar como fichero WAR.

El **descriptor de despliegue**, `WEB-INF/web.xml` es un documento XML en el que se dan de alta los servlets, parámetros del contexto, etiquetas TLD, filtros y otros detalles del despliegue.

Un **archivo WAR** (Web Application Archive) es equivalente al JAR y permite empaquetar en una sola unidad aplicaciones web Java completas con los servlets y JSPs, contenido estático y otros recursos.

Una aplicación EJB debe contener:

- Componentes EJB.
- Interfaces que definen los métodos que implementan los componentes.
- Clases "helper": clases java de utilidad requeridas por los EJB (cálculos, DTOs, etc)

### Despliegue: EAR, WAR y JAR
Los EJB e empaquetan en un archivo .jar, son portables y pueden ser empaquetados a su vez en un archivo .ear, o junto con archivos web en un .war.

Para distribuir EJBs, se usan paquetes denominados EJB-JAR, que son similares a los WAR que modularizan el desarrollo de aplicaciones con JSPs/Servlets pero para EJBs. Los EJB-JAR pueden incluir EJBs de distintos tipos y facilitan el despliegue de éstos en cualquier servidor de aplicaciones compatible JEE.

Una aplicación empresarial se empaqueta en un fichero .ear que está compuesto de la aplicación web Java empaquetada en WAR, los EJB distribuidos empaquetados en JAR, e información opcional de despliegue.

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
JSF (struts) (Java Server Faces) es una propuesta de Sun alternativa a JSP/Servlets. Con JSF la aplicación estaría formada por una vista con páginas JSF, controladores en EJB3 y un modelo a través de JPA.

JSF es una API y una implementación de referencia con representaciones de componentes de UI y manejo de su estado, eventos, validaciones, navegación, etc. JSF también tiene una librería de etiquetas personalizadas de JSP para dibujar los componentes de UI en páginas JSP.

Las peticiones Faces no son petición-respuesta, sino que tienen un ciclo de vida que depende del tipo de petición según si la petición y la respuesta son o no de tipo Faces, aunque lo normal es que ambas sí lo sean.

JSF está formado por una serie de componentes:

- Conjunto de clases UIComponent, que representan los componentes.
- Modelo de renderizado, que da la forma de visualizar el componente.
- Modelo de eventos, que indica cómo manejar los eventos lanzados.
- Modelo de conversión, que conecta los conversores de datos al componente.
- Modelo de validación, que da la forma de registrar validadores para el componente.
- RichFaces e ICEFaces, que son librerías de etiquetas.

Los **facelets** permiten definir una plantilla para un portal y emplearla en todas sus páginas.

## Microsoft DCOM, COM+ y .NET Remoting
DCOM define componentes remotos bajo el entorno Microsoft que se comunican por RPC con un servidor remoto.

COM+ es la evolución, y se puede ejecutar con balanceo de carga en granjas de componentes. Usa MSMQ que proporciona mensajería asíncrona entre aplicaciones con componentes en cola (Queued Components). Introduce un mecanismo de eventos denominado COM+ Events, y proporciona herramientas para generar proxies (interfaces con el servidor) del lado del cliente más fácilmente.

Esto es usado en la empresa en aplicaciones usadas por muchos tipos de personas de la organización, ya sean en la intranet o en Internet. Tiene soporte para seguridad, y proporciona acceso a datos y comunicación a través de redes no fiables. Promueve modelo de tres capas: presentación en el cliente, lógica de negocio en el servidor de aplicaciones, y acceso a datos en los servidores de bases de datos.

DCOM/COM+ fue uno de los mayores competidores de CORBA, y se especulaba que una de esas dos tecnologías serían el modelo de servicios sobre Internet. Era difícil conseguir que las conexiones funcionaran a través de cortafuegos y sobre máquinas inseguras o desconocidas. Actualmente, HTTP + navegadores web han ganado la partida para aplicaciones empresariales, a través de tecnologías como ASP y .NET o JSP y JEE.

.NET Remoting sustituye a DCOM para crear aplicaciones distribuidas sobre Windows. Proporciona una arquitectura orientada a objetos para ello, a través del espacio de nombres `System.Runtime.Remoting`. Una clase es remota cuando puede ser usada por clientes en otro dominio de aplicación, ya sea en el mismo proceso, en otro, o incluso en otras  máquinas. Para construirla hay que hacer que derive de `System.MarshalByRefObject`.

.NET Remoting es flexible y permite personalizar fácilmente la aplicación. También soporta estándares como SOAP o HTTP y TCP en lugar de usar mecanismos propietarios. Proporciona servicios y canales de comunicación que transmiten mensajes entre aplicaciones remotas, y formateadores que codifican y decodifican los mensajes que se transmiten por los canales.

Establece canales TCP que transmiten en binario y son adecuados para un mayor rendimiento, o canales HTTP que transmiten mensajes SOAP y son adecuados cuando hay que favorecer la interoperabilidad.

.NET destaca por ser multilenguaje, por ser conceptualmente más avanzado (permite acceso a memoria, atributos, llamadas síncronas/asíncronas u observables...), por soportar múltiples canales de transporte (HTTP o TCP) y múltiples formatos (SOAP o binario), por facilitar el cambio de presentación en web y GUI, por tener una interfaz entre base de datos y capa de negocio más avanzada y con más rendimiento, y por establecer AppDomains que son compartimentos de código que permiten ejecutar una aplicación con varios niveles en un solo proceso.

JEE destaca por su madurez, con 3 años de ventaja sobre todo en capa de negocio, por ser intrínsecamente multiplataforma, porque cuenta con implementaciones de múltiples proveedores, por tener un modelo de componentes distribuidos (EJB) más avanzado, por la Java Connector Architecture (JCA), y porque "no es de Microsoft".

## 3.7 Corba Component Model (CCM)

> Consultar esquemas en los apuntes originales.
