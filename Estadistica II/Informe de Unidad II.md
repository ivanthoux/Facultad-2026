# Apuntes de estudio

## Tema: Inferencia estadística sobre la diferencia de medias

## Fundamentos de la diferencia de medias

La diferencia de medias es un procedimiento estadístico fundamental utilizado para comparar dos poblaciones independientes. Utilizamos el **estimador puntual** $(\bar{x}_1 - \bar{x}_2)$ (obtenido de las muestras) para realizar inferencias sobre el **parámetro poblacional real** $(\mu_1 - \mu_2)$.

Para garantizar la validez de estas inferencias, debemos verificar los siguientes supuestos:

* **Independencia:** las observaciones de una muestra no deben influir en las de la otra, las poblaciones de origen son independientes entre sí.
* **Normalidad:** se asume que las poblaciones de origen siguen una distribución aproximadamente normal.
* **Aleatoriedad:** los datos deben provenir de muestras seleccionadas aleatoriamente para evitar sesgos en el estimador.

### Intervalos de confianza para la diferencia de medias

El intervalo de confianza nos permite acotar el rango de valores donde se encuentra la verdadera diferencia entre las medias poblacionales con un nivel de certeza determinado $(1 - \alpha)$.

#### Muestras grandes ($n \ge 30$)

Consideramos muestras grandes cuando se cumple que $n_1 \ge 30$ y $n_2 \ge 30$, o en su defecto, que la suma de ambas sea $n_1 + n_2 \ge 60$.

* Se utiliza la distribución Z (normal).
* Estructura de la fórmula: $estimador \pm (valor\_crítico\_Z \times error\_estándar)$.
* Si las varianzas poblacionales ($\sigma^2$) son desconocidas, la robustez de las muestras grandes nos permite sustituirlas por las varianzas muestrales ($s^2$).

#### Muestras Pequeñas ($n < 30$)

Cuando el tamaño de muestra es reducido, la incertidumbre aumenta, por lo que recurrimos a la distribución t de Student, que es más conservadora.

Para aplicar este método, debemos cumplir dos requisitos:

1. **Normalidad:** las poblaciones deben ser aproximadamente normales.
2. **Homocedasticidad:** las varianzas poblacionales, aunque desconocidas, se asumen como iguales.

En este escenario, calculamos una **varianza ponderada** ($s_p^2$ o estimador único), la cual combina la información de ambos grupos para obtener una estimación más precisa de la variabilidad común.

## Pruebas de hipótesis para diferencia de medias

Siguiendo la metodología del maestro Gustavo, aplicamos un proceso sistemático de 4 pasos:

* **Paso 1: Planteamiento de hipótesis**
  * Hipótesis Nula ($H_0$): postula la ausencia de diferencia ($H_0: \mu_1 - \mu_2 = 0$).
  * Hipótesis Alternativa ($H_1$): postula la existencia de una diferencia significativa ($H_1: \mu_1 - \mu_2 \neq 0, > 0, \text{ o } < 0$).
* **Paso 2: Nivel de significancia ($\alpha$)**
    Es la probabilidad de error tipo I. Un $\alpha = 0.05$ implica una confianza del 95% en nuestra decisión.
* **Paso 3: Estadístico de prueba y Valores críticos**
  * Para la **distribución Z**, buscamos el valor crítico en tablas según $\alpha$.
  * Para la **distribución t**, es indispensable considerar los **grados de libertad**, calculados como $gl = n_1 + n_2 - 2$.
* **Paso 4: Decisión y conclusión**
    Si el estadístico de prueba cae en la **zona de rechazo**, descartamos $H_0$. De lo contrario, se acepta la hipótesis nula, concluyendo que no hay evidencia suficiente de diferencia.

### Descripción del estadístico $t$ - Metodología Esteban Rolón

El estadístico de prueba $t$ para muestras pequeñas se define como:

1. **Numerador:** representa la distancia entre la diferencia observada y el parámetro hipotético (usualmente cero).
2. **Denominador (Error Estándar):** se calcula bajo la raíz cuadrada de la suma de las varianzas ponderadas divididas por sus respectivos tamaños de muestra.
3. **Varianza Ponderada ($s_p^2$):** es un promedio pesado de las varianzas de ambas muestras. Para buscar en tablas, recuerda siempre usar $n_1 + n_2 - 2$ grados de libertad.

## Ejemplo práctico

**Objetivo:** analizar si el Colegio B tiene un rendimiento superior al Colegio A.

**Datos de entrada:**

* **Colegio A:** $n = 50, \bar{x} = 135, s = 19$
* **Colegio B:** $n = 63, \bar{x} = 141, s = 27$
* **Nivel de significancia:** $\alpha = 0.05$

**Desarrollo:**

1. **Hipótesis:** $H_0: \mu_B - \mu_A = 0$; $H_1: \mu_B - \mu_A > 0$ (Prueba de una cola a la derecha).
2. **Nivel de Significancia:** $\alpha = 0.05$.
3. **Estadísticos:** Al ser muestras grandes, usamos **Z**. El valor crítico $Z_{0.05}$ es **1.64**. Al aplicar la fórmula, el estadístico de prueba resulta en **$Z = 1.38$**.
4. **Conclusión:** Dado que $1.38 < 1.64$, el valor cae en la **zona de no rechazo** de $H_0$. No existe evidencia estadística suficiente para afirmar que el Colegio B sea superior; los rendimientos se consideran semejantes.

## Resumen de Reglas de Decisión Gráfica

La ubicación de la zona de rechazo en la campana de Gauss depende de la hipótesis alternativa ($H_1$):

* **Cola a la derecha ($>$):** Zona de rechazo en el extremo derecho. Prueba si un grupo es "mayor que" otro.
* **Cola a la izquierda ($<$):** Zona de rechazo en el extremo izquierdo. Prueba si un grupo es "menor que" otro.
* **Dos colas ($\neq$):** La zona de rechazo se divide en ambos extremos ($\alpha/2$). Busca cualquier "diferencia", sin importar la dirección.
