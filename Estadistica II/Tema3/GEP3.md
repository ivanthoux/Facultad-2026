# Guía de Preparación: GEP N°3 - Estadística II

## Temas Principales a Tratar

Al observar la estructura de los ejercicios, la guía se divide en tres grandes tipos de pruebas no paramétricas basadas en la distribución Chi-Cuadrado ($\chi^2$):

1. **Pruebas de Bondad de Ajuste (Goodness of Fit):** evalúan si un conjunto de datos observados se ajusta a una distribución teórica específica. En esta guía te encontrarás con ajustes a distribuciones:

* **Uniforme:** ejercicios de dados donde se asume que todas las caras tienen la misma probabilidad.

* **Proporciones dadas:** ejercicio de la mezcla de frutos secos con una razón específica (5:2:2:1).

* **Binomial:** ejercicios que modelan la cantidad de "éxitos" en $n$ ensayos, como series de penales o fallas de software.

* **Poisson:** ejercicios centrados en tasas de ocurrencia o defectos, como los televisores o accidentes de tránsito.

2. **Pruebas de Independencia:** buscan determinar si existe una relación de dependencia entre dos variables categóricas de una misma población. Ejemplos de la guía: hipertensión y hábitos de fumar , o ausentismo y edad.

3. **Pruebas de Homogeneidad:** determinan si la distribución de una variable es la misma en varias poblaciones diferentes. Se diferencia de la independencia porque las muestras se toman por separado (o por cuotas) para cada grupo, como el ejercicio que indaga el rendimiento laboral por nivel académico o la preferencia de envases entre varones y mujeres.

---

## Fórmulas Necesarias

Para resolver todos estos ejercicios, necesitarás el siguiente conjunto de fórmulas base:

### 1. Estadístico de Prueba Chi-Cuadrado

Independientemente del tipo de prueba (ajuste, independencia u homogeneidad), el estadístico de prueba calculado se basa en comparar las frecuencias Observadas ($O_i$) con las Esperadas ($E_i$):

$$\chi^2 = \sum \frac{(O_i - E_i)^2}{E_i}$$

### 2. Cálculo de Frecuencias Esperadas ($E_i$)

* **Para Bondad de Ajuste:**

$$E_i = n \cdot p_i$$

*(Donde $n$ es el tamaño total de la muestra y $p_i$ es la probabilidad teórica de la categoría $i$ según la distribución propuesta).*

* **Para Independencia y Homogeneidad (Tablas de Contingencia):**

$$E_{ij} = \frac{(\text{Total Fila}_i) \cdot (\text{Total Columna}_j)}{\text{Total General}}$$

### 3. Grados de Libertad ($gl$)

Los grados de libertad determinan qué tabla de la distribución Chi-Cuadrado debes consultar para encontrar el valor crítico.

* **Para Bondad de Ajuste:**

$$gl = k - 1 - m$$

*(Donde $k$ es el número de categorías/clases y $m$ es el número de parámetros de la población estimados a partir de la muestra).*
*Nota: Si la distribución es completamente especificada por la hipótesis nula, $m = 0$.*

* **Para Independencia y Homogeneidad:**

$$gl = (f - 1)(c - 1)$$

*(Donde $f$ es el número de filas y $c$ es el número de columnas de la tabla de contingencia).*

---

## Análisis de Robustez

Casi todos los ejercicios te piden "evaluar la robustez de la prueba y en caso necesario realizar los ajustes necesarios". En el contexto de Chi-Cuadrado, esto se refiere estrictamente a la **restricción sobre las frecuencias esperadas**.

Para que la aproximación a la distribución $\chi^2$ sea válida (robusta), debes verificar que:

* **Ninguna frecuencia esperada ($E_i$) sea menor que 1.**
* **No más del 20% de las frecuencias esperadas sean menores que 5.**

---

## DESARROLLO DE LA GEP 3

---

¡Perfecto! Vamos a resolver el primer ejercicio paso a paso para que te quede el modelo de resolución claro en tus apuntes.

---

# Resolución: Ejercicio 1

**Enunciado:** Un Equipo de supervisión de Casinos deben analizar que se cumplan con las normas legales y de calidad de los juegos. Para ello toman uno de los dados usados lo lanzan 180 veces con los siguientes resultados:

| $X$ (Cara) | 1 | 2 | 3 | 4 | 5 | 6 |
| --- | --- | --- | --- | --- | --- | --- |
| $f$ (Frecuencia Observada) | 24 | 40 | 36 | 30 | 27 | 23 |
| <br>*Tabla de datos observados*

 |  |  |  |  |  |  |

## a) ¿En base a los datos el dado se asume que está balanceado?

Se nos pide utilizar un nivel de significancia $\alpha=0,05$ para realizar una prueba de bondad de ajuste a una distribución uniforme.

### 1. Planteo de Hipótesis

* **$H_0$ (Hipótesis Nula):** El dado está balanceado (la variable se ajusta a una distribución uniforme discreta, donde la probabilidad de cada cara es $p_i = 1/6$).
* **$H_1$ (Hipótesis Alternativa):** El dado NO está balanceado (la variable no se ajusta a una distribución uniforme).

### 2. Cálculo de Frecuencias Esperadas ($E_i$)

Como la hipótesis nula asume una distribución uniforme, la probabilidad teórica para cada una de las $k=6$ caras es $p_i = 1/6$.
El tamaño total de la muestra es $n = 180$ lanzamientos.

$$E_i = n \cdot p_i = 180 \cdot \left(\frac{1}{6}\right) = 30$$

Todas las frecuencias esperadas serán iguales a 30.

### 3. Cálculo del Estadístico de Prueba ($\chi^2$)

Aplicamos la fórmula sumando los cálculos para cada una de las 6 caras:

$$\chi^2 = \sum_{i=1}^{k} \frac{(O_i - E_i)^2}{E_i}$$

| Cara ($i$) | $O_i$ | $E_i$ | $O_i - E_i$ | $(O_i - E_i)^2$ | $\frac{(O_i - E_i)^2}{E_i}$ |
| --- | --- | --- | --- | --- | --- |
| **1** | 24 | 30 | -6 | 36 | $36 / 30 = 1,20$ |
| **2** | 40 | 30 | 10 | 100 | $100 / 30 \approx 3,33$ |
| **3** | 36 | 30 | 6 | 36 | $36 / 30 = 1,20$ |
| **4** | 30 | 30 | 0 | 0 | $0 / 30 = 0,00$ |
| **5** | 27 | 30 | -3 | 9 | $9 / 30 = 0,30$ |
| **6** | 23 | 30 | -7 | 49 | $49 / 30 \approx 1,63$ |
| **Total** | **180** | **180** | **0** |  | **$\chi^2_{calc} = 7,66$** |

El valor de nuestro estadístico de prueba calculado es **$\chi^2_{calc} = 7,66$**.

### 4. Región Crítica y Regla de Decisión

Necesitamos los grados de libertad ($gl$) para buscar el valor crítico en la tabla Chi-Cuadrado:

* $k = 6$ (número de categorías).
* $m = 0$ (no estimamos ningún parámetro poblacional a partir de la muestra, la probabilidad teórica ya estaba dada por la distribución uniforme del dado).

$$gl = k - 1 - m = 6 - 1 - 0 = 5$$

Buscamos en la tabla de distribución $\chi^2$ con $\alpha = 0,05$ y $gl = 5$:
**$\chi^2_{critico} = 11,07$**

**Regla de decisión:**

* Si $\chi^2_{calc} > \chi^2_{critico}$, rechazamos $H_0$.
* Como $7,66 < 11,07$, el estadístico cae en la zona de no rechazo.

**Conclusión a):**
A un nivel de significancia del 5%, **no hay evidencia estadística suficiente para rechazar $H_0$**. Por lo tanto, se asume que el dado está balanceado.

---

b) ¿Qué podés decir respecto a la robustez de la prueba?

Para evaluar la robustez de una prueba Chi-Cuadrado, debemos verificar las restricciones sobre las frecuencias esperadas ($E_i$):

1. Ninguna frecuencia esperada debe ser menor a 1 ($E_i \ge 1$ para todo $i$).
2. No más del 20% de las frecuencias esperadas deben ser menores a 5.

**Conclusión b):**
Al observar nuestra tabla, **todas las frecuencias esperadas son exactamente 30**. Como el 100% de los $E_i$ son mayores a 5, se cumplen holgadamente los supuestos necesarios.
La prueba es totalmente **robusta** y no es necesario realizar ningún tipo de ajuste (como agrupar categorías adyacentes).

---

---

## Resolución: Ejercicio 6

**Enunciado (Interpretado):** Un equipo de fútbol se entrena tirando series de 5 penales. Se lleva un registro de los penales errados en estas series a lo largo del año. El registro detalla la cantidad de series según los penales errados:

* 0 penales errados (metió todos): 25 series
* 1 penal errado: 75 series
* 2 penales errados: 125 series
* 3 penales errados: 25 series
* 4 penales errados: 10 series
* 5 penales errados (ningún gol): 1 serie

**Nota sobre los datos:** El enunciado menciona "de 250 series", pero al sumar las frecuencias observadas reales dadas ($25 + 75 + 125 + 25 + 10 + 1$) el total es **261**. En estos casos, lo metodológicamente correcto es trabajar con la suma real de las observaciones ($n = 261$), asumiendo un error de tipeo en el número introductorio.

**Objetivo:** Con $\alpha = 0,05$, probar si $X$ (cantidad de penales errados por partido en la serie de 5) se ajusta a una distribución Binomial.

## 1. Planteo de Hipótesis

* **$H_0$:** La variable $X$ se ajusta a una distribución Binomial con $n_{ensayos} = 5$.
* **$H_1$:** La variable $X$ NO se ajusta a una distribución Binomial.

## 2. Estimación del Parámetro ($p$)

Para calcular las frecuencias esperadas, necesitamos la probabilidad de éxito de la binomial (en este caso, el "éxito" es errar un penal). Como no nos dan la probabilidad teórica, debemos estimarla a partir de la muestra ($m = 1$ parámetro estimado).

Primero calculamos el promedio de penales errados por serie ($\bar{x}$):

$$\bar{x} = \frac{\sum (X_i \cdot f_i)}{n}$$

$$\bar{x} = \frac{(0 \cdot 25) + (1 \cdot 75) + (2 \cdot 125) + (3 \cdot 25) + (4 \cdot 10) + (5 \cdot 1)}{261}$$

$$\bar{x} = \frac{445}{261} \approx 1,705$$

Sabiendo que el valor esperado (media) de una Binomial es $E(X) = n_{ensayos} \cdot p$, despejamos $p$:

$$1,705 = 5 \cdot p \Rightarrow p = 0,341$$

## 3. Cálculo de Frecuencias Esperadas ($E_i$)

Utilizamos la fórmula de probabilidad Binomial para calcular $P(X=x)$ con $p = 0,341$ y $1-p = 0,659$:

$$P(X=x) = \binom{5}{x} (0,341)^x (0,659)^{5-x}$$

Luego, multiplicamos por $n = 261$ para obtener $E_i = 261 \cdot P(X=x)$:

| $X$ (Errados) | Probabilidad $P(x)$ | $E_i = 261 \cdot P(x)$ | $O_i$ (Observadas) |
| --- | --- | --- | --- |
| **0** | $0,1245$ | **32,50** | 25 |
| **1** | $0,3221$ | **84,07** | 75 |
| **2** | $0,3328$ | **86,86** | 125 |
| **3** | $0,1722$ | **44,94** | 25 |
| **4** | $0,0445$ | **11,61** | 10 |
| **5** | $0,0046$ | **1,20** | 1 |

## 4. Análisis de Robustez y Ajuste

Para que la prueba sea robusta, ninguna frecuencia esperada debe ser menor a 1, y no más del 20% deben ser menores a 5.
Observamos que para $X=5$, $E_i = 1,20$ (menor a 5). Aunque es solo 1 categoría de 6 (16,6%), **lo ideal para garantizar la máxima robustez es agrupar las últimas categorías**.

Agrupamos $X=4$ y $X=5$ en una nueva categoría "$X \ge 4$":

* **$O_{4+}$** $= 10 + 1 =$ **11**
* **$E_{4+}$** $= 11,61 + 1,20 =$ **12,81**

Ahora pasamos a tener $k = 5$ categorías en total.

## 5. Cálculo del Estadístico de Prueba ($\chi^2$)

$$\chi^2 = \sum \frac{(O_i - E_i)^2}{E_i}$$

| Categoría | $O_i$ | $E_i$ | $(O_i - E_i)^2 / E_i$ |
| --- | --- | --- | --- |
| **0** | 25 | 32,50 | $(-7,50)^2 / 32,50 = 1,73$ |
| **1** | 75 | 84,07 | $(-9,07)^2 / 84,07 = 0,98$ |
| **2** | 125 | 86,86 | $(38,14)^2 / 86,86 = 16,74$ |
| **3** | 25 | 44,94 | $(-19,94)^2 / 44,94 = 8,85$ |
| **$\ge 4$** | 11 | 12,81 | $(-1,81)^2 / 12,81 = 0,26$ |
| **Total** | **261** | **261** | **$\chi^2_{calc} = 28,56$** |

## 6. Región Crítica y Conclusión

Calculamos los grados de libertad ($gl$) tomando en cuenta la agrupación ($k=5$) y la estimación del parámetro $p$ ($m=1$):

$$gl = k - 1 - m = 5 - 1 - 1 = 3$$

Buscamos en la tabla $\chi^2$ con $\alpha = 0,05$ y $gl = 3$:
**$\chi^2_{critico} = 7,815$**

**Regla de decisión:**
Como $\chi^2_{calc} (28,56) > \chi^2_{critico} (7,815)$, el valor cae en la zona de rechazo.

**Conclusión:**
A un nivel de significancia del 5%, **se rechaza la hipótesis nula ($H_0$)**. Hay evidencia estadística suficiente para afirmar que la cantidad de penales errados por serie **no se ajusta** a una distribución Binomial.

---
