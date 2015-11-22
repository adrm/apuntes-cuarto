## 3.3 SCRUM ([PDF](originales/PGP_Present_SCRUM_1415.pdf))
### Introducción
Aunque el esquema de desarrollo de software tradicional ha sido útil para proyectos grandes y estables, no se ajusta a nuevos proyectos que pueden ser más pequeños o desarrollarse en entornos más cambiantes. Para cubrir esas necesidades, surgen las metodologías ágiles.

Este movimiento surge del [manifiesto ágil](http://es.wikipedia.org/wiki/Manifiesto_%C3%A1gil).

Hay muchos de los riesgos más importantes y habituales a los que un esquema de desarrollo tradicional no se ajusta bien por ser demasiado inflexible. Se ha demostrado que los proyectos con una planificación ágil tienen más posibilidades de tener éxito.

Principios del manifiesto ágil:

- La prioridad es satisfacer al cliente a través de la entrega temprana y continua de software con valor.
- Se aceptan requisitos cambiantes como ventaja competitiva.
- Se entregan versiones de software funcional con frecuencias cortas.
- Las personas del negocio y los desarrolladores deben trabajar juntos de forma cotidiana en el proyecto.
- Los proyectos se construyen en torno a individuos motivados, dándoles la oportunidad y respaldo que necesitan y procurándoles confianza para sus tareas.
- La forma más eficiente de comunicación en el equipo es cara a cara.
- La principal medida del progreso es el software que funciona.
- Los procesos ágiles promueven el desarrollo sostenido. Todos los stakeholders deben mantener un ritmo constante.
- Hay que atender continuamente a la excelencia técnica.
- Hay que favorecer la simplicidad para minimizar el trabajo en vano.
- Las mejores arquitecturas, requisitos y diseños emergen de equipos autoorganizados.
- El equipo tiene que reflexionar con frecuencia sobre cómo mejorar su eficiencia y ajustarse en consecuencia.

### Ideas sobre XP
Con XP, los programadores buscan comunicación entre miembros del equipo (esto incluye al usuario), mantener el proceso tan simple como sea posible, buscar la realimentación del cliente en cada iteración, y coraje.

Es útil usar XP cuando los requisitos se desconocen o son inciertos, el riesgo es elevado, el equipo es pequeño, el cliente puede ser implicado en el desarrollo, y hay capacidad de hacer pruebas. El equipo de programación tiene que estar muy preparado, especialmente en diseño, y tiene que ser disciplinado, pues no es una metodología fácil de seguir.

Reglas de XP:

- Se escriben las historias de usuario.
- La planificación de releases crea la planificación temporal.
- Se hacen frecuentes releases pequeñas.
- Se mide la velocidad del proyecto.
- Se divide el proyecto en iteraciones.
- Cada iteración comienza con el plan de dicha iteración.
- Los roles se van cambiando dentro del proyecto.
- Cada día comienza con un standup meeting.
- El XP debe corregirse cuando falle.

Al codificar en XP:

- el usuario siempre está disponible,
- el código se escribe de acuerdo a estándares,
- primero se codifica la prueba unitaria,
- toda la producción de código se hace en parejas,
- solo un par de personas integra el código en cada momento,
- se integra con frecuencia,
- el código es compartido entre todos,
- se deja la optimización hasta el final,
- no se hacen horas extra.

Problemas que puede haber en XP:

- Nadie prueba realmente la calidad del diseño.
- Nunca hay realmente una arquitectura, sino que va emergiendo en el tiempo.
- No está claro cómo reutilizar un software desarrollado bajo XP, XP tiende a mitigar la reutilización.
- La programación en parejas requiere programadores muy experimentados y disciplinados.
- El hecho de que el usuario sea necesario para desarrollar el proyecto en todo momento es peligroso.

### SCRUM
Es un modelo para el desarrollo de todo tipo de productos tecnológicos. Tiene una filosofía ágil que flexibiliza el proceso, evita la secuencialización y favorece una estrecha colaboración dentro del equipo y con los clientes. La secuencialización se evita permitiendo que las iteraciones se solapen. Scrum considera solo, de los tres factores clásicos de produccion, a los procesos y las personas, dejando fuera de su consideración la tecnología.

En la actualidad los ciclos de producción se han acelerado y los productos se vuelven obsoletos y evolucionan rápidamente.

Los proyectos más adecuados para SCRUM tienen una duración media, una importancia crítica, un buen respaldo económico y un tamaño relativamente pequeño.

Los principios del scrum son:

- Colaboración con el cliente.
- Respuesta al cambio.
- Desarrollo incremental, con entregas funcionales frecuentes.
- Autogestión, autoorganización y compromiso.
- Simplicidad.
- Supresión de artefactos innecesarios en la gestión del proyecto.

El desarrollo ágil favorece equipos multidisciplinares frente a especialización, solapamiento de iteraciones frente a división en fases, seguir una visión del producto en lugar de seguir unos requisitos detallados, y la adaptación a los cambios en lugar de seguir un plan al pie de la letra.

Una empresa que desarrolla productos con modelos de gestión ágil cuenta con una incertidumbre hacia el entorno, equipos autoorganizados, un control sutil, y una difusión y transferencia de conocimiento interno. En definitiva, la gestión ágil de proyectos no se sitúa sobre el concepto de anticipación (requisitos, diseño, planificación y seguimiento), sino sobre el de adaptación (visión, exploración y adaptación).

Los roles de la gestión ágil, adaptados para SCRUM, son:

- Equipo de desarrollo: grupo de personas que trabaja en la creación de un producto, como diseñadores, programadores, probadores, etc.
- Product owner: persona implicada en establecer un puente entre el usuario final, los responsables del negocio y el equipo de desarrollo. Trabaja día a día para clarificar los requisitos. A veces se conoce como customer representative.
- Scrum master: responsable de apoyar al equipo de desarrollo, eliminar las barreras organizativas y mantener la consistencia del proyecto ágil. También se denomina project facilitator.
- Stakeholders: todo aquél con interés en el proyecto. No son product owners pero pueden proporcionar entradas y estar afectados por las salidas del proyecto.
- Agile mentor: alguien con experiencia implementando proyectos ágiles que puede compartir su experiencia con el equipo.

Los seis artefactos más habituales de la gestión ágil, adaptados para SCRUM, son:

- Establecimiento de la visión del producto: resumen rápido para comunicar cómo está enmarcado el producto en la empresa o en la organización, que articula los objetivos del producto.
- Product backlog: lista total de los requisitos que están en el alcance del proyecto ordenado por el product owner según la prioridad. En el momento que se tenga el primer requisito, se debe tener un backlog del producto. El product backlog se reprioriza al comienzo de cada sprint.
- Product roadmap: vista de alto nivel de los requisitos del producto con un marco temporal poco preciso de cuándo se desarrollarán los requisitos.
- Plan de release: un calendario de alto nivel para el lanzamiento de versiones de software funcionando.
- Sprint backlog: objetivo, historias de usuario y tareas asociadas con el sprint actual. Cada persona elige sus tareas (el trabajo no se asigna), se estima diariamente el trabajo restante. Cualquier miembro del equipo puede añadir, borrar o cambiar el sprint backlog.
- Incremento: funcionalidad del producto en funcionamiento al final de cada sprint.

Los siete eventos de la gestión ágil, adaptados para SCRUM, son:

- Planificación del proyecto: la planificación inicial, que incluye una visión del producto y un product roadmap. Se puede realizar en menos de un día.
- Planificación de release: planificación del conjunto de características que tendrá la próxima release del producto. Solo se planifica una release cada vez.
- Sprint: ciclo de desarrollo corto para crear funcionalidad de producto vendible. A veces se llaman iteraciones. Tienen una duración de entre una y cuatro semanas, con duración constante a lo largo del proyecto.
- Planificación de sprint: reunión al comienzo de cada sprint donde se fijan los objetivos del mismo. Se identifican los requisitos y las tareas a realizar para completar cada requisito. Se crea el sprint backlog a partir de tareas del product backlog que se estiman, entre todos.
- Daily scrum: reunión de unos 15 minutos a tener cada día de un sprint donde se indica lo realizado el día anterior y lo que se va a realizar en el actual. Todo el mundo está invitado pero solo los miembros del equipo, scrum master y product owner pueden hablar. No sirve para resolver problemas, pero ayuda a evitar otras reuniones innecesarias de coordinación. Todos deben responder a qué hicieron ayer, qué harán hoy y si hay obstáculos en su camino.
- Revisión de sprint: reunión al final de cada sprint iniciada por el product owner donde se analiza la funcionalidad del producto conseguida durante el sprint. Normalmente es una demo de las nuevas características o la arquitectura subyacente. Es informal, se prepara en dos horas y no hay diapositivas. Participa todo el equipo y se invita a todo el mundo.
- Sprint retrospective: reunión al final de cada sprint, donde el equipo analiza qué fue bien, qué debe cambiar y cómo realizar los cambios. Dura unos 15 o 30 minutos. Todo el equipo participa, discutiendo qué le gustaría comenzar a hacer, dejar de hacer o seguir haciendo.

### Escalabilidad
Normalmente los equipos son de unas 7 ± 2 personas. Es escalable haciendo equipos de equipos. Hay que tener en cuenta el tipo de apliación, el tamaño y la dispersión del equipo, y la duración del proyecto. Aunque se recomienda para equipos pequeños, SCRUM se ha usado en múltiples proyectos de más de 500 personas.

### Objetivos de la gestión ágil
Dar el mayor valor posible al producto cuando éste se basa en la innovación y la flexibilidad. Reducir el tiempo de salida al mercado. Ser ágiles, produciendo partes completas del producto en periodos breves de tiempo. Ser flexibles, pudiendo adaptar la forma y el desarrollo a las características del proyecto. Obtener resultados fiables.

Para lograr la autoorganización, los equipos deben reuinr tres características:

- Deben tener autonomía para elegir la estrategia de la solución. La empresa en este caso actúa como un inversor de capital riesgo.
- Deben tener capacidad de autosuperación, desarrollando soluciones que evalúan, analizan y mejoran.
- Deben tener capacidad de autoenriquecimiento, favorecida pro la multidisciplinaridad y la aportación de soluciones valiosas complementarias.

### Algunas prácticas SCRUM

- Los clientes son parte del equipo de desarrollo.
- SCRUM tiene frecuentes entregables intermedios funcionales, lo que permite al cliente trabajar con el software antes y cambiar los requisitos de acuerdo con las necesidades.
- Se desarrollan planes de riesgos y mitigación frecuentes por parte del equipo de desarrollo. La mitigación de riesgos, la monitorización y la gestión de riesgos se lleva a cabo en todas las etapas y con compromiso.
- Transparencia en la planficación y desarrollo de módulos, que permite saber a cada uno quién es responsable de qué y cuándo.
- Frecuentes reuniones de las personas involucradas en el negocio para monitorizar el progreso.
- Debe haber un mecanismo avanzado de advertencias.
- Los problemas no se han de barrer bajo la alfombra, puesto que nadie es penalizado por reconocer o describir un problema imprevisto.

### Relaciones entre métodos ágiles y proceso unificado

- Participación activa de los stakeholders.
- Aplicar estándares de modelado.
- Aplicar patrones cuidadosamente.
- Aplicar el artefacto correcto.
- Propiedad compartida.
- Considerar la realización de pruebas.
- Crear varios modelos en paralelo.
- Crear contenido sencillo.
- Dibujar modelos de forma sencilla.
- Desechar modelos temporales.
- Exponer los modelos públicamente.
- Formalizar los modelos de contrato.
- Iterar a otro artefacto.
- Modelar en pequeños incrementos.
- Modelar para comunicar.
- Modelar para comprender.
- Probarlo con código.
- Reutilizar recursos existentes.
- Actualizar solo cuando sea preciso.
- Utilizar herramientas sencillas.

### Condiciones para pasar de grupo de emprendedores a empresa establecida

- Repetitividad de resultados: al hacer que la calidad del resultado sea consecuencia del proceso, desarrollar nuevas aplicaciones aplicando el mismo proceso garantiza la homgeneidad de los resultados.
- Escalabilidad: también consecuenica de la repetitividad, independientemente del tamaño u objetivos del equipo.
- Mejora continua: al aplicar metaprocesos que miden y analizan los resultados se obtiene la información necesaria para aplicar mejoras de forma contiuna a la eficiencia y calidad de los procesos base y, por tanto, de los resultados.
- Know-how propio: el modelo de procesos termina conteniendo un activo valioso de la organización.
