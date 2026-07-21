# Análisis de Frecuencias con Distribución Ji-Cuadrado

### Conceptos Clave

- **Estadístico Ji-cuadrado ($\chi^2$):** Es una herramienta no paramétrica que mide la "distancia" o "discrepancia" entre los datos reales (frecuencias observadas) y un modelo teórico o hipótesis (frecuencias esperadas). Valores grandes indican que el modelo no se ajusta a los datos, mientras que valores pequeños indican compatibilidad.

- **Propiedades de la distribución:** Es asimétrica hacia la derecha, su dominio va de 0 al infinito, y se aproxima a una distribución normal cuando los grados de libertad son mayores a 30.

- **Robustez de la prueba (Reglas de oro):** Para que la prueba sea confiable, ninguna frecuencia esperada debe ser menor a 1, y al menos el 80% de las categorías deben tener una frecuencia esperada igual o mayor a 5. Si esto no se cumple, se recomienda agrupar categorías.

- **Aplicaciones principales:**

1. **Bondad de Ajuste:** Analiza una variable en un solo grupo para responder si los datos se ajustan a un modelo o distribución teórica específica (Uniforme, Binomial, Poisson, teórica, etc.).

2. **Independencia:** Analiza dos variables en un solo grupo para determinar si están relacionadas o si el comportamiento de una es independiente de la otra.

3. **Homogeneidad:** Analiza una variable en varios grupos (poblaciones) para determinar si la distribución de esa variable es la misma (homogénea) en todos los grupos.

### Fórmulas Principales

- **Estadístico de prueba Ji-cuadrado general:**

$$\chi^2 = \sum_{i=1}^{k} \frac{(o_i - e_i)^2}{e_i}$$

Donde $o_i$ son las frecuencias observadas y $e_i$ las frecuencias esperadas.

- **Grados de libertad para Bondad de Ajuste:**

$$v = c - 1 - m$$

Donde $c$ es el número de clasificaciones/categorías y $m$ es el número de parámetros que se tuvieron que estimar a partir de la muestra.

- **Frecuencias Esperadas en Tablas de Contingencia (Independencia y Homogeneidad):**

$$E_{ij} = \frac{\sum \text{Fila} \times \sum \text{Columna}}{n}$$

- **Grados de libertad para Tablas de Contingencia:**

$$v = (r - 1)(c - 1)$$

Donde $r$ es la cantidad de filas (renglones) y $c$ la cantidad de columnas.

### ¿Para qué es útil?

- Permite validar si un proceso aleatorio cumple con las probabilidades teóricas (por ejemplo, comprobar si un dado está cargado o si la genética de unas plantas sigue la teoría de Mendel).

- Es fundamental en encuestas y estudios de mercado para saber si dos factores se influyen mutuamente (como relacionar el nivel de satisfacción de un producto con la edad del cliente).

- En control de calidad o gestión de recursos, sirve para comprobar si el rendimiento o la tasa de fallos se mantiene estable al comparar distintas poblaciones (como distintos turnos de trabajo).

### Ejemplos de Aplicación

- **Bondad de Ajuste:** Se lanzó un dado 120 veces para probar si estaba bien hecho (distribución uniforme). Se calculó una frecuencia esperada de 20 para cada cara. Al aplicar la fórmula, el $\chi^2$ fue 5, que al ser menor que el valor crítico de la tabla (11.1), demostró que no hay evidencia para decir que el dado esté cargado.

- **Independencia:** Se encuestó a 800 clientes para saber si el "Nivel de satisfacción" con una app dependía del "Grupo por edad" (adolescentes, jóvenes, adultos, adultos mayores). Tras cruzar los datos en una tabla de contingencia y calcular las frecuencias esperadas, el estadístico no superó el valor crítico, concluyendo que la satisfacción es independiente de la edad.

- **Homogeneidad:** En una fábrica, se analizó si la proporción de artículos defectuosos era igual entre tres turnos de trabajo (matutino, vespertino y nocturno) tomando muestras fijas de cada uno. La prueba de Ji-cuadrado permitió concluir que no había evidencia significativa de que un turno produjera una proporción diferente de defectos que los demás.

### Herramientas de Software

- El material menciona que cuando la prueba de Ji-cuadrado no cumple con los criterios de robustez (muchas celdas con frecuencias esperadas muy bajas), se debe recurrir a software estadístico para realizar **Pruebas exactas** (como la prueba exacta de Fisher), las cuales no dependen de estos supuestos. Además, la bibliografía del apunte recomienda explícitamente el uso del manual de software **InfoStat** para este tipo de análisis de salud y biológicos.
