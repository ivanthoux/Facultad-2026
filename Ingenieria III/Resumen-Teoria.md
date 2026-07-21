\documentclass[11pt, a4paper]{article}

**1. Arquitectura y Diseño de Software**
*   **Evolución y Escalabilidad:** Los sistemas suelen evolucionar según su complejidad y escala, partiendo típicamente de un **Monolito** (arquitectura simple), pasando por un Monolito Modular o en capas, hasta llegar a arquitecturas más complejas y escalables como los **Microservicios** o modelos *Serverless*.
*   **ADR (Architecture Decision Records):** Son documentos que registran las decisiones arquitectónicas clave del proyecto (ej. qué base de datos usar, cómo manejar la autenticación). Detallan el contexto, la decisión tomada y sus consecuencias, garantizando la trazabilidad con los requerimientos.
*   **Bases de Datos:** Se dividen principalmente en **SQL / Relacionales** (esquema definido, transacciones ACID, escala vertical) y **NoSQL / No relacionales** (esquema flexible, alta velocidad, escala horizontal nativa). Para escalar internamente se usan *Índices* (aceleran lecturas, enlentecen escrituras), *Replicación* (nodos de lectura y escritura) o *Sharding* (partición de datos en diferentes bases).
*   **Estrategias de optimización:**
    *   **Cache (ej. Redis):** Evita consultas repetidas costosas para bajar la latencia.
    *   **Load Balancer (ej. Nginx):** Distribuye el tráfico entre múltiples instancias del servicio.
    *   **Message Queue (ej. RabbitMQ):** Desacopla procesos lentos o asíncronos.
    *   **Circuit Breaker:** Previene fallos en cascada cuando se interactúa con servicios externos poco confiables.

**2. Calidad: Observabilidad**
*   **Análisis estático de código:** Es la evaluación del código fuente **sin ejecutar el software**. Permite detectar de forma automática errores, vulnerabilidades, *code smells* y medir la deuda técnica. Herramientas utilizadas: SonarQube, GitHub CodeQL, Semgrep, entre otras.
*   **Monitoreo:** Responde a preguntas sobre el producto en uso (en producción), como la carga operativa o la cantidad de errores. Se basa en definir métricas, medirlas, reportarlas y tomar decisiones. 
*   **Herramientas de Monitoreo:** Un stack común incluye **Prometheus** (para capturar y exponer las métricas) acoplado con **Grafana** (para generar *dashboards* y visualizar gráficamente los datos).

**3. Calidad: Pruebas (Testing)**
*   **QA vs QC:** QA (*Quality Assurance*) se enfoca en asegurar la calidad del **proceso**, mientras que QC (*Quality Control*) se enfoca en el control de calidad del **producto**.
*   **Pruebas de Caja Blanca:** Se observa la estructura interna del código. Analizan el cubrimiento de instrucciones, las condiciones lógicas y los bucles.
*   **Pruebas de Caja Negra:** No se observa el código, sino los resultados a través de la interfaz. Utilizan técnicas como clases de equivalencia (rangos de valores) y análisis de valores límite.
*   **Niveles de prueba:**
    *   **Unitarias:** Prueban una función o método en particular (hechas por desarrolladores).
    *   **Integración:** Prueban las interacciones entre dos o más métodos o módulos.
    *   **Regresión:** Verifican que ante nuevos cambios, el producto siga siendo estable.
    *   **Validación:** Comprueban que se cumplan los requerimientos del usuario. Incluyen pruebas Alfa/Beta (aceptación), de Stress y Carga Máxima (rendimiento).

**4. Ingeniería Continua (CI + CD)**
*   **Integración Continua (CI):** Consiste en unir piezas funcionales al producto central diariamente. El desarrollador implementa código, ejecuta pruebas unitarias y lo sube al repositorio remoto. Allí se hace un *build* automático, se corren análisis de calidad y se aprueban los cambios para el equipo.
*   **Entrega Continua (CD - Continuous Delivery):** Complementa la integración automatizando el despliegue de esa nueva versión del producto directamente hacia los entornos de producción o integración.
*   **Pipeline de Desarrollo:** Todo el flujo debe estar lo más automatizado posible (mediante código) apoyándose en plataformas como GitHub Actions, GitLab CI/CD o Jenkins. Esto reduce errores humanos, cuida la calidad general y agiliza las entregas.

**5. Conceptos de Ingeniería de Software**
*   **Definición de Software:** No se trata únicamente de código ejecutable. Es un conjunto que abarca programas de computadora, procedimientos, datos operativos y toda la **documentación asociada**.
*   **La Crisis del Software:** Término que describe proyectos recurrentemente frágiles, fuera de plazo y que exceden presupuestos debido a la complejidad sistémica y malas prácticas de requisitos. Para combatirlo, la Ingeniería de Software aplica principios formales como la abstracción, modularidad y el encapsulamiento.

**6. Análisis y Gestión de Riesgos (AGR)**
*   **Objetivo:** Conocer los riesgos para poder afrontarlos y controlarlos. El AGR busca garantizar la certidumbre y priorizar el cuidado de los activos según el valor que aportan a la empresa.
*   **MAGERIT:** Es una metodología formal organizada en tres procesos clave: 1) **Planificación** del proyecto, 2) **Análisis de riesgos** (identificando activos, amenazas y estimando impactos), y 3) **Gestión de riesgos** (implementando salvaguardas y planes de seguridad). Evalúa elementos como activos, amenazas y salvaguardas.

**7. Calidad del Software (Norma ISO 9126)**
*   **Perspectivas de la Calidad:** Se divide en calidad del proceso, calidad interna, calidad externa y calidad en el uso (efectividad, productividad, seguridad y satisfacción del usuario final).
*   **Atributos del producto:** Se evalúa en base a 6 características principales: **Funcionalidad, Confiabilidad, Usabilidad, Eficiencia, Mantenibilidad y Portabilidad**.
*   **Verificación vs. Validación:** La Verificación responde a *¿estamos haciendo el producto correctamente?* (respecto a sus especificaciones de diseño), mientras que la Validación responde a *¿estamos haciendo el producto correcto?* (satisfaciendo las necesidades reales del usuario).

**8. Madurez y Mejora del Proceso (CMMI)**
*   **Niveles CMMI:** Es un modelo de referencia que clasifica la madurez de los procesos de desarrollo en 5 niveles:
    1.  **Inicial:** Impredecible, caótico, depende de "héroes".
    2.  **Gestionado:** Proyectos planificados, gestión más disciplinada.
    3.  **Definido:** Procesos estandarizados a nivel de toda la organización.
    4.  **Gestionado Cuantitativamente:** Se usan métricas y datos estadísticos para el control.
    5.  **Optimizado:** Mejora continua e innovación constante.
*   **Modelo IDEAL:** Metodología en 5 fases para implementar mejoras en los procesos: *Initiating* (Inicio), *Diagnosing* (Diagnóstico), *Establishing* (Establecimiento), *Acting* (Actuación) y *Learning* (Aprendizaje).

**9. Metodologías del Ciclo de Vida del Software**
*   **Duras / Pesadas (Ej. Cascada, Espiral, SSADM, Merise):** Tienen una planificación exhaustiva desde el inicio, requieren requisitos estables y alta documentación formal. Son rígidas ante los cambios, siendo ideales para proyectos grandes y predecibles.
*   **Ágiles / Blandas (Ej. Scrum, Kanban, XP):** Son iterativas e incrementales. Valoran la colaboración con el cliente, el software funcionando y la capacidad de **adaptarse al cambio** por encima de la planificación estricta.
*   **Móviles (Ej. Mobile-D, SLeSS):** Adaptadas a la alta fragmentación de dispositivos, requieren ciclos de desarrollo muy cortos y prototipado rápido.
*   **Desarrollo Lean:** Se basa en optimizar el flujo de trabajo mediante principios como **entregar lo más rápido posible** (trabajando en bloques pequeños), decidir lo más tarde posible, y "ver el conjunto" para no desoptimizar el sistema buscando mejoras únicamente locales.