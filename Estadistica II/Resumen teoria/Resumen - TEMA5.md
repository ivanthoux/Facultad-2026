# Series Temporales

### Conceptos Clave

- **Serie Temporal (o cronológica):** Es un conjunto de observaciones de una variable registradas en periodos regulares de tiempo, como pueden ser años, trimestres, meses o semanas.

- **Componentes de una Serie Temporal:**
- **Tendencia ($T_t$):** Representa el movimiento o trayectoria de la serie a largo plazo, excluyendo oscilaciones.

- **Variaciones cíclicas ($C_t$):** Fluctuaciones superiores a un año causadas por ciclos o cambios en la actividad económica. Suele tratarse en conjunto con la tendencia.

- **Variaciones estacionales ($E_t$):** Fluctuaciones a corto plazo (menos de un año) que ocurren de forma regular, como las subidas y bajadas propias de ciertos meses. Se miden con los Índices de Variación Estacional (IVE).

- **Variaciones irregulares ($I_t$):** Oscilaciones no periódicas e imprevisibles causadas por eventos puntuales (huelgas, catástrofes, guerras) que no son explicadas por el resto de componentes.

- **Determinación de la Tendencia:** Para encontrarla se utilizan el Método de las Medias Móviles y el Método analítico (ajuste de funciones matemáticas).

- **Esquemas de combinación:** Para el cálculo predictivo, se asume que las variables interactúan siguiendo un modelo. El apunte destaca el uso del Esquema Multiplicativo.

### Fórmulas Principales

- **Esquema Aditivo:**

$$Y_t = T_t + E_t + I_t$$

- **Esquema Multiplicativo (el utilizado en la práctica):**

$$Y_t = T_t \times E_t \times I_t$$

- **Modelos matemáticos de tendencia (Método Analítico):**
- Lineal:
  $$Y_t^* = a + b t$$

- Parabólica:
  $$Y_t^* = a + b t + c t^2$$

- Exponencial:
  $$Y_t^* = a b^t$$

- **Razón a la media móvil (Paso intermedio para hallar el IVE):**

$$\text{Valor} = \frac{Y_t}{Y_t^{**}} \times 100$$

_(Donde $Y_t$ es el valor original y $Y_t^{}$ es la media móvil centrada)_

### ¿Para qué son útiles?

- Permiten aislar y comprender el comportamiento de un fenómeno a través del tiempo, determinando si una variación se debe a una simple época del año, a un crecimiento genuino o a un evento extraordinario.

- Son la herramienta fundamental para realizar predicciones o proyecciones a futuro utilizando el comportamiento estadístico pasado; para lograr esto, las componentes más importantes son la Tendencia y las Variaciones Estacionales.

### Ejemplos de Aplicación

- **Identificación de componentes:** El texto plantea asociar eventos con su componente. Por ejemplo, una caída de vuelos por el 11-S es un evento Irregular, el aumento de venta de juguetes en diciembre es Estacional, y el incremento de producción de trigo por mejoras tecnológicas es una Tendencia a largo plazo.

- **Cálculo de IVE en desempleo:** Se expone la evolución del paro registrado en España desde 1997. Se elabora paso a paso el cálculo mediante medias móviles de 12 meses (luego centradas a 2 meses) para eliminar la tendencia, obteniendo finalmente los índices estacionales mensuales promedio y ajustándolos para que sumen exactamente 1200.

### Herramientas de Software

- El material hace varias menciones y aclaraciones sobre el uso del programa informático **Caest**. Indica cómo este software arroja los resultados bajo etiquetas específicas (por ejemplo, llama "Serie Predesestacionalizada" a las medias móviles de orden 12, "Serie Desestacionalizada" a las centradas de orden 2, y devuelve los IVE en tantos por uno en lugar de porcentajes).
