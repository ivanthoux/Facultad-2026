# Estadística Descriptiva Bivariante y Regresión Lineal

### Conceptos Clave

- **Estudio conjunto de variables:** El objetivo es observar dos variables numéricas en individuos de una muestra para reconocer si hay relación entre ellas, de qué tipo es y si es posible predecir el valor de una en función de la otra.
- **Diagramas de dispersión (nube de puntos):** Es la representación gráfica donde cada individuo es un punto cuyas coordenadas corresponden a los valores de las dos variables.
- **Tipos de relación:**
- **Relación directa:** A valores mayores de X le corresponden valores mayores de Y.
- **Relación inversa:** A valores mayores de X le corresponden valores menores de Y.
- **Incorrelación:** No hay un patrón claro; para valores altos de X hay valores tanto altos como bajos de Y en proporciones similares. (Nota: La independencia implica incorrelación, pero la incorrelación no siempre implica independencia absoluta).

- **Covarianza ($S_{xy}$):** Su signo indica si la relación es directa (positiva), inversa (negativa) o si están incorreladas (cero). Sin embargo, no mide el grado de fuerza de la relación.
- **Coeficiente de correlación lineal de Pearson ($r$):** Mide el grado en que los puntos tienden a disponerse en una línea recta. Es adimensional, toma valores entre -1 y +1, y excluye relaciones no lineales (como cuadráticas). Valores cercanvos a -1 o +1 indican una excelente relación lineal; como regla general en este curso, $\vert{}r\vert{} > 0.7$ indica buena relación y $\vert{}r\vert{} > 0.4$ indica cierta relación.
- **Regresión Lineal Simple:** Busca encontrar una función lineal para predecir una variable dependiente (o explicada), $Y$, en función de una variable independiente (o predictora), $X$.
- **Residuo o error residual ($e$):** Es la diferencia entre el valor real observado y el valor predicho por el modelo ($e = Y - \hat{Y}$). El método de "mínimos cuadrados" busca minimizar la suma de estos errores al cuadrado, logrando que el error medio sea nulo.
- **Coeficiente de Determinación ($R^2$):** Mide la bondad del ajuste, es decir, qué tan bien predice el modelo. Representa el porcentaje de variabilidad de $Y$ que es explicado por el modelo de regresión y toma valores entre 0 y 1.

### Fórmulas Principales

- **Covarianza:**

$$S_{xy} = \frac{1}{n} \sum (x_i - \bar{x})(y_i - \bar{y})$$

- **Coeficiente de Correlación de Pearson:**

$$r = \frac{S_{xy}}{S_x S_y}$$

- **Modelo de Regresión Lineal Simple:**

$$\hat{Y} = b_0 + b_1 X$$

_(Donde $b_0$ es la constante u ordenada en el origen, y $b_1$ es la pendiente)_

- **Cálculo de la pendiente ($b_1$) y ordenada ($b_0$) por mínimos cuadrados:**

$$b_1 = \frac{S_{xy}}{S_x^2} = r \frac{S_y}{S_x}$$

$$b_0 = \bar{y} - b_1 \bar{x}$$

- **Bondad del ajuste (Coeficiente de Determinación general):**

$$R^2 = 1 - \frac{S_e^2}{S_Y^2}$$

- **Bondad del ajuste (Específico para regresión lineal simple):**

$$R^2 = r^2$$

### ¿Para qué es útil?

- Sirve para predecir o estimar una medida basándose en el conocimiento de otra medida relacionada.
- El análisis de correlación permite establecer de forma numérica si existe una asociación directa o inversa entre dos fenómenos numéricos observados (y qué tan fuerte es esa alineación).

### Ejemplos de Aplicación

- **Regresión a la media de Galton:** En 1889, Galton (y posteriormente Pearson) estudiaron cómo la altura de los hijos se relaciona con la de sus padres. Observaron que padres muy altos tendían a tener hijos altos, pero ligeramente más bajos (regresando hacia la media general), desarrollando un modelo predictivo como: Altura del hijo = 85 cm + 0.5 $\times$ altura del padre.
- **Relación Peso-Altura:** Se presenta el ejemplo de analizar en un diagrama de dispersión si el peso aumenta conforme aumenta la altura de los individuos, observando (a modo de ejemplo) un incremento de 10 kg por cada 10 cm de altura.

### Herramientas de Software

- El apunte señala que, aunque se enseñan las fórmulas, los modelos de regresión no se ajustarán a mano. Se utiliza explícitamente **SPSS** para calcular los coeficientes de regresión ($b_0$ y $b_1$), el coeficiente de Pearson, el coeficiente de determinación ($R^2$) y generar los diagramas de dispersión necesarios para analizar la bondad del ajuste y los residuos. También menciona brevemente el uso de los estadísticos _Rho de Spearman_ y _Tau de Kendall_ para variables ordinales, que se procesan habitualmente en este tipo de software.
