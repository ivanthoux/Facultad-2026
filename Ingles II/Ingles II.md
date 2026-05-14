# Apuntes de Inglés Técnico: Manual de MATLAB

---

## 1. Estructura de Lectura (Reading Structures)

El texto técnico de MATLAB sigue un patrón lógico diseñado para la instrucción técnica:

* **Definición Conceptual:** Comienza con una afirmación directa sobre cómo funciona una característica (ej. *"MATLAB uses column-oriented analysis..."* ).
* **Ejemplificación (Case Studies):** Utiliza frases como *"As an example, consider..."*  para aterrizar la teoría.
* **Demostración de Código:** Presenta bloques de código o funciones específicas (ej. `mean`, `std`) seguidos de sus resultados esperados.
* **Procedimientos Paso a Paso:** Especialmente en la sección de "Plotting Process", describe una secuencia de operaciones necesarias para visualizar datos.
* **Tablas de Referencia:** Utiliza tablas para comparar comandos (formatos numéricos) o atajos de teclado.

---

## 2. Vocabulario técnico clave (Keywords)

| Palabra / Frase | Rol en el Texto | Significado / Contexto |
| --- | --- | --- |
| **Multivariate** | Adjetivo Técnico | Datos que involucran múltiples variables simultáneas. |
| **Observation** | Sustantivo | En estadística/MATLAB, se refiere a cada fila de un set de datos. |
| **Scalar Expansion** | Concepto | Habilidad de combinar una matriz con un solo número (escalar). |
| **Subscripting** | Verbo/Sustantivo | El acto de acceder a elementos de un array mediante índices o lógica. |
| **Outlier** | Sustantivo | Un valor que se aleja significativamente del resto de los datos (valor atípico). |
| **Suppressing** | Verbo (Gerundio) | Evitar que algo se muestre (ej. usar `;` para no ver el resultado en consola). |
| **Ellipsis** | Sustantivo | Los tres puntos (`...`) usados para continuar una línea de código en la siguiente. |
| **Annotating** | Verbo | Agregar etiquetas, flechas o texto aclaratorio a un gráfico. |
| **Brushing** | Término Específico | Herramienta interactiva para identificar y marcar datos en un gráfico. |

---

## 3. Conectores y Estructuras de Función Específica

### A. Para dar Instrucciones o Sugerencias

* *"To obtain... use..."*: Estructura de propósito y acción (ej. para obtener la media, use la función `mean`).
* *"Suppose you have..."*: Utilizado para plantear un escenario hipotético de análisis.
* *"Note that..."*: Llama la atención sobre un detalle importante que no debe pasarse por alto (ej. la fuente tipográfica o cómo se guardan los datos).

### B. Funciones de Control (The Command Window)

El texto describe cómo interactuar con la interfaz:

* **Recall:** Recuperar líneas de código anteriores usando las flechas del teclado.
* **Zeroes out:** Una expresión común para indicar que se están transformando valores a cero.
* **Picks out:** Expresión para indicar la selección o extracción de elementos específicos.

### C. Visualización (Graphics)

Conceptos de jerarquía de objetos:

* **Handle Graphics:** El sistema de bajo nivel de MATLAB para manipular objetos gráficos.
* **Interactive tools vs. Command interface:** La distinción entre usar el mouse (GUI) o escribir código.

---

## 4. Atajos de Edición (Command Line Editing)

Esta tabla es útil para entender verbos de acción en inglés dentro de un entorno de desarrollo:

* **Move back/forward:** Mover el cursor un carácter.
* **Clear command line:** Borrar la línea actual.
* **Stop execution:** Detener un proceso en marcha (Ctrl+C).

---
