# Análisis de frecuencias con Ji-Cuadrado ($\chi^{2}$)

## **1. Concepto y Propósito**

El estadístico Ji-cuadrado es una herramienta **no paramétrica** que se utiliza para medir qué tan cerca están tus datos reales (frecuencias observadas) de un modelo teórico o hipótesis previa (frecuencias esperadas).

* **Interpretación rápida:** un valor de $\chi^{2}$ pequeño indica que los datos son compatibles con el modelo; un valor grande sugiere que la hipótesis inicial podría ser incorrecta.
* **Enfoque:** se centra en analizar la discrepancia entre lo que vemos ($O_i$) y lo que esperaríamos ver según la teoría ($e_i$).

## 2. Propiedades de la distribución

* **Dominio:** siempre toma valores positivos, desde $0$ hasta $+\infty$.
* **Forma:** es asimétrica hacia la derecha. No obstante, tiende a una distribución normal si los grados de libertad ($k$) son mayores a 30.
* **Parámetros:**
  * **Media:** es igual a los grados de libertad ($k$).
  * **Varianza:** se calcula como $2 \cdot k$.

### 3. Aplicaciones principales

Existen tres tipos de contrastes fundamentales según el objetivo del estudio:

* **Bondad de ajuste:** se analiza **un grupo y una variable** para verificar si los datos recolectados encajan con un modelo específico (como una distribución Uniforme, Binomial o de Poisson).
* **Contraste de independencia:** se estudian **dos variables en un solo grupo** para determinar si existe una relación o interacción entre ellas. Se utilizan tablas de contingencia $r \times c$.
* **Contraste de homogeneidad:** se evalúa **una variable en varios grupos (poblaciones)** para confirmar si la distribución de dicha variable es igual en todos ellos.

---

### **4. Fórmulas fundamentales**

> **Estadístico de Prueba (General):**
> $$\chi^{2} = \sum_{i=1}^{k} \frac{(O_{i} - e_{i})^{2}}{e_{i}}$$
> Donde:
>
> * $O_i$: Frecuencia observada (datos de la muestra).
> * $e_i$: Frecuencia esperada o teórica.
>
>
> **Grados de Libertad ($gl$ o $v$):**
>
>* **General:** $v = c - 1 - m$  (donde $c$ son categorías y $m$ parámetros estimados).
>* **Independencia y Homogeneidad:** $v = (r - 1)(c - 1)$.
>
>

---

### 5. Requisitos de robustez (Reglas de Oro)

Para que los resultados sean fiables y la prueba sea considerada robusta, se deben cumplir dos condiciones sobre las frecuencias esperadas ($Fe$):

1. **Mínimo absoluto:** ninguna categoría debe tener una frecuencia esperada menor a 1 ($Fe < 1$).
2. **Regla del 80/20:** al menos el **80% de las categorías** deben tener una frecuencia esperada de 5 o más ($Fe \geq 5$).

* **¿Qué hacer si no se cumple?:** se recomienda combinar categorías lógicamente similares para aumentar las frecuencias o utilizar pruebas exactas (como la de Fisher).

### **6. Pasos para el contraste de hipótesis**

1. **Definir hipótesis:** $H_0$ (los datos se ajustan al modelo/son independientes) vs. $H_1$ (no se ajustan/son dependientes).
2. **Establecer nivel de significancia ($\alpha$):** Comúnmente 0.05, 0.01 o 0.10.
3. **Calcular frecuencias esperadas:** basadas en la probabilidad teórica o el producto de los totales marginales en tablas de contingencia.
4. **Calcular el Estadístico $\chi^{2}_{p}$:** compararlo con el valor crítico de la tabla según los grados de libertad.
5. **Tomar Decisión:** si $\chi^{2}_{p} > \chi^{2}_{crítico}$, se rechaza $H_0$.
