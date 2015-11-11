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
