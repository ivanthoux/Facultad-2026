# Estadistica II

## Guia de trabajo practico n° 1

### Fecha: Jueves 09/04

---

#### Ejercicio #1

##### Formulas necesarias

1) Primero analizamos el tamaño de la poblacion:

    * Poblacion infinita (o muy grande): cuando el tamaño de n es muy chico respecto a N ($\ n/N \leq 0,05$)
    * Poblacion finita: cuando n representa una parte importante de N ($\ n/N > 0,05 $)

2) Factor de correccion:

$$ \sqrt{\frac{N-n}{N-1}} $$

3) Error estandar:

$$ \sigma_{p} = \sqrt{\frac{p\cdot (p-1)}{n}} $$

||N|n|$\rho$|$\sigma$ (error estandar)|
|:--:|:--:|:--:|:--:|:--:|
|1|infinito|36|0,50|0,0833|
|2|infinito|49|0,50|0,0714|
|3|200|36|0,50|0,0757|
|4|200|49|0,50|0,0622|
|5|1500|49|0,70|0,0755|
|6|1500|49|0,50|0,0823|
|7|200|49|0,40|0,0807|
|8|200|49|0,20|0,0659|
|9|200|49|0,05|0,0359|

a) A medida que el tamaño de la muestra aumenta, el error estándar disminuye. Esto se debe a que $n$ se encuentra en el denominador de la fórmula. Matemáticamente, una muestra más grande reduce la incertidumbre, permitiendo que la estimación sea más precisa y cercana al parámetro poblacional real.

b) El mayor error estándar se obtiene cuando la proporción de éxito es $p = 0,50$ (50%). Esto sucede porque el producto $p \cdot (1-p)$ alcanza su valor máximo en ese punto ($0,5 \times 0,5 = 0,25$). A medida que $p$ se aleja de 0,5 (ya sea acercándose a 0 o a 1), el producto disminuye, y por lo tanto, el error estándar también se reduce.

---

---

#### Ejercicio #2

---
