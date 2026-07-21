# Estadística Inferencial para Comparar dos Poblaciones

### Conceptos Clave

- **Objetivo de la comparación:** El propósito es extraer conclusiones sobre las diferencias entre dos poblaciones distintas.

- **Parámetros y Estimadores:** Para llevar a cabo esta comparación se utilizan como parámetros poblacionales la diferencia de medias ($\Delta\mu = \mu_1 - \mu_2$) y la diferencia de proporciones ($\Delta p = p_1 - p_2$). Sus respectivos estimadores muestrales son la diferencia de medias muestrales ($\Delta\bar{x} = \bar{X}_1 - \bar{X}_2$) y la diferencia de proporciones muestrales ($\Delta\hat{p} = \hat{p}_1 - \hat{p}_2$).

- **Requisitos del Muestreo:** El muestreo en ambas poblaciones debe ser de carácter probabilístico, siendo el muestreo aleatorio simple el más utilizado, aunque también son válidos el sistemático, estratificado y por conglomerados.

- **Pasos de la Estadística Inferencial:** La aplicación se divide en tres partes obligatorias: el estudio de las distribuciones muestrales, la estimación (puntual y por intervalos) y el contraste de hipótesis.

- **Distribución de Diferencia de Medias:** Esta distribución es aproximadamente normal cuando ambas muestras son iguales o mayores a 30 ($n_1 \ge 30$ y $n_2 \ge 30$), o si las poblaciones originales son normales.

- **Muestras pequeñas ($n < 30$):** Cuando las muestras son pequeñas y las varianzas poblacionales son desconocidas, se asume que las poblaciones son normales y se recurre a la distribución T-Student. Las varianzas pueden considerarse iguales (homocedásticas) o diferentes (no homocedásticas).

- **Distribución de Diferencia de Proporciones:** Es válida y se aproxima a una normal para datos cualitativos cuando los tamaños de muestra son grandes (cumpliendo $n \cdot p \ge 5$ y $n \cdot q \ge 5$ para ambas muestras).

### Fórmulas Principales

- **Estadístico Z para la diferencia de medias (varianzas conocidas o $n \ge 30$):**

$$z = \frac{(\bar{x}_1 - \bar{x}_2) - (\mu_1 - \mu_2)}{\sqrt{\frac{\sigma_1^2}{n_1} + \frac{\sigma_2^2}{n_2}}}$$

- **Intervalo de Confianza para diferencia de medias (varianzas conocidas):**

$$IC = (\bar{x}_1 - \bar{x}_2) \pm z \sqrt{\frac{\sigma_1^2}{n_1} + \frac{\sigma_2^2}{n_2}}$$

- **Varianza conjunta ponderada (Homocedásticas, varianzas desconocidas y $n < 30$):**

$$\hat{S}^2 = \frac{(n_1 - 1)\hat{S}_1^2 + (n_2 - 1)\hat{S}_2^2}{n_1 + n_2 - 2}$$

- **Intervalo de Confianza con T-Student (Homocedásticas):**

$$IC = (\bar{x}_1 - \bar{x}_2) \pm t_{n_1+n_2-2, 1-\alpha/2} \cdot \hat{S} \sqrt{\frac{1}{n_1} + \frac{1}{n_2}}$$

- **Estadístico Z para la diferencia de proporciones:**

$$z = \frac{(\hat{p}_1 - \hat{p}_2) - (P_1 - P_2)}{\sqrt{\frac{P_1 q_1}{n_1} + \frac{P_2 q_2}{n_2}}}$$

- **Proporción conjunta para contrastes de hipótesis (cuando $H_0: p_1 - p_2 = 0$):**

$$p = \frac{x_1 + x_2}{n_1 + n_2}$$

### ¿Para qué son útiles?

- Sirven para analizar y cuantificar si la diferencia observada entre dos grupos (por ejemplo, hombres y mujeres, dos tratamientos médicos, o dos grupos socioeconómicos) es estadísticamente significativa o si simplemente se debe a fluctuaciones propias del muestreo al azar.

- Permiten tomar decisiones fundamentadas al someter a prueba afirmaciones relativas al comportamiento cruzado de dos realidades diferentes.

### Ejemplos de Aplicación

- **Diferencia de medias (muestras grandes):** Calcular la probabilidad de que el peso promedio de una muestra de 20 niños de sexto grado sea al menos 20 libras mayor que el de una muestra de 25 niñas, conociendo las medias y desvíos estándar poblacionales de ambos sexos.

- **Diferencia de medias (muestras pequeñas con varianzas iguales):** Estimar mediante un intervalo de confianza la diferencia en el peso al nacer entre hijos de madres fumadoras ($n=35$) y madres no fumadoras ($n=27$), calculando primero una varianza conjunta ponderada y luego aplicando el estadístico T de Student.

- **Diferencia de proporciones (Contraste de Hipótesis):** Evaluar si un nuevo tratamiento para la migraña (90 respuestas favorables de 100) es estadísticamente más efectivo que el tratamiento habitual (78 favorables de 100), estimando una proporción ponderada y comparando el valor Z calculado contra el valor crítico.

### Herramientas de Software

- Aunque este apunte no profundiza en paquetes informáticos específicos, hace constante referencia al uso de Tablas de Distribución Normal y Tablas de Distribución T de Student para encontrar los valores críticos de Z y T (como 1.96 para el 95% o 2.58 para el 99%) necesarios en los intervalos de confianza y en los límites de las zonas de rechazo.
