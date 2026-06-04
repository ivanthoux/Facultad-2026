# Estadistica II

## Ejercicio N° 1 de la clase 04/06/2026

---

Se realiza una encuesta a 200 estudiantes universitarios para analizar si existe relacion entre el genero y la preferencia por una modalidad de cursado.

| |Presencial |Virtual |Total |
| :--- | :---: |:---: |:---: |
|**Hombres** |50 |30 |80 |
|**Mujeres** |40 |80 |120 |
|**Total** |90 |110 |200 |

Con un nivel de significancia de $\alpha$ = 0,05, determinar si existe asociacion entre el genero y la modalidad de cursado preferida.

### Desarrollo <!-- Ejercicio 1 -->

#### Planteo de hipótesis <!-- Ejercicio 1 -->

* **$H_0$:** el género y la preferencia por la modalidad de cursado son independientes (No existe asociación).
* **$H_1$:** el género y la preferencia por la modalidad de cursado no son independientes (Existe asociación).

#### Cálculo de frecuencias esperadas <!-- Ejercicio 1 -->

**Tabla de Frecuencias Esperadas:**

| | Presencial | Virtual | Total |
|:--- |:---:|:---:|:---:|
| **Hombres** | 36 | 44 | 80 |
| **Mujeres** | 54 | 66 | 120 |
| **Total** | 90 | 110 | 200 |

#### Cálculo del estadístico de prueba <!-- Ejercicio 1 -->

La fórmula general para el estadístico chi-cuadrado es:
$$\chi^2 = \sum \frac{(O_{ij} - E_{ij})^2}{E_{ij}}$$

* **Hombres, Presencial:** $\frac{(50 - 36)^2}{36} = \frac{14^2}{36} = \frac{196}{36} \approx 5,444$
* **Hombres, Virtual:** $\frac{(30 - 44)^2}{44} = \frac{(-14)^2}{44} = \frac{196}{44} \approx 4,455$
* **Mujeres, Presencial:** $\frac{(40 - 54)^2}{54} = \frac{(-14)^2}{54} = \frac{196}{54} \approx 3,630$
* **Mujeres, Virtual:** $\frac{(80 - 66)^2}{66} = \frac{14^2}{66} = \frac{196}{66} \approx 2,970$

Sumando los términos obtenemos el estadístico calculado:
$$\chi^2_{calc} = 5,444 + 4,455 + 3,630 + 2,970 = 16,499 \approx 16,5$$

#### Grados de libertad y valor crítico <!-- Ejercicio 1 -->

* **Grados de libertad ($gl$):** $(filas - 1) \times (columnas - 1) = (2 - 1) \times (2 - 1) = 1$
* **Valor crítico de tabla:** buscamos en la tabla de distribución Chi-cuadrado con $\alpha = 0,05$ y $gl = 1$.
$$\chi^2_{crit} = 3,841$$

#### Conclusión <!-- Ejercicio 1 -->

$$\chi^2_{calc} (16,5) > \chi^2_{crit} (3,841)$$

Como el valor calculado ($16,5$) es mucho mayor que el valor crítico de la tabla y cae en la región de rechazo, se rechaza la hipótesis nula.

---

## Ejercicio N° 2 de la clase 04/06/2026

---

### Desarrollo

#### Planteo de hipótesis

* **$H_0$:** las proporciones de preferencia por el nuevo producto son iguales en las tres ciudades.
* **$H_1$:** al menos una de las proporciones de preferencia es diferente.

#### Frecuencias observadas

| | Prefiere | No prefiere | Total |
|:--- |:---:|:---:|:---:|
| **Ciudad A** | 45 | 55 | 100 |
| **Ciudad B** | 60 | 40 | 100 |
| **Ciudad C** | 75 | 25 | 100 |
| **Total** | 180 | 120 | 300 |

#### Cálculo de frecuencias esperadas

**Tabla de Frecuencias Esperadas:**

| | Prefiere | No prefiere | Total |
|:--- |:---:|:---:|:---:|
| **Ciudad A** | 60 | 40 | 100 |
| **Ciudad B** | 60 | 40 | 100 |
| **Ciudad C** | 60 | 40 | 100 |
| **Total** | 180 | 120 | 300 |

#### Cálculo del estadístico de prueba

Calculamos término por término:

* **Ciudad A - prefiere:** $\frac{(45 - 60)^2}{60} = \frac{(-15)^2}{60} = \frac{225}{60} = 3,75$
* **Ciudad A - no prefiere:** $\frac{(55 - 40)^2}{40} = \frac{15^2}{40} = \frac{225}{40} = 5,625$
* **Ciudad B - prefiere:** $\frac{(60 - 60)^2}{60} = 0$
* **Ciudad B - no prefiere:** $\frac{(40 - 40)^2}{40} = 0$
* **Ciudad C - prefiere:** $\frac{(75 - 60)^2}{60} = \frac{15^2}{60} = \frac{225}{60} = 3,75$
* **Ciudad C - no prefiere:** $\frac{(25 - 40)^2}{40} = \frac{(-15)^2}{40} = \frac{225}{40} = 5,625$

Sumando los términos obtenemos el estadístico calculado:
$$\chi^2_{calc} = 3,75 + 5,625 + 0 + 0 + 3,75 + 5,625 = 18,75$$

#### Grados de Libertad y Valor Crítico

* **Grados de libertad ($gl$):** $(filas - 1) \times (columnas - 1) = (3 - 1) \times (2 - 1) = 2 \times 1 = 2$
* **Valor crítico de tabla:** Buscamos en la tabla de distribución Chi-cuadrado con $\alpha = 0,05$ y $gl = 2$.
$$\chi^2_{crit} = 5,991$$

#### Conclusión

Comparamos el estadístico calculado con el valor crítico:
$$\chi^2_{calc} (18,75) > \chi^2_{crit} (5,991)$$

Como el valor calculado (18,75) es mayor que el valor crítico de la tabla y cae en la región de rechazo, se rechaza la hipótesis nula ($H_0$).

---

## Ejercicio N° 3 de la clase 04/06/2026

---

### Desarrollo

#### a) Estimación de parámetros

Calculamos el promedio de ventas por bloque:
Se monitorearon $N = 200$ bloques, y cada bloque representa $n = 4$ clics.

1. Total de compras efectivas:
    $$\sum (x_i \cdot O_i) = (0 \cdot 122) + (1 \cdot 60) + (2 \cdot 15) + (3 \cdot 2) + (4 \cdot 1)$$
    $$\text{Total} = 0 + 60 + 30 + 6 + 4 = 100 \text{ compras}$$

2. Promedio de ventas por bloque ($\bar{x}$):
    $$\bar{x} = \frac{\text{Total de compras}}{N} = \frac{100}{200} = 0,5$$

3. Probabilidad base de conversión ($p$):
    Para una distribución Binomial, la media teórica es $\mu = n \cdot p$, igualando la media muestral a la teórica:
    $$0,5 = 4 \cdot p$$
    $$p = \frac{0,5}{4} = 0,125$$

Por lo tanto, la probabilidad de éxito ($p$) es **0,125** y la de fracaso ($q = 1 - p$) es **0,875**.

#### b) Análisis de robustez y agrupación

Calculamos las probabilidades teóricas usando la fórmula Binomial $P(X=x) = \binom{n}{x} p^x q^{n-x}$ con:

* $n=4$
* $p=0,125$
* $q=0,875$

Y luego multiplicamos por $N=200$ para obtener las Frecuencias Esperadas ($E_i$).

* $P(X=0) = \binom{4}{0} (0,125)^0 (0,875)^4 \approx 0,5862 \Rightarrow E_0 = 200 \cdot 0,5862 = \textbf{117,24}$
* $P(X=1) = \binom{4}{1} (0,125)^1 (0,875)^3 \approx 0,3350 \Rightarrow E_1 = 200 \cdot 0,3350 = \textbf{66,99}$
* $P(X=2) = \binom{4}{2} (0,125)^2 (0,875)^2 \approx 0,0718 \Rightarrow E_2 = 200 \cdot 0,0718 = \textbf{14,36}$
* $P(X=3) = \binom{4}{3} (0,125)^3 (0,875)^1 \approx 0,0068 \Rightarrow E_3 = 200 \cdot 0,0068 = \textbf{1,37}$
* $P(X=4) = \binom{4}{4} (0,125)^4 (0,875)^0 \approx 0,0002 \Rightarrow E_4 = 200 \cdot 0,0002 = \textbf{0,05}$

**Agrupación de categorías:** como $E_3$ (1,37) y $E_4$ (0,05) son menores a 5, debemos agruparlos. Incluso sumando $E_3 + E_4 = 1,42$, sigue siendo menor a 5. Por lo tanto, debemos agrupar desde $X=2$ en adelante (es decir, $X \ge 2$).

**Nueva tabla agrupada:**

| Compras ($X$) | Frec. Observada ($O_i$) | Frec. Esperada ($E_i$) |
|---|---|---|
| **0** | 122 | 117,24 |
| **1** | 60 | 66,99 |
| **$\ge 2$** | $15 + 2 + 1 = 18$ | $14,36 + 1,37 + 0,05 = 15,78$ |
| **Total** | 200 | 200,01 |

#### c) Contraste de hipótesis

* **$H_0$:** el comportamiento de los compradores se ajusta a una distribución Binomial.
* **$H_1$:** el comportamiento de los compradores NO se ajusta a una distribución Binomial.

**1. Cálculo del Estadístico Chi-cuadrado ($\chi^2$):**
$$\chi^2 = \sum \frac{(O_i - E_i)^2}{E_i}$$

* Para $X=0$: $\frac{(122 - 117,24)^2}{117,24} = \frac{22,6576}{117,24} \approx 0,193$
* Para $X=1$: $\frac{(60 - 66,99)^2}{66,99} = \frac{(-6,99)^2}{66,99} = \frac{48,8601}{66,99} \approx 0,729$
* Para $X \ge 2$: $\frac{(18 - 15,78)^2}{15,78} = \frac{2,22^2}{15,78} = \frac{4,9284}{15,78} \approx 0,312$

$$\chi^2_{calc} = 0,193 + 0,729 + 0,312 = \textbf{1,234}$$

**2. Grados de Libertad y Valor Crítico:**

* Fórmula de grados de libertad ($gl$): $k - 1 - m$
* $k = 3$ (número de categorías finales tras agrupar)
  * $m = 1$ (se estimó 1 parámetro: $p$)
  * $gl = 3 - 1 - 1 = \textbf{1}$
* Valor crítico por tabla Chi-cuadrado ($\alpha = 0,05$, $gl = 1$): **3,841**

**3. Conclusión:**

$$\chi^2_{calc} (1,234) < \chi^2_{crit} (3,841)$$

Como el estadístico calculado es menor al valor crítico, cae en la zona de no rechazo, es decir no se rechaza la hipótesis nula ($H_0$).

---
