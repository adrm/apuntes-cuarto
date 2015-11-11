
# 2. Modelos básicos de componentes
Cómo reutilizar el código binario: en OO, se usa encapsulamiento y herencia, pero no se pueden reutilizar objetos en otros lenguajes, incluso existen incompatibilidades entre objetos creados por el mismo lenguaje, ya sean binarias o de código fuente.

Estos problemas se resuelven con el modelo de componentes. Un modelo de componentes es una especificación en la que se define entre otros: estructura del componente, comunicación entre ellos y manipulación por los entornos de desarrollo.

## 2.1 COM y COM+
OLE (Object Linking and Embedding) fue precursor de COM. OLE 2.0 da origen a COM y ActiveX. Después, DCOM y COM+.

Estructura de COM: Se separa la interfaz de la implementación. Se da una interfaz pública como tabla de métodos o clases.

Para utilizar un cierto componente, solo es preciso recuperar un puntero a alguna de sus interfaces. Un objeto COM tiene que implementar siempre la interfaz IUnknown para controlar el ciclo de vida y la resolución de interfaces.

Un componente COM no existe de forma aislada, se integra en servidores COM. Hay dos clases de servidores: DLL (mismo espacio de direcciones del cliente) y EXE (se ejecuta otro programa con el cual se debe comunicar el cliente mediante IPC local o RPC remoto). Además de alojar y ejecutar los componentes realizan otras funciones como el registro de componentes.

Para COM se usa MIDL (Microsoft IDL): Solo soporta herencia simple, todo método retorna HRESULT (que indica error o no). El precompilador MIDL toma un archivo .idl y genera una biblioteca de tipos, archivos de cabecera, módulos de código, etc.

Los nombres de clases e interfaces son elementos con ámbito reducido. Se utilizan identificadores GUID de 128 bits. CLSID (Class Identifier) si identifican componentes o IID (Interface Identifier) si identifican interfaces.

Para poner en marcha un componente en DLL: `system32> regsvr32 C:\comp\pDLL.dll`

Funciones básicas: se invoca `CoInitialize()` y luego `CoCreateInstance()` facilitando el CLSID. La asociación de CLSID y servidor está en el Registro de Windows. Si el servidor es una DLL, usa la clave `InprocServer32`. También puede ser `LocalServer32` o `RemoteServer32`.

Al guardarse la ubicación de los componentes en el registro de windows, solo puede haber una versión de cada componente. Si varias aplicaciones requieren versiones distintas, no pueden satisfacerse todos los requisitos: **DLL Hell**.

Windows XP introduce un nuevo modo de registro. Las aplicaciones que necesiten componentes COM almacenan toda la información del registro en un directorio propio en lugar del registro global, pero no se puede hacer para EXE, COM o servidores como MDAC, MSXML, DirectX o Internet Explorer.

En COM+ se da un entorno de ejecución y un conjunto de servicios que proporciona el SO. Se intenta simplificar la creación y uso de los componentes, permitiendo una mejor interoperabilidad entre componentes. Abstrae mucho código que tenían que implementar todos los COM como contador de referencias, código para crear e inicializar el componente, etc y da una implementación por defecto.

## 2.2 .NET
Framework compuesto de:

- Máquina virtual (CLR: Common Language Runtime) multilenguaje.
- Herramienta de desarrollo rápido (RAD) de aplicaciones de escritorio y web.
- Conjunto de bibliotecas y frameworks para acceso a BD/XML, interfaces de usuario, etc.
- Plataforma de soporte componentes y servicios Web. Soporta el despliegue de múltiples versiones del mismo componente sin conflicto alguno, simplificando la creación y despliegue de componentes. Servicios fiables y escalables para componentes. Permite la coexistencia y colaboración de .NET y COM.

.NET está construido con componentes. Cada espacio de nombres está incorporado en un componente. La interoperabilidad entre componentes (DLL) es más fácil que con COM.

.NET vs COM: No hay interfaz base IUnknown, todos los componentes derivan de la clase System.Object. No hay necesidad de IDL, las definiciones están en el código fuente, el compilador incrusta las definiciones de tipos en los metadatos del ensamblado. Las dependencias se guardan durante la compilación en el manifiesto del ensamblado. No hay recuento de referencias, .NET incorpora mecanismo de recolección de basura. La identificación no se basa en GUID, sino por el espacio de nombres. Cuando un ensamblado se comparte, debe contener un nombre seguro (firma digital generada usando clave de cifrado, que garantiza la autenticidad de los componentes).

Ensamblados: Colección de tipos y recursos creados para funcionar en conjunto y formar una unidad lógica de funcionalidad. Unidad fundamental de implementación, control de versiones, reutilización, ámbitos de activación y permisos de seguridad. Los ensamblados proporcionan al CLR la información necesaria para conocer las implementaciones de cada tipo. En ejecución, un tipo no existe fuera del contexto de un ensamblado.

Los ensamblados son componentes autodescriptivos que no dependen de las entradas del registro. El compilador añade información adicional en todos los ensamblados (metadatos).

Para desplegar de forma pública, al compilar se firma el código.

Componentes .NET: .NET Framework proporciona la interfaz IComponent y la clase base Component para facilitar la creación de componentes (visuales). Las clases descendientes UserControl y Control facilitan la creación de estos componentes visuales. Cualquier clase que implemente la interfaz IComponent es un componente.

## 2.3. JavaBeans
Componentes Java reutilizables que pueden ser manipulados por herramientas de desarrollo. Java necesitaba simplificar la creación de las interfaces de usuario. Diseñados para interaccionar en dos contextos: composición en la herramienta de creación, y en tiempo de ejecución en el entorno.

Interfaz de un JavaBean: Cuatro tipo de puertos: Métodos, propiedades, eventos lanzados y eventos recibidos (listeners).

Implementación: Suelen implementarse con una clase Java pero hay implementaciones más sofisticadas que envuelven un sistema legado o involucran varias clases.

Características de los JavaBeans:

- Soportan introspección
- Propiedades personalizables
- Se comunican mediante eventos
- Tienen persistencia en su estado
- Promueven la reusabilidad y la portabilidad

Introspección: Las herramientas de desarrollo descubren y modifican las propiedades de un JavaBean mediante introspección a través de la clase Introspector usando java.lang.reflect.

Usa convenciones de nombre para setters y getters.

Se pueden modificar las propiedades del JavaBean con editores o con una clase opcional auxiliar BeanInfo que añade info, un icono, etc.

Comunicación mediante eventos: Mecanismo de notificaciones entre una fuente y listeneres. Las herramientas de desarrollo examinan un JavaBean para determinar que eventos envía y cuáles recibe. La notificación del cambio se realiza a través de un evento PropertyChangeEvent. Los objetos que deseen ser notificados del cambio en una propiedad limitada deberán registrarse como observadores.

Persistencia: Permite a los JavaBeans guardar su estado, y restaurarlo posteriormente. Utilizan la serialización de objetos Java.

Creación: Crear un maifiesto indicando que es un Java-Bean. Crear JAR con todas las clases y el manifiesto. Importar JAR a la paleta de Beans.

JavaBean es el modelo en MVC. Lanza eventos en MVC activo. El modelo 2 de JSP usa MVC pasivo, donde el controlador (servlet) instancia el modelo (JavaBean) para pasárselo a la vista (JSP, que fabrica la respuesta).

## 2.4. Componentes en Android
Intents como forma de comunicación y 4 tipos de componentes básicos:

- Activity: Suele ser una pantalla. Una aplicación suele constar de varias.
- Service: Proceso en segundo plano sin UI. Reproductor de música, descarga de la red...
- Broadcast Receiver: Componente que responde a Intents broadcast. Por ejemplo, llamadas, sms, avisos de batería baja...
- ContentProvider: Componente que permite a las aplicaciones compartir información. Hace los datos disponibles para el resto de aplicaciones del sistema.

Un intent es un objeto (mensaje simple) que representa una intención de hacer algo. Consiste en la acción que se quiere realizar y la información necesaria para operar sobre ella (qué se quiere hacer y sobre qué entidad).

Un componente puede tener un conjunto de filtros intent declarado en su manifiesto. Cada uno de ellos declara una capacidad que implementa (mapas con geo, NFC...)

## 2.5. El problema de la heterogeneidad
DLL está en el mismo proceso así que es muy rápido. EXE está en la misma máquina pero distinto proceso, no es tan rápido. En ese caso se comunican a través de Windows. Ambas alternativas se pueden crear a partir del mismo código.

Se busca la interoperabilidad:

- Transparencia de lenguajes: interoperabilidad de programas en la misma plataforma con distintos lenguajes.
- Transparencia de ubicación: interoperabilidad de los programas en distintas máquinas con mismo lenguaje.
- Heterogeneidad general: cualquier ubicación y cualquier lenguaje.

Para ello hay que tener en cuenta llamadas (procedimientos, mensajes...), paso de parámetros (por valor, referencia...), tipos y representación de datos (valores, referencias, matrices, clases...) y características del entorno de ejecución (gestión de memoria, recolección de basura).

Microsoft soluciona la transparencia de lenguajes con .NET y CLR usando estándar CORBA:

- Llamadas estándar RPC.
- Paso de parámetros usando un lenguaje estándar si se usa .NET o CORBA para cada lenguaje.
- Tipos y representación de datos: Sistema de tipos de .NET o traducción de CORBA para cdad lenguaje. Representación en lenguajes estándar o formatos de intercambio (XML).
- Entorno en tiempo de ejecución proporcionado por la implementación de CORBA, .NET...

Para la transparencia de ubicación se usa una variante del patrón Proxy: DCOM (Distributed COM) y COM+. En sistemas distribuidos hay que hacer marshalling.

## 2.6. Sistemas distribuidos y middleware
Arquitecturas de un sistema distribuido:

- Maestro-esclavo: sistemas de control y tiempo real.
- Peer to peer.
- Cliente-servidor de dos o más capas: Servidor centralizado.
- Basada en componentes distribuidos: Cuando se necesitan combinar recursos de diferentes sistemas y bases de datos.
- Basada en servicios: Utiliza la web para conectar distintos sistemas, incluso de empresas distintas.

Cliente servidor de tres capas: persistencia <-> lógica de negocio (con middleware) <-> cliente

Middleware es el software que gestiona y apoya los diferentes componentes de un sistema distribuido, está en el centro del sistema. P.ej: se pide una web desde un navegador, el middleware determina la ubicación y envía una petición a esa página; el servidor interpreta la petición, envía la página al middleware y la envía como respuesta al navegador.

Tipos de middleware:

- Controladores de comunicación
- Convertidores de datos
- Monitores de transacciones
- Gestores de mensajes: Cola entrante de mensajes, gestión de mensajes, colas salientes.
- Gestores de objetos distribuidos

En CORBA (Arquitectura de objetos distribuidos) no hay distinción entre clientes y servidores.

Arquitecturas orientadas a servicios web: giran en torno al concepto de los servicios prestados externamente (web). Intervienen distintas organizaciones. Enlaza de forma natural con el cloud computing.

Arquitecturas orientadas a servicios (SOA): Registro de servicios donde los proveedores registran sus servicios para que los clientes accedan a ellos.

## 2.7. Cloud Computing y SaaS
Cloud Computing es usar un software o hardware remoto ofrecido como servicio. SaaS es una de las posibilidades. Es el paso del sector secundario al terciario. Explota las economías de escala.

Al usar clusters, es mucho más escalable, económico y redundante que los servidores normales. Con pocos operadores se pueden administrar miles de servidores.

- IaaS: Hardware virtualizado en red. Networking, balanceo de carga, acceso a la red... Se paga por el HW que se necesita en cada momento. Supone ahorro.
- PaaS: Añade algún software como bases de datos o plataformas de desarrollo restando flexibilidad.
- SaaS: Software en un host remoto accedido a través de internet. Pago por uso o con publicidad, etc. Infraestructura local mínima. Siempre actualizado. MS Office 365, juegos, FB, etc.
