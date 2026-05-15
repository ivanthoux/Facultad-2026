# 1. Objetivo del Modelo

El propósito principal es analizar las **discrepancias** (diferencias) entre las **frecuencias observadas** ($O_i$, los datos reales obtenidos) y las **frecuencias esperadas** ($e_i$, lo que la teoría o un modelo previo predice).

## 2. Aplicaciones Mencionadas

El docente destaca tres usos fundamentales de esta prueba no paramétrica:

* **Bondad de ajuste:** ¿se ajustan mis datos a una distribución específica (Normal, Binomial, Poisson)?
* **Independencia:** ¿son independientes dos variables de clasificación en un mismo grupo?
* **Homogeneidad:** ¿se comportan de igual manera dos o más poblaciones respecto a un criterio?

## 3. Propiedades y fórmulas

* **Naturaleza:** a diferencia de las pruebas $Z$ o $T$, la distribución $\chi^2$ es siempre positiva (va de $0$ a $+\infty$) y es asimétrica a la derecha.
* **Estadístico de prueba:** se calcula mediante la sumatoria de las diferencias al cuadrado, ponderadas por lo esperado:

$$\chi^2 = \sum \frac{(O_i - e_i)^2}{e_i}$$

* **Grados de libertad ($k$):** definidos generalmente por el número de categorías menos uno ($c - 1$), restando también parámetros estimados si fuera necesario.

## 4. Ejemplo práctico: el dado

Se presenta un experimento donde se lanza un dado **120 veces**:

* **Hipótesis:** se busca probar si el dado está "bien hecho" (distribución uniforme).
* **Valores:** si el dado es justo, se esperan 20 apariciones por cada cara ($120 \times 1/6$).
* **Conclusión:** al calcular un $\chi^2$ de **5** y compararlo con el valor crítico de tabla (**11.1** para $\alpha=0.05$ y $5$ gl), el resultado cae en la zona de aceptación. Por lo tanto, no hay evidencia para decir que el dado esté cargado.


