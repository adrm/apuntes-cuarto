# 1. Introducción a los protocolos de red
## 1.1 ¿Qué es un protocolo?
Problemas que pueden presentarse en la comunicación a través de una red:

- Fallos en el hardware que deben ser detectados.
- Congestionamiento en la red o en una máquina.
- Paquetes retrasados o perdidos.
- Corrupción de datos.
- Errores en la secuencia de datos o duplicación.

Para resolverlos, estos problemas deben clasificarse, y deben utilizarse protocolos específicos para cada uno de ellos. Podemos definir un protocolo como un conjunto de normas que permiten la comunicación entre dos entidades. Dichas comunicaciones pueden ser tanto a nivel de bits como a niveles más altos de abstracción, como el protocolo de intercambio de páginas web http.

## 1.2 Organización de protocolos por capas
La organización natural de esos protocolos es por capas: cada capa tiene su nivel de abstracción. Enviar un mensaje significa transferir el mensaje hacia abajo: conceptualmente, el nivel n de una máquina se comunica con el nivel n de la otra. Los detalles de implementación hacen que esta división no sea tan sencilla.

## 1.3 El modelo OSI
Hay que decidir las funciones de cada capa. El modelo de referencia para ello es OSI (Open Systems Interconnect), definido por la ISO:

Capa | Función
---- | -----------------------------------
7    | Aplicación
6    | Presentación
5    | Sesión
4    | Transporte
3    | Red
2    | Enlace de datos (interfaz hardware)
1    | Conexión física

En la práctica, los niveles 5, 6 y 7 se agrupan en una única capa llamada "de aplicación".

### 1.3.1 Capa física
Transmite **bits** a través de un canal de comunicación. Define los valores eléctricos del 0 y el 1, duración en microsegundos de un pulso, si la comunicación puede ser simultánea, cómo se establece y libera la conexión y el formato del medio físico usado como enlace. Los problemas de diseño en esta capa son básicamente de tipo eléctrico, electrónico y mecánico.

### 1.3.2 Capa de enlace
Transmite **tramas**. Proporciona un mecanismo de conexión _fiable_ entre dos máquinas sobre el enlace físico. Se suele utilizar para ello un mecanismo de envío y confirmación de tramas, reenviando las defectuosas. Como pueden perderse enteras, puede darse lugar a envío de tramas duplicadas. Estándares de ejemplo: Token Bus, Token Ring y Ethernet.

### 1.3.3 Capa de red
Transmite **paquetes de red**. Controla la transmisión a través de una red cuando la transmisión implica pasar a través de subredes intermedias. Problema del encaminamiento: elegir el mejor camino. Define un espacio de nombres común a toda la red, de forma que origen y destino están identificados unívocamente.

Problemas a resolver de esta capa son el uso de caminos alternativos dinámicamente, detección de bucles, evitar la congestión, llevar la contabilidad, solucionar problemas derivados de usar distintas redes, etc.

### 1.3.4 Capa de transporte
Transmite **paquetes de transporte**. Suministra una transmisión _fiable_ a las capas superiores usando los servicios de transmisión no fiables de la capa de red. Acepta información de niveles superiores, la divide en paquetes y la pasa a la capa de red para que los envíe, detectando errores y ordenando las correspondientes retransmisiones.

Utiliza _conexiones virtuales_ para asegurar que la información llega correctamente y en orden. Al inicio de la transmisión se establece la conexión, se transmiten los datos y finalmente se cierra. La conexión es del origen al destino, la transmisión entre dispositivos intermedios es tarea de las capas inferiores.

### 1.3.5 Capa de aplicación
Agrupa, en la práctica, las de sesión, presentación y aplicación. Resuelven problemas concretos de la interpretación de la información entre las máquinas origen y destino.

### 1.3.6 Estratificación de protocolos por capas
Cada nivel recibe los datos a enviar desde su nivel superior, les añade una cabecera y los pasa al nivel inferior. En el destino, el proceso se invierte.

## 1.4 Implementación en redes existentes: protocolo TCP/IP
### 1.4.1 Modelo TCP/IP
No es lo mismo que Protocolo Internet. El modelo TCP/IP es fiel al modelo OSI pero no incluye capas de presentación y sesión y une la capa física y la de enlace.

No tiene su origen en un comité de estándares. Consta de cuatro capas conceptuales (Transporte, Internet, Interfaz de red y Red interior) sobre una capa de hardware.

En la capa de transporte se usan básicamente dos protocolos: TCP y UDP

### 1.4.2 Topología: consideraciones de diseño

- Se ocultará al usuario la arquitectura subyacente.
- No se impondrá una topología de interconexión de red.
- Los datos podrán circular a través de redes intermedias entre origen y destino.
- Todas las máquinas comparten un juego universal de identificadores (direcciones IP).
- Se pueden interconectar redes con routers IP.

### 1.4.3 Topología: punto de vista del usuario
Se presenta Internet como una sola red virtual, obviando las redes que la forman. Esto requiere que el software permita al usuario interactuar con una red virtual. De esta forma, hay una independencia con la tecnología de conexión física subyacente, favoreciendo la transportabilidad de las aplicaciones.

### 1.4.4 Capa física
Utiliza un medio físico para codificar una señal. No resuelve el problema de identificar el destino en un medio compartido, ni permite conectar máquinas en redes distintas. Es parte de la Teoría de la Señal.

### 1.4.5 Capa de enlace
Añade un identificador de interfaz (dirección MAC) para identificar origen y destino en un medio compartido. Comprueba que las tramas no se corrompan, pero no si se pierden. Conexión entre todas las máquinas en la transmisión

### 1.4.6 Capa de red
Define una dirección unívoca para cada interfaz de red en toda Internet (dirección IP). Define un mecanismo de encaminamiento de paquetes de datos entre máquinas en distintas redes. Comunicación entre origen y destino directamente.

### 1.4.7 Capa de transporte
Identifica distintas aplicaciones situadas en una máquina (puertos), proporcionando comunicación entre un programa de aplicación y otro, a través de flujos continuos de datos. Permite intercambiar datos sin errores y en secuencia usando mecanismos de control como el protocolo TCP.

### 1.4.8 Dos fronteras importantes en el modelo TCP/IP

- Frontera de dirección de protocolo de bajo nivel: Separa el software que utiliza direcciones de bajo nivel (físicas) y el software que utiliza direcciones de alto nivel (IP). Todo el software de protocolo desde la capa de Internet hacia arriba utiliza solo direcciones IP.
- Frontera de dirección de protocolo de alto nivel: Separa el software que suele ser del sistema operativo del que no lo es. El software resultante de una estratificación puede ser ineficaz. Típicamente se envía hacia arriba la selección de ruta y la MTU para optimizar la transmisión de las capas superiores.

### 1.4.9 Capa de aplicación
Contiene las aplicaciones que utilizan los servicios de Internet (aplicaciones de correo, servicio web, ftp...). Un protocolo muy útil es el Servicio de Nombres de Dominio (DNS).

Algunos protocolos de aplicación:

- `http`: Intercambio de páginas web. Supera el tráfico de ftp en 1995. Permite hipertexto. Define los recursos con una URL absoluta en la red. El host puede ser una ip o a través de DNS.
- `smtp`: Envío, recepción y retransmisión de correo electrónico. Otros relacionados son pop o mime.
- `ftp`: Transferencia de ficheros.
- `telnet`: Sesiones remotas de trabajo en una máquina conectada en otro punto de la red. La versión cifrada se denomina ssh.
- Otros: `ntp` (network time protocol), `nfs` (network file system), etc.

# 2. La pila de protocolos TCP/IP
## 2.1. Introducción a la arquitectura Internet
### La capa de red
Define una dirección unívoca para cada interfaz de red en toda Internet (Direcciones IP) y un mecanismo de encaminamiento de paquetes de datos entre máquinas en distintas redes.

### La capa de transporte
Suministra un servicio de conexión eficiente y fiable a las capas superiores, tanto orientados a la conexión (TCP) como no (UDP). Añade un mecanismo de identificación de aplicaciones dentro de una misma máquina (puertos).

## 2.2 Direcciones IP
### Definición y tipos primarios
Permite que cada máquina de la red se comunique con cualquier otra. Es un servicio universal de comunicaciones. La dirección IPv4 es un número de 32 bits con dos partes: netid (identificador de red) y hostid (identificador de la conexión). Una máquina puede tener más de una IP.

### Direcciones de red y de difusión
El hostid 0 referencia a la propia red. El hostid 1 equivale a mensajes en modo difusión (broadcast) a todos los nodos de la red. La difusión se realiza por hardware y no se garantiza su disponibilidad.

### Notación decimal con puntos
Las IP se suele escribir como cuatro enteros decimales de un byte separados por puntos. Entre 1981 y 93 se usó una división en clases del espacio de direcciones para facilitar la asignación.

### Encaminamiento entre dominios sin clases (CIDR)
Desde 1993 se usa un sistema más flexible que impide la saturación del espacio de direcciones. Notación: dirección ip seguida del número de bits que corresponden a la máscara de subred.

### Direcciones públicas y privadas
La autoridad central IANA (Internet Assigned Numbers Authority) asigna los espacios de direcciones de Internet. Solo pueden utilizarse direcciones sin permiso en caso de que se trate de una red local no conectada a Internet. Aún así es una mala práctica, con lo que se definen tres espacios de redes privadas: 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16 y la dirección 127.0.0.1 que se reserva para loopback a la propia máquina sin generar tráfico en la red.

### Desventajas del direccionamiento IP

- La IP se refiere a una conexión de red, no a una máquina. Si la máquina cambia de red, su IP debe cambiar.
- El espacio de direcciones está saturado. Se mitiga con IP dinámica.
- Se ha propuesto una revisión de IPv4 denominada IPv6 pero no tiene mucha implantación. No es compatible con IPv4 y necesita pasarelas de transición.
- El camino que toma un mensaje depende de la IP utilizada porque el encaminamiento usa el netid.

## 2.3 Capa de enlace: protocolos ARP, DHCP
### Direcciones IP a MAC: protocolo ARP
Las tarjetas de conexión a red tienen dirección física única (MAC, Media Access Control) determinada por un número correspondiente al fabricante y a la tarjeta en concreto. Por cada dirección IP tiene que existir una única dirección física. El problema es conocer la dirección física conociendo la IP. Se resuelve en el nivel de red (capa 3) con el protocolo ARP.

Si los dispositivos que se comunican están en la misma subred, el origen tiene que obtener la MAC del destino. Si están en distintas subredes, el origen tiene que obtener la MAC del router, que a su vez lo reencaminará.

Para ello existe ARP (Address Resolution Protocol). Su implementación depende de la tecnología física de la red. Consideramos el caso de Ethernet. Cada interfaz Ethernet tiene una MAC de 48 bits. Para que A obtenga la MAC de B:

1. A transmite un mensaje de difusión que solicita a la máquina con dirección IP B que indique su dirección física MAC B.
2. Todos reciben la solicitud pero solo B responde.
3. Cuando A recibe la respuesta de B, utiliza MAC B para enviarle el mensaje directamente.

A no puede enviar el mensaje directamente por difusión porque es caro. Así solo se envía un mensaje por difusión. Para reducir el coste, cada máquina mantiene una tabla de asignaciones ARP recientes. A incluye en la solicitud ARP su propia MAC, puesto que es probable que B tenga que contestar. Si otra máquina escucha la petición ARP, almacena en su tabla el par (IP A, MAC A). ARP permite abstraer el direccionamiento físico subyacente de la red permitiendo una asignación de IP arbitraria.

Puede ser que B esté apagada o muy ocupada, o que se pierda la solicitud de A. A debe almacenar el paquete hasta conocer la MAC de B. En caso de que A tenga la MAC de B y B haya cambiado de MAC por algún problema de hardware, A tiene que actualizar periódicamente la tabla ARP.

### ARP inverso: de MAC a IP
La IP no está relacionada con el hardware, está en un fichero de configuración del SO. Algunos terminales no tienen disco y arrancan en red. Entonces, para determinar su IP envían una solicitud en difusión al servidor indicando su propia MAC.

Algunos protocolos que lo resuelven son RARP (obsoleto), BOOTP (solicita la localización en red para la imagen de arranque) o DHCP (que incluye otras funciones a mayores).

Puede ser que en una red existan más dispositivos que IPs. En ese caso, se asignan dinámicamente con DHCP (Dynamic Host Configuration Protocol) normalmente en el arranque del dispositivo. Cuando el nodo se apaga pierde su IP aunque se puede relacionar una IP con una MAC o reutilizarlas por otros dispositivos.

## 2.4 Capa de red: protocolo Internet (IP)
Los usuarios deben concebir Internet como una única red virtual, ocultando la arquitectura. Hay tres conjuntos de servicios que lo facilitan:

- Servicios de aplicación: Aplicaciones que hacen uso de la red como HTTP, FTP, etc.
- Servicio de transporte fiable: Plataforma de alto nivel. Protocolo TCP.
- Servicio sin conexión: Mecanismo fundamental de entrega, protocolo IP.

### Entrega no fiable y sin conexión
El servicio se define como un sistema de entrega de paquetes _no fiable, sin conexión y con el mejor esfuerzo_, al igual que el hardware de red.
- No fiable: La entrega no está garantizada. Los paquetes pueden perderse, duplicarse, retrasarse o desordenarse y el protocolo no informará de estos errores.
- Sin conexión: Cada paquete se trata independientemente del resto.
- Mejor esfuerzo: No se desechan paquetes arbitrariamente.

El protocolo IP se encarga de establecer el formato de los datos a intercambiar y las funciones de encaminamiento de los paquetes a través de la red.

### Datagrama IP: formato
El **datagrama** es la unidad básica de transmisión del protocolo IP. Ni el contenido ni el formato de los datagramas está condicionado por ningún tipo de hardware.

### Datagrama IP: descripción de sus campos

- VERS: Versión del protocolo.
- HLEN: Tamaño del encabezado en múltiplos de 32 bits.
- Tipo de servicio: Especifica cómo debe manejarse el datagrama para facilitar su encaminamiento:
        - Prioridad (1 byte)
        - Si solicita procesamiento con retardos cortos
        - Si solicita rapidez en el envío
        - Si solicita fiabilidad
- Longitud total del datagrama. El campo es de 16 bits así que la longitud del datagrama es como mucho 65.535 bytes.

### Datagrama IP: encapsulación, tamaño
El datagrama debe enviarse por un medio físico que puede poner restricciones al tamaño. Si es posible, el datagrama se encapsula en una _trama_ de la capa de enlace. Esto provoca que un datagrama tenga que moverse a veces por distintas redes con distintos MTU. Si se limita el tamaño del datagrama a la menor MTU se provocan ineficiencias.

### MTU y fragmentación de una trama
El software IP deberá seleccionar un tamaño inicial adecuado y permitir a los routers fragmentar o defragmentar las tramas.

Campos del datagrama relacionados con la fragmentación:

- Identificación: Se copia en cada fragmento para saber el datagrama al que pertenece.
- Desplazamiento: Indica el desplazamiento de sus datos en múltiplos de 8 bytes.
- Banderas: tres bits que controlan la fragmentación: si es el último fragmento, si ese datagrama puede fragmentarse (para depuración de redes)

Con el tamaño del datagrama original, los offests y el bit de último fragmento, se puede reconstruir. El tamaño del fragmento se selecciona para que equivalga a una sola trama.

### Tiempo de vida de una trama
Especifica el tiempo en segundos que el datagrama puede estar en la red sin ser entregado. Se decrementa en cada router, con más o menos precisión. Si llega a cero, se desecha el datagrama y se envía un mensaje de error. Evita paquetes eternamente dando vueltas debido a tablas de encaminamiento erróneas, etc.

### Otros campos del datagrama

- Protocolo: Especifica el protocolo de alto nivel que ha creado el mensaje.
- Suma de verificación del encabezado: Controla la integridad del encabezado. No se verifican los datos.
- Dirección IP fuente y destino finales: No cambian nunca.
- Campos dependientes del campo opciones: longitud variable según opciones elegidas.
- Registro de ruta: permite al emisor que los routers añadan su ip a una lista.
- Encaminamiento fuente: permite al emisor determinar la ruta a seguir a través de la red para probar una red física en particular. Estricto, si se produce un error si no es posible, o no estricto si se permite algún salto.
- Sello de hora: Permite que cada router ponga un sello de hora en ms.

### Encaminamiento IP
Directo si las dos máquinas están en una sola red. No necesita routers. Indirecto si no, y es necesario usar routers.

### Tipos de encaminamiento

- Encaminamiento controlado por tabla: Emplea una tabla de encaminamiento IP. Las tablas pueden ser muy grandes así que se guardan las direcciones de los routers próximos.
- Encaminamiento con salto al siguiente: Tabla con dos campos, ip de la red de destino y siguiente router a esa red. Solo se añaden routers que puedan alcanzarse directamente. No hay info sobre máquinas concretas.
- Rutas asignadas por omisión: Muchos registros asociados a un router por omisión. Es útil si es una máquina que tiene pocas direcciones locales y pocas conexiones con el resto de Internet.
- Rutas por máquina específica: Se especifica una ruta para alcanzar una cierta máquina. Útil para depurar redes y tablas de encaminamiento, pero contradice el encaminamiento al especificar direcciones de máquinas y no solo de subredes.

### Manejo de los datagramas entrantes
El software IP debe manejar también los datagramas que entran a la red. Si el datagrama va destinado al router, éste lo procesa y lo envía a capas superiores. Si no, si es para alguien de su subred lo entrega, y si no lo encamina.

### Orden de los bytes en la red
Para que la comunicación sea independiente de arquitecturas concretas, debe definirse una representación estándar. En internet es Big Endian (el byte que se envía primero es el más significativo). La capa de red hace la conversión.

## 2.5 Capa de transporte: protocolo de datagramas de usuario (UDP)
El protocolo UDP proporciona el mecanismo primario que permite a las aplicaciones intercambiar datagramas de datos, con IPs para encaminar y puertos para varios destinos en una misma máquina. Las aplicaciones que usen UDP tienen que resolver los problemas de fiabilidad.

Cada mensaje UDP es un datagrama de usuario en contraposición al de sistema o datagrama IP. El formato es un puerto UDP de origen (opcional, solo para responder), otro de destino, la longitud del mensaje en bytes y la suma de verificación.

El datagrama UDP va en un datagrama IP. UDP es un protocolo de transporte. IP lleva de una máquina a otra, UDP distingue entre puertos en la máquina.

Al demultiplexar por puerto, puede ser que no exista el puerto o que esté saturado, caso en el que se produce un error.

Algunos puertos bien conocidos UDP están reservados (servicios).

## 2.6 Capa de transporte: protocolo de transporte fiable (TCP)
Transporte de datos de flujo fiable. Cinco funciones básicas:

1. **Orientación de flujo**: Se reciben los bytes en el mismo orden en que se envían.
2. **Conexión de circuito virtual**: se establece una conexión, se realizan las transferencias y se libera la conexión.
3. **Transferencia con memoria intermedia**: Los datos se agrupan o dividen hasta que tengan el tamaño que permita la mayor eficiencia.
4. **Flujo no estructurado**: El flujo de envío y recepción de datos es continuo, por lo que no existen marcas en él. Si se necesitan hacer separaciones, deben hacerse con un protocolo propio superior.
5. **Conexión full duplex**: se permite transferencia concurrente en ambas direcciones.

TCP es un protocolo de transmisión que especifica el formato de los datos y acuses de recibo necesarios para una transferencia fiable, los protocolos necesarios para asegurar la llegada correcta de los datos, mecanismos que permiten establecer y liberar una conexión, sistema de puertos para distinguir entre aplicaciones de una misma máquina. Asume muy poco sobre la red subyacente para ser general- No incluye una descripción necesaria para utilizarlo, se usa POSIX con la interfaz socket.

TCP también usa puertos pero se puede usar el mismo número de puerto para TCP y UDP pues son protocolos distintos. La conexión TCP se identifica como máquina + puerto así que varias máquinas pueden conectarse al mismo puerto.

Formato del segmento TCP: Puerto origen, destino, número de secuencia (posición de los datos en el segmento de flujo de datos), número de acuse de recibo (indica qué número de byte se espera recibir después), code bits (codifican el propósito del segmento), HLEN, ventana, checksum, opciones.

Los acuses de recibo se refieren a bytes porque los segmentos pueden tener longitud variable. Los números de secuencia se usan para reordenar los segmentos. Al enviar un segmento, si no se recibe acuse de recibo en un tiempo determinado, se reenvía. TCP monitoriza la conexión y calcula variables razonables para este temporizador (RTT)

Conexión TCP:

SYN (seq x) --(a to b)--> SYN (seq y), ACK (seq x+1) --(b to a)--> ACK (seq y+1) --(a to b)--> Conexión confirmada.

Desconexión:

Envío de FIN, responde con ACK. Después, la otra máquina hace lo mismo.

## 2.7 Ejemplo de capa de aplicación: el servicio DNS
Sistema plano, no jerárquico.

Hay servidores de nombres con tablas de ips asociadas a nombres de dominio, o ip de otro servidor de orden superior. De esta forma, se organizan jerárquicamente. Si no conoce lo que se solicita, un servidor de nombres pregunta al servidor de nombres superior a él y así sucesivamente. Cuando llega al central, va pasando la petición sucesivamente al encargado de cada dominio. Primero .com, luego google.com, etc. Por eso cada organización tienen que tener un servidor DNS.

# 3. El modelo cliente-servidor
## 3.1 Arquitectura cliente-servidor
TCP/P no tiene manera de arrancar un programa cuando llega un mensaje. En cliente-servidor esto se resuelve estableciendo un programa que comienza su ejecución y espera indefinidamente por mensajes.

Cliente: aplicación que inicia la comunicación de par a par con el servidor, enviando una solicitud y recibiendo un resultado. Servidor: Aplicación que espera a que un cliente se comunique con ella.

Los servidores suelen necesitar permisos especiales del SO así que hay que tener cuidado con que el cliente no pueda recibir esos privilegios.

Un cliente puede invocar servicios TCP/IP estándar (well known) o locales. Otros clientes más generales permiten parametrización pudiendo elegir ip de conexión y puerto. Se recomienda que se pueda indicar el puerto, al menos para pruebas.

Servicios orientados a conexión: TCP. No orientados:  UDP. UDP se usa si el protocolo de aplicación lo exige, si está basado en multicast o broadcast o si la máquina no puede soportar la sobrecarga por el cómputo de circuitos virtuales TCP. De lo contrario es recomendable usar TCP siempre.

Puede ser que un servidor sea cliente de otro servidor.

Un servidor puede contestar simultáneamente ya sea conmutando o con multiprocesamiento real. El cliente no necesita mucha concurrencia.

El proceso es la unidad fundamental de computación. En unix hay concurrencia con `fork()`, que divide un proceso en dos que se ejecutan sobre el mismo código. `fork()` devuelve un valor diferente para cada copia del proceso (0 para los hijos, en el padre devuelve el id del hijo), y de esta forma se puede hacer que cada proceso haga algo distinto.

Se puede reemplazar al hijo por nuevo código con execve(nombre del fichero de código ejecutable, puntero a parámetros, puntero a variables de entorno). Se debe llamar primero a `fork()` y después a `execve()`.

## 3.2 Consideraciones de diseño de clientes
Los clientes son conceptualmente mucho más simples que los servidores porque no tienen necesidad de soportar concurrencia, no necesitan privilegios especiales para su ejecución y no requieren de una protección especial al estar protegidos por el SO.

Para localizar un servidor a través de su dirección IP y su número de protocolo, hay varias opciones:

- Declararlas como constantes del programa.
- Pedirle al usuario que identifique el servidor

## 3.3 Consideraciones de diseño de servidores
## 3.4 Diseño e implementación de un sistema cliente-servidor
