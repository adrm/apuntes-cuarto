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

## Tipos de EJB
### Stateless y stateful session beans
### Message driven beans
## Persistencia: JPA y entities
A partir de la versión 3, se recomienda usar la API de persistencia estándar de Java en lugar de EJB de tipo entity.

## Despliegue de aplicaciones JEE
Una aplicación EJB debe contener:

- Componentes EJB.
- Interfaces que definen los métodos que implementan los componentes.
- Clases "helper": clases java de utilidad requeridas por los EJB (cálculos, DTOs, etc)

Se empaquetan en un archivo .jar, son portables y pueden ser empaquetados a su vez en un archivo .ear, o junto con archivos web en un .war.

### Despliegue con anotaciones
En EJB 3 se usan anotaciones para indicar las características del EJB: @Stateless, @Stateful, @MessageDriven, @Entity... Así se simplifica la definición del EJB. También se usan anotaciones como @PostConstruct, @PreDestroy, @PostActivate o @PreActivate para definir los callbacks del ciclo de vida.

### Tecnologías de presentación: JSP y JSF
### Despliegue: EAR, WAR y JAR
## Microsoft DCOM, COM+ y .NET Remoting
## Corba Component Model (CCM)
