# 5. Servicios web ([PDF](originales/5-serviciosWeb.pdf))
## 5.1 Introducción a los servicios web
El problema es la interacción entre organizadores. Para ello se proponen arquitecturas orientadas a servicios web, que son un tipo de sistemas distribuidos donde los componentes son servicios autónomos. Estos servicios pueden ejecutarse en diferentes equipos de diferentes proveedores de servicios. Los sistemas, entonces, se pueden comunicar de manera directa sin actores humanos.

Los servicios pueden proporcionarse localmente o externalizados a proveedores externos. Son independientes del lenguaje, y se puede preservar la inversión en sistemas legados.

La computación entre organizadores se ve facilitada a través del intercambio de información simplificada y estandarizada.

Existen protocolos estándar para el intercambio de información, la definición de servicios y el registro de servicios.

Algunas ventajas de la arquitectura orientada a servicios (SOA) son:

- Cuando el sistema está siendo programado o desplegado no es necesario decidir qué proveedor de servicios se debe utilizar o qué servicios específicos debe utilizar.
- En un escenario de un coche que se va moviendo, el ordenador de a bordo podría usar el servicio de descubrimiento de servicios para encontrar el servicio de información más próximo.
- Si se usa un servicio de traducción, el sistema puede utilizarse en distintos países y hacer que la información local esté disponible para las personas que no hablan el idioma local.

## 5.2. Estándares SOAP, WSDL y UDDI
### SOAP (Simple Object Access Protocol)
Es un estándar de intercambio de mensajes que soporta servicios de comunicaciones. La información (el cuerpo) del mensaje se completa con una cabecera y ambas partes se insertan en un "sobre".

Un cliente invoca el servicio como llamada local, invocando al motor SOAP que prepara el mensaje SOAP. El mensaje SOAP se empaqueta en HTTP y se pasa a un cliente HTTP que lo envía al proveedor. En el proveedor, el mensaje es recibido por un servidor HTTP que le pasa el contenido a un router SOAP, que parsea el mensaje e identifica a qué servicio debe hacérselo llegar.

### WSDL (Web Service Definition Language)
Es un lenguaje de descripción de interfaces de servicios. La interfaz del servicio web se escribe con WSDL. La especificación WSDL define qué operaciones soporta el servicio y en qué formato se envían y reciben los mensajes, cómo se accede al servicio, y dónde está localizado (generalmente expresado como una URI).

Una especificación WSDL contiene una introducción con las declaraciones de espacios XML, una parte abstracta con las declaraciones de tipos, interfaces, tipos de puertos, mensajes y operaciones; y una parte concreta con las ligaduras (bindings) y puertos.

### UDDI (Universal Description Discovery and Integration)
Define la especificación para descubrir la existencia de un servicio. Expone los detalles de la empresa que presta el servicio, una descripción informal de la funcionalidad que proporciona el servicio, información sobre dónde encontrar la especificación WSDL del mismo, e información de suscripciones que permitan a los usuarios registrarse para tener mejoras del servicio.

### Otros protocolos
- WS-BPEL (Business Process Execution Language): Lenguaje estándar para la composición de servicios web.
- WSCI/CDL (Web Services Choreography Interface/Choreography DL): Coordinación incluso entre distintas organizaciones.

La base de todos ellos es XML.

## 5.3. Servicios RESTful
Los estándares de servicios web han sido criticados como pesados e ineficientes. Por ello el mercado está dominado por REST (Representational State Transfer), que es un estilo arquitectónico más simple que SOAP/WSDL basado en la transferencia de la representación de los recursos desde un servidor a un cliente.

Los servicios RESTful implican una sobrecarga menor y muchas organizaciones los utilizan en sistemas que no dependen de servicios externos. Ahora mismo están generalizados y son usados por proveedores como Google o Amazon.

### Principios REST
- Protocolo cliente/servidor sin estado, y basado en capas.
- Sintaxis universal para identificar los recursos: su URI.
- Conjunto de operaciones bien definidas que se aplican a todos los recursos de información: en HTTP son POST, GET, PUT y DELETE. También los tipos de contenidos transferidos está definido y limitado a través de los tipos MIME.
- Uso de hiperenlaces, tanto para la información como para las transiciones de estado de la aplicación.
- Cada mensaje contiene la información necesaria para comprender la petición. Los mensajes se denominan, por tanto, autocontenidos. El uso de HTTP como protocolo de aplicación facilita esto.

HTTP proporciona muchas de estas características de serie, por lo que es el protocolo de aplicación usado para REST.

### Recursos
El estado y la funcionalidad de las aplicaciones se divide en recursos. Es decir, REST está orientado a recursos, no a métodos. Sin embargo, no se accede directamente a los recursos, sino a representaciones de los mismos en formatos identificados por su mimetype que informan del estado del recurso.

REST usa cuatro métodos para actuar sobre un recurso identificado por su URI. Estos son:

Método 	| Función
-------	|---------
GET	| Solicitar recurso
POST	| Crear recurso nuevo
PUT	| Actualizar o modificar recurso
DELETE	| Borrar recurso

### Niveles de madurez de servicios REST
En el nivel más elemental no tenemos REST sino "plain old RPC": solo se usa un método HTTP sobre una URI para ejecutar algún procedimiento.

El nivel 1 es el que introduce una URI para cada recurso pero se sigue usando un único método HTTP.

En el nivel 2 se introducen múltiples verbos HTTP.

En el nivel 3 se introduce el concepto denominado "hypermedia", que permite que un recurso se autoexplique y el cliente no deba conocer la interfaz de antemano pues cada respuesta refleja la uri de los recursos relacionados sobre los que se puede actuar.

## 5.4. REST: detalles de implementación
Los servicios se modelan como recursos y permiten su acceso mediante su URI, respondiendo a los verbos HTTP. La información se puede codificar en XML u otras representaciones como JSON.

SOAP y REST no son incompatibles, y un mismo servicio se puede proporcionar a través de las dos interfaces. En el caso de Amazon, ofrece las dos y los desarrolladores prefieren REST.

Un principio básico de REST es respetar el significado de los verbos HTTP, por lo que una solicitud GET debe ser idempotente. Los verbos HTTP se interpretan como operaciones CRUD.

Un servicio REST se puede describir a través de WADL (Web Application Description Language), que es un archivo basado en XML que contiene las operaciones disponibles y su forma de acceso usando HTTP.

### REST y SOAP

Ventajas de REST:

- Mejora el tiempo de respuesta gracias al mecanismo de caché y los mensajes autodescriptivos.
- Disminuye la carga del servidor (no hay estado), permitiendo mayor escalabilidad.
- Facilita el desarrollo de clientes al reducir la dependencia con el servidor.
- Mayor estabilidad frente a futuros cambios.

Inconvenientes de REST:

- REST puede no ser adecuado para situaciones que involucren sistemas complejos o transacciones.
- Es poco flexible.
- Puede fallar en servicios web que necesiten procesado de datos.
- Tiene grandes problemas de seguridad al no soportar el concepto de sesión.

Inconvenientes de SOAP:

- No es transparente, apuesta por el encapsulamiento.
- No dispone de un sistema de direccionamiento global.
- Puede derivar en agujeros de seguridad.
- No aprovecha muchas de las ventajas de HTTP al usarlo solo como túnel.
- No puede hacer uso de las cachés.
