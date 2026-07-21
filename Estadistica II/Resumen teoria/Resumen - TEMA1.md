# Estadística Inferencial Paramétrica de una Población

### Conceptos Clave

- **Estadística Inferencial:** Tiene como objetivo obtener conclusiones acerca de parámetros de una población utilizando estimadores (estadísticos) obtenidos a partir de una muestra.

- **Población y Muestra:** La población es el conjunto total de elementos sobre los que se observa una característica, mientras que la muestra es un subconjunto aleatorio seleccionado para el estudio.

- **Hipótesis Estadísticas:** Son afirmaciones sobre características de la población que se ponen a prueba. Se dividen en Hipótesis Nula (considerada verdadera inicialmente) y Alternativa (lo que el investigador suele querer demostrar).

- **Nivel de Significancia ($\alpha$):** Es el umbral de riesgo de rechazar la hipótesis nula cuando en realidad es verdadera, fijado comúnmente en 0.05 (5%) o 0.01 (1%).

- **P-valor:** Es una métrica crucial que cuantifica el riesgo de rechazar una hipótesis verdadera; si es menor a 0.05, se considera un umbral significativo para rechazar la hipótesis nula.

- **Teorema del Límite Central (TLC):** Establece que si el tamaño de la muestra es lo suficientemente grande ($n \ge 30$), la distribución de las medias muestrales tendrá una distribución aproximadamente normal.

- **Estimaciones:** Pueden ser puntuales (un valor único como la media muestral) o por intervalo (un rango de valores donde se espera que caiga el parámetro con cierto nivel de confianza, como 95% o 99%).

### Fórmulas Principales

- **Variable tipificada (z):** Utilizada para estandarizar valores y medir a cuántos desvíos estándar se encuentra un dato de la media.

$$z = \frac{x - \mu}{\sigma}$$

- **Intervalo de Confianza (IC) para la Media (Muestras grandes, $n \ge 30$):**

$$IC(1-\alpha) = \bar{x} \pm z \cdot \frac{\sigma}{\sqrt{n}}$$

- **Intervalo de Confianza (IC) para la Media (Muestras pequeñas, $n < 30$):** Utiliza la distribución T-Student con $n-1$ grados de libertad.

$$IC(1-\alpha) = \bar{x} \pm t_{(n-1, 1-\frac{\alpha}{2})} \cdot \frac{s}{\sqrt{n}}$$

- **Intervalo de Confianza para una Proporción:**

$$IC(95\%) = \hat{p} \pm z \sqrt{\frac{p \cdot q}{n}}$$

- **Cálculo del Tamaño de Muestra para Proporciones:**

$$n = p(1-p)\left(\frac{z}{E}\right)^2$$

### ¿Para qué son útiles?

- Permiten hacer generalizaciones válidas sobre toda una población a partir de una muestra más pequeña, resolviendo la imposibilidad física o el alto costo económico que supondría medir a cada individuo (como en un Censo Nacional).

- Brindan herramientas matemáticas para cuantificar el grado de probabilidad de haber tomado un resultado o una decisión incorrecta en investigaciones.

### Ejemplos de Aplicación

- **Cálculo de tamaño de muestra:** Si se quiere estimar la proporción de niños con bajo peso al nacer tolerando un error máximo del 3% ($E=0.03$), con un 95% de confianza ($z=1.96$) y sabiendo por un pre-muestreo que la proporción es del 0.30 ($p=0.30$), se aplica la fórmula de tamaño de muestra obteniendo que se deben evaluar aproximadamente 897 niños.

- **Intervalo de confianza con muestra pequeña:** Se midió el tiempo de reacción de un fármaco en 16 pacientes ($n < 30$), obteniendo una media de 15.4 horas y un desvío de 1.5. Aplicando la fórmula con T-Student para un 95% de confianza, se puede afirmar que la media real del tiempo de reacción está entre 14.60 y 16.20 horas.

### Herramientas de Software

- Para encontrar los límites tipificados, como los valores de la distribución normal estándar ($z$) o de la distribución T-Student requeridos en las fórmulas de intervalos, se menciona el uso directo de software estadístico, aplicaciones o tablas de distribución.
