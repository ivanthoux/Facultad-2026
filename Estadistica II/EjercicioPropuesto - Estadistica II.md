# Ejercicio Propuesto en Foro Colaborativo

## Alumno: Thoux Ivan Ezequiel

### Fecha 13/04/2026

#### Consigna

Una fábrica de componentes electrónicos afirma que su nuevo proceso de producción ha reducido la tasa de productos defectuosos a menos del 5%. Para verificar esta afirmación, un equipo de control de calidad selecciona una muestra aleatoria de 400 componentes y encuentra que 14 de ellos presentan algún defecto.

Utilizando un nivel de significancia del 5% , ¿existe evidencia estadística suficiente para respaldar la afirmación de la fábrica?

##### Identificación de datos

* **Proporción poblacional (p):** $0,05$
* **Tamaño de la muestra ($n$):** $400$
* **Éxitos en la muestra ($x$):** $14$
* **Proporción muestral ($\hat{p}$):** $\frac{14}{400} = 0,035$
* **Nivel de significancia ($\alpha$):** $0,05$

##### Planteamiento de hipótesis

La fábrica afirma que la tasa es menor al 5%, lo cual define una prueba unilateral izquierda.

* **Hipótesis nula ($H_0$):** $p \geq 0,05$ (la tasa de defectuosos es igual o mayor al 5%).
* **Hipótesis alternativa ($H_1$):** $p < 0,05$ (la afirmación de la fábrica: la tasa es menor al 5%).

##### Nivel de significancia y valor crítico

Para un nivel de significancia de $\alpha = 0,05$ en una distribución normal estándar ($Z$) para una prueba unilateral izquierda lo obtenemos de la tabla:

* **$Z_{crítico}$:** $-1,645$

**Decisión:** se rechazará $H_0$ si el $Z_{calculado}$ es menor a $-1,645$.

##### Cálculo del estadístico de prueba ($Z_{calc}$)

Primero, calculamos el error estándar de la proporción bajo la hipótesis nula:

$$\sigma_{\hat{p}} = \sqrt{\frac{p \cdot (1 - p)}{n}}$$

$$\sigma_{\hat{p}} = \sqrt{\frac{0,05 \cdot 0,95}{400}} = \sqrt{\frac{0,0475}{400}} = \sqrt{0,00011875} \approx 0,0109$$

Ahora, calculamos el valor de $Z$:

$$Z_{calc} = \frac{\hat{p} - p}{\sigma_{\hat{p}}}$$

$$Z_{calc} = \frac{0,035 - 0,05}{0,0109} = \frac{-0,015}{0,0109} \approx -1,376$$

##### Decisión estadística

Comparamos el valor obtenido con el valor crítico:

* **$Z_{calc} = -1,376$**
* **$Z_{crit} = -1,645$**

Dado que $-1,376$ no es menor que $-1,645$, el valor cae fuera de la zona de rechazo, hacia el centro de la distribución,   no se rechaza la Hipótesis Nula ($H_0$)   .

##### Conclusión

A un nivel de significancia del **5%**, no existe evidencia estadística suficiente para respaldar la afirmación de la fábrica. Aunque en la muestra se observó una tasa del 3,5%, la diferencia respecto al 5% no es lo suficientemente grande como para descartar que se deba al azar del muestreo bajo las condiciones dadas.
