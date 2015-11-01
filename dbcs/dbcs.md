# 1. Introducción: Conceptos de desarrollo basado en componentes
## 1.0. La visión general
Desarrollo basado en componentes para gestionar la complejidad: divide y vencerás. Se aplica en muchas otras disciplinas e ingenierías.

La idea principal es **construir un sistema conectando partes más pequeñas, independientes, ya existentes y, quizás, provenientes de terceros** (Concepto "Commercial Off-The-Shelf" o COTS). De esta manera, podemos reducir todo lo posible la creación de código nuevo. Implementación de sistemas utilizando componentes previamente programados y probados.

Los componentes no están bien definidos en ingeniería de software debido a la naturaleza del software.

Entidad básica: **Componente: caja negra que encapsula una cierta funcionalidad y es diseñada para un "mercado global de componentes", sin saber quién, cómo o cuándo se usará.** Es aplicar la industrialización al desarrollo de software: el programador tiene una paleta de componentes y se limita a unirlos entre sí.

Los componentes permiten reutilizar componentes probados a los desarrolladores para construir sus aplicaciones de forma rápida y robusta y con la posibilidad de añadir funcionalidad desarrollada por terceros. Es una variante natural de la programación orientada a objetos.

La POO clásica se centra en el código fuente (las clases), que serán compiladas a un binario ejecutable. Si una clase cambia, hay que recompilar toda la aplicación, realizar las pruebas y quizás cambiar la implementación de otras clases. El desarrollo basado en componentes se centra en módulos intercambiables fabricados independientemente que no requieren conocer su implementación interna. Al cambiar un componente solo se realizan cambios en él, no hay que recompilar todo y se pueden actualizar en caliente. También es fácil extender la aplicación porque solo es añadir nuevos componentes. Todo esto reduce el coste de mantenimiento.

No es lo mismo programación distribuida que basada en componentes. En distribuído, los componentes están en distintas máquinas. En componentes, se pueden ejecutar en modo local o remoto con un protocolo común (mensajes, rpc, CORBA, JEE, .NET Remoting, etc. Requiere un middleware que proporcione servicios mínimos para localizar objetos, gestionar llamadas entre componentes, etc.

## 1.1. Reutilización de software
Dos tipos fundamentales de desarrollo tradicional de software: proyecto desarrollado en su totalidad línea por línea con solo la ayuda de herramientas de programación y bibliotecas, o bien se compra software estándar y se parametriza para proporcionar una solución que esté cerca de lo que necesita el cliente.

La producción de este tipo de software es costosa, sobre todo por el mantenimiento. Los proyectos grandes suelen fallar parcial o totalmente. Suponen un riesgo esencial en cuanto a interoperabilidad con otros sistemas locales. En un mundo de cambios rápidos, este tipo de software puede hacerse obsoleto antes de entrar en producción.

Con un software estándar disminuye el riesgo ya que el vendedor disminuye los problemas de mantenimiento, evolución e interoperabilidad. Requiere parametrización y configuración detallada entre versiones. Esto implica una reorganización del proceso de negocio. Como no está bajo control local, no se adapta rápidamente a cambios en los requisitos, que surgirán.

El reto es construir software rápidamente adaptable a los cambios y gestionar la cada vez mayor complejidad. Para ello usamos encapsulamiento, estándares, interacción entre aplicaciones o sus partes, desarrollo de un mercado industrial... en resumen, reutilización del software.

La reutilización de software tiene ventajas...

- Reducción de costes totales.
- Incremento de la fiabilidad.
- Reducción del riesgo del proceso.
- Uso efectivo de especialistas.
- Cumplimiento de estándares.
- Desarrollo acelerado.

...pero también desventajas:

- Incremento inicial de costes de creación.
- Faltan herramientas.
- Síndromes de "reinventar la rueda" y "no hecho aquí".
- Creación y mantenimiento de la biblioteca de módulos o componentes.
- Búsqueda, comprensión y adaptación de módulos o componentes.

Algunas formas de reutilización son bibliotecas de módulos o clases, patrones de diseño, frameworks de aplicaciones, desarrollo de software orientado a aspectos y líneas de productos de software. Formas de reutilización de componentes ejecutables son bibliotecas de módulos ejecutables, wrapping de sistemas legacy, COTS, aplicaciones configurables, frameworks de componentes, sistemas orientados a servicios, lenguajes específicos de dominio o generadores de aplicaciones MDD.

Framework: diseño de un sistema incompleto formado por varias clases concretas y abstractas e interfaces entre ellas, normalmente diseñados con patrones. Son complejos pero muy efectivos. También están relacionados con formas de reutilización basados en componentes.

Componentes "Commercial-off-the-shelf" (COTS): Un sistema de software que puede ser adaptado para diferentes clientes sin cambiar el código fuente del sistema. Los sistemas COTS tienen características genéricas y se puede utilizar en diferentes entornos. Permiten configurarse para adaptarse. Hay soluciones COTS genéricos para un tipo de negocio en particular o actividad empresarial. También las hay transversales, que proveen una función que puede ser usada por muchos sectores.

COTS a gran escala: ERP (Enterprise Resource Planning). Soportan los procesos de negocio comunes. Muy usados en grandes empresas. Se crea una instancia ERP configurando un sistema genérico con información sobre procesos y reglas de negocio del cliente.

Líneas de productos sofware: Una aplicación o familia que generaliza una arquitectura común que puede ser adaptada para diferentes clientes. La adaptación puede implicar configuración del sistema, selección en una biblioteca de componentes existentes, adición / modificación de nuevos componentes para satisfacer nuevas necesidades. Pasos para el desarrollo en este caso: Elicitar requisitos, encontrar el producto de la línea que mejor se adapte, renegociar requisitos, adaptar el sistema existente (desarrollo de nuevos módulos, cambios en la línea, documentar los cambios), entregar el nuevo producto de la línea.

DSL: Lenguaje dedicado a resolver un problema en particular. Hojas de cálculo, Mathematica, SQL, GUI-Builder...

MDD (Desarrollo Dirigido por Modelos): El código se genera a partir de los modelos de dominio. Se basan en la Arquitectura Dirigida por Modelos del OMG.

Generadores de programas: El conocimiento reutilizable se captura en un sistema generador, programado por expertos en el dominio utilizando un lenguaje específico del dominio. La descripción de la aplicación específica es un modelo abstracto.

## 1.2. Beneficios de los componentes
Los componentes pueden ser una posible solución de reutilización. Cada componente es un producto estandarizado con todas las ventajas, pero además se puede adaptar. Un producto que utiliza componentes combina la productividad e innovación de todos los vendedores de componentes.

La composición permite que cosas prefabricadas se usen en nuevas composiciones.

Configurar e integrar un objeto individual no es posible, un objeto no es un componente directamente. Los componentes añaden una concepción de la arquitectura como elemento de primer orden, interacción de elementos heterogéneos, destaca la importancia de las interfaces y tienen mecanismos de comunicación distintos a la invocación tradicional. Los componentes son unidades ejecutables de adquisición, implementación y despliegue independiente que pueden formar parte de un sistema, así que tienen algunas restricciones (empaquetados, no se pueden usar macros de C, declaraciones, plantillas de C++...) por ser ejecutables (no compilables).

Para que un componente sea viable, debe tener un amplio número de usos y clientes, con lo que más allá de la definición de OO hay que incluir la independencia y la composición a posteriori.

La principal ventaja es el mayor nivel de abstracción, facilitando la reutilización de implementaciones y diseños a un nivel de granularidad mayor que la clase. También facilita sistemas extensibles añadiendo nuevos componentes o nuevas interfaces a los ya existentes. También, independencia de un lenguaje de programación específico, con interacción transparente entre componentes en varios lenguajes, distribuidos o no. Muy importante los estándares.

Al ser binarios, se evita revelar algoritmos, alterar el código fuente de forma indeseada, no necesitas compilar evitando los problemas que conlleva, etc. Solo hay que desarrollar lo que no esté desarrollado ya o sea demasiado caro. Por tanto, es más rápido desarrollar nuevos sistemas. Es más fácil de actualizar, se pueden sustituir partes defectuosas, incluso según el entorno (si hay ligadura dinámica), en tiempo de ejecución. Facilita el desarrollo en paralelo de las distintas partes del sistema.

También hay riesgos: No hay control sobre todas las partes del sistema, el rendimiento es menor debido a la mayor cantidad de capas de abstracción, a veces puede fallar la integración del sistema si algún componente no respeta los estándares, es más complicado dirimir responsabilidades si algo falla.

### 1.2.1. Evolución de la tecnología de componentes

- Sistemas modulares procedimentales: En lenguajes como C o Pascal. Se llamaba al módulo y se esperaba el retorno.
- Tecnología orientada a objetos: El componente era un objeto instancia de una clase, tiene un estado y es extensible por herencia.
- Filtros y tuberías de Unix: Componentes desconocidos entre sí con dos puntos de conexión (stdin/stdout). Filtros como sed o awk. Lenguaje de composición: shell de unix.
- COTS.
- COM: componentes locales binarios con puntos de conexión estándar descritos por un lenguaje de definición de interfaces. OLE permite insertar una hoja de cálculo en un documento de otro tipo, ActiveX permite añadir controles a un formulario o web, ambos usan COM.
- CORBA, EJB, DCOM, COM+, .NET: Soporta un middleware, puede que integrado en el SO.
- Lenguajes de Descripción de Arquitectura de software.
- SOA (service-oriented architecture).

Servicios web: procedimiento de conexión interpretado, no compilado. Es más flexible pues no hay que recompilar. Usa un protocolo (http) independiente de middlewares. Los puntos de conexión se describen con XML, JSON. El procedimiento de conexión es la interpretación de SOAP/WSDL o REST.

### 1.2.2 Mercado y estándares
Los componentes son activos reutilizables. Resolver un problema general requiere más recursos que resolver uno concreto. Solo son viables si la inversión se recupera como resultado de su venta/reutilización.

Una tecnología imperfecta es sostenible si tiene un mercado que funciona. Una tecnología perfecta sin mercado no lo es. La producción de componentes debe ser más económica que la producción de soluciones completas. Si un componente se empaqueta con componentes similares, disminuye sus costes de distribución.

La estrategia de microsoft es expandirse en mercados ya establecidos: Controles VBX -> controles OLE (OCX) -> ActiveX

Hay tres modelos comerciales de componentes: CORBA de la OMG, (Enterprise) JavaBeans de Oracle y COM/COM+ (OLE, ActiveX) y .NET de Microsoft.

Hay otros mercados de componentes open source como Bonobo de Gnome o Kparts de KDE.

Dado un mercado de desarrolladores independientes de componentes, nadie sabe todas las posibles combinaciones. Por tanto, éstos deben ser totalmente modulares. Se debe garantizar la seguridad (no colapsar todo el sistema ante un fallo), la funcionalidad y el rendimiento.

Casos de éxito: Servicios verticales (modelos compartidos por distintas organizaciones en un dominio) u horizontales (servicios comunes a varios dominios de negocio).

Son necesarios estándares para establecer acuerdos entre distintos modelos de componentes que permitan su interoperabilidad. Definen interfaces, adaptadores si son necesarios, framework que ensambla los componentes y middlewares como servicios comunes.

Middlewares: mecanismos y protocolos de interacción, servicios de repositorio de interfaces y componentes, servicio de entrega de mensajes, gestión de transacciones, comunicaciones seguras, etc.

Herramientas: programación visual, instalación de componentes, grupos de componentes importantes (acceso a db, creación de GUI, visualización de datos, etc). Para distribución, suele haber asistentes de empaquetamiento, registro automático, etc.

## 1.3. Fundamentos y definiciones
Componente != objeto. Un componente se puede implementar mediante lenguajes no orientados a objetos, y además puede encapsular un sistema legado que no tiene por qué ser OO. Pero las similitudes hacen que la POO sea muy apropiada para desarrollar componentes. Un componente puede estar implementado internamente con varios objetos.

Definición de componente: Unidad de composición de aplicaciones software, que posee un **conjunto de interfaces** y un conjunto de **requisitos** y que tiene que poder ser desarrollado, adquirido, incorporado al sistema y compuesto con otros componentes de forma independiente, en tiempo y espacio.

Propiedades: Unidad de implementación independiente. Puede ser fabricado por terceras partes. No puede ser parcialmente implementado. Descrito por las interfaces que proporciona y las que requiere, y por el código ejecutable accesible a través de esas interfaces. No tiene estado observable.

Los componentes tiene más mecanismos de intercomunicación, suelen ser más grandes y complejos, y suelen usar almacenamiento persistente, a diferencia de los objetos.

Ciclo de vida del componente: Especificación a través de especificar sus interfaces -> implementación en un entorno y lenguaje concretos -> despliegue -> instalación.

Un componente no tiene por qué tener solo clases, puede estar diseñado en cualquier paradigma o mezclas.

En el despliegue puede que el entorno requiera ciertas interfaces y deberá ser adaptado a según qué entorno o plataforma.

La herencia puede generar problemas, por lo que se puede usar dentro del componente pero queda abstraída hacia fuera.

## 1.4. Interfaces y contratos
Las interfaces determinan las operaciones que el componente implementa y las que precisa utilizar de otros componentes durante la ejecución. Incluye atributos y métodos públicos más eventos que emite. Esta especificación es un contrato. Si cliente y componente lo respetan, todo irá bien.

Al definir las interfaces al margen de la implementación, se puede cambiar la implementación sin cambiar la interfaz o añadir nuevas interfaces e implementaciones sin cambiar lo ya existente.

Hay interfaces importadas especificando los servicios que requiere el componente, y exportadas que describen los servicios que ofrece el componente.

La especificación de la interfaz para el usuario es una definición precisa de las operaciones del componente y sus dependencias. Debe se precisa y completa pues es la única interfaz visible para el usuario. Para los desarrolladores, esta especificación proporciona una definición abstracta de su estructura interna.

Las interfaces se definen de forma estándar utilizando un lenguaje de definición de interfaces, pero que no llega a describir atributos de calidad como precisión, disponibilidad, seguridad, etc.

Estándares IDL: CORBA, Microsoft COM DCOM COM+, .NET, EJB, UML, WSDL...

Características de Corba IDL: Describe operaciones y parámetros de cada interfaz, lenguaje declarativo, sintaxis similar a C++, preprocesado como C++, usa charset ISO-Latin1, usa Common Object Request Broker Architecture and Specifications del OMG. Tipos de datos estilo C++.

Las definiciones IDL de interfaces se usan para generar interfaces y esqueletos de código en lenguajes convencionales.

Una clase o componente implementa una interfaz proporcionando sus servicios. Una interfaz requerida indica que un clasificador utiliza los servicios definidos por la interfaz.

Los componentes pueden ser sustituidos si el nuevo componente implementa al menos las mismas interfaces que el componente antiguo, y la interfaz del nuevo componente es un subtipo de la interfaz del componente antiguo.

Semántica de la especificación de contratos: Una especificación más precisa del comportamiento de un componente se puede lograr mediante:

- Invariantes: Expresión sobre el estado de la interfaz que se cumple siempre.
- Pre-condición: Afirmación que el componente asume que debe cumplirse antes de invocar la operación. En general, es una expresión con los parámetros de entrada de la operación y su estado.
- Post-condición: Es una afirmación de lo que el componente garantiza que se cumplirá después de que la operación haya sido invocada siempre que las condiciones previas fueran ciertas. Es una expresión con los parámetros de entrada y salida, y el estado inmediatamente antes y después de la invocación.

Frameworks: Diseño reutilizable de un sistema, esqueleto de una aplicación que puede ser personalizada por el desarrollador de aplicaciones. Un framework de componentes es un bloque con ranuras en el que se insertan los componentes.

Modelo de componentes (!= framework de componentes) define un conjunto de estándares y convenciones usadas por los desarrolladores. Define las "ranuras" del framework.

Pero los frameworks también imponen obligaciones, pero los frameworks se centran en las propiedades globales de las composiciones.

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
