##### Fecha: Miercoles 01/04

---

### *Ingeniería de Software III - Actualidad Informática*

# *Gestión de configuración: Versionado \[Laboratorio #1]*

###### ¿Tiene sentido seguir estudiando Ingeniería de Software?

#### Introducción

Un sistema se puede definir como la combinación de una serie de elementos organizados para cumplir uno o mas objetivos.

Entre estos elementos se incluyen: configuración de hardware, documentación, especificaciones de requerimientos, solicitudes de cambios, pruebas, código fuente, librerías, releases, modelos de datos, diccionarios de datos, entre otros.

#### Gestión de configuración

Es la aplicación de practicas para identificar y documentar los ítems configurables de un producto y controlar los cambios que se producen sobre el mismo. Incluye el registro del ciclo de vida completo de tales cambios (registro, aprobación, implementación, verificación, entre otros).

##### Versionado

Dentro de la gestión de configuración se pueden encontrar diversos elementos, entre ellos:

* Sistemas de control de versiones (no solo de código)
* Herramientas de integración

#### Escenarios

¿Por que versionar?

* Todo el equipo puede acceder a las diferentes versiones del código
* Colaboración entre pares + auditoria
* Poder revertir cambios (aislando el que rompió todo)
* Backup
* Especificación de un flujo de trabajo
* Auditar / revisar el código
* Identificar versiones en producción / desarrollo / mantenimiento (ramas)
* Base para automatización de otras acciones (CI-CD)

---

##### Fecha: Lunes 06/04

---

# Software y Produccion de Software

##### Clase de teoria: Mgter. Sergio Daniel Caballero

**¿Que es el software?:** antes de mirar mas produndamente el proceso de creacion del software, sera util explorar algunos aspectos del software mismo. Como dice el viejo adagio: 'Para derrotar a tu enemigo debes conocerlo. (Freeman)'

* El software es mas que programas, es mas, mucho mas que eso.
* Es un sistema.
* El software es un conjunto de partes interrelacionadas que alcanzan algun objetivo.

**¿Que se piensa del Software?**: lo importante no es que es el software, sino:

* ¿Como se piensa sobre el?
* ¿Que imagen se tiene?
* ¿El software es solo programas?

---

##### Fecha: Lunes 13/04

---

### Producto de software

Es la suma de: programas de computadora + procedimientos + documentacion asociada

#### Informacion en el ambiente de desarrollo

Representaciones de software + Conocimiento de Ingenieria Software + Conocimiento Especifico del dominio

La triada de un triangulo equilatero se debe mantener siempre **(Alcance + Costo + Tiempo)**, si alguno de estos aumenta, los otros lados deben moverse por igual. Si aumenta el alcance por ejemplo, aumenta el tiempo que se tarda en desarrollar y por ende el costo debe aumentar en la misma medida.

#### Habilidades de un buen lider de proyecto

* Habilidad para delegar
* Habilidad de negociación
* Habilidad de coordinación
* Percepcion de su rol y responsabilidades
* Competencia
* Compromiso

#### Habilidades de un miembro del equipo

* Conocimientos tecnicos
* Habilidades de comunicacion
* Resolucion de problemas
* Compromiso

#### Factores relacionados al Proyecto

* Tamaño y valor
* Unicidad de actividades del proyecto
* Densidad de un proyecto
* Ciclo de vida
* Urgencia

#### Factores relacionados a la organizacion

* Apoyo de alta gerencia
* Estructura organizacional del proyecto
* Apoyo de las gerencias funcionales
* Defensa y promocion del proyecto

---

##### Fecha: Miercoles 15/04

---

## Requerimientos y SDD

* Requerimientos: es una propiedad o funcionalidad que debe tener el producto a fin de resolver un problema del mundo real. Generalmente, se pueden clasificar en:
  * Funcionales y no funcionales ("atributos de calidad").
  * Del producto y del proyecto.

### Discovery

Se realiza al inicio de un desarrollo, para lograr la comprension del problema que el software debe resolver. Y continuamente para afinar esta idea inicial.

#### Tecnicas de elicitacion

* Entrevistas
* Escenarios: planteo de cuestiones con el usuario que puedan definir el comportamiento esperado ante situaciones concretas.
* Prototipos: tienen diferentes versiones pero siempre buscan clarificar requerimientos en sus diferentes formas.
* Historias de usuario: son descripciones cortas y de alto nivel de una funcionalidad expresadas desde la perspectiva del usuario. SU objetivo es brindar una idea del esfuerzo requerido para su implementacion que su detalle, basado en los metodos agiles y el no desperdicio de recursos.

#### Evolucion

* Años 90's-2000's Waterfall: todo debe estar docume tado antes de codificar. Procesos caros. Deploys y versionados limitados por medios fisicos.
* Años 2010's Agiles & SaaS: comunicacion e iteraciones. Deploys mas rapidos y frecuentes. Historias de usuario centradas en la comunicacion.
* Presente "La era de la IA": la ia escribe codigo de calidad similar a los humanos. La velocidad es mas alta. Los tiempos para tener una aplicacion son drasticamente menores.

### Historias de usuario

* Es un elemento que proviene de la metodologia XP.
* Se pueden definir como un recordatorio de algo relevante para hablar con el usuario.
* Se pueden equiparar al titulo de un requerimiento tradicional
* Suelen seguir un formato del tipo: Como \<rol> quiero \<funcionalidad> para \<beneficio>

Van acompañadas de los siguientes elementos:

* Valor para el negocio + Estimacion + Condiciones de aceptacion.

¿Que tienen que tener?

En general, las historias pueden ser consideradas como una excusa para hablar con el cliente sobre un tema.

#### Empecemos por la aceptacion

Los criterios de aceptacion son un conjunto de condiciones que clarifican los requerimientos, en este caso, las historias de usuario.
Pueden ser ejemplos de uso de la funcionalidad requerida que sirven para probar si lo implementado es correcto. Se pueden adjuntar datos y condiciones del contexto para la definicion.
Son la base para la generacion (automatica) de casos de prueba.

##### Ejemplo

**Historia de usuario**:

* Como usuario de tipo cajero del punto de venta quiero generar una nueva factura a un cliente para registrar una operacion de venta de productos.

**Criterio de aceptacion**:

* El importe final de una factura no puede ser negativo.
* Un item de la factura podra tener un importe negativo solo si se trata de un descuento o bonificacion, nunca un producto.

### Vibe-coding for the people

Aunque lleva a mucha gente a generar productos (al menos en un nivel de prototipo) que hace un tiempo hubieran sido impensados, programar todo un sistema mediante prompts conversacionales es insostenible a nivel profesional.

Prompt "Quiero una app similar a Uber pero para mascotas, tiene que tener una interfaz moderna y ejecutarse rapido":

* Anarquia: la IA decide arquitectura, patrones, framework.
* Escalabilidad not found: esto no se versiona, es complejo de compartir con un equipo.
* Incertidumbre, SI. Ambiguedad, NO. Faltan limites y reglas que se deben cumplir.

#### Una solucion (por ahora) -> las Specs

Un documento con las siguientes caracteristicas:

* Tecto plano. Entendible por humanos + agentes. Formato Markdown (.md).
* Se especifica el que no el como. La parte algoritmica la resuelve el agente.
* Es apto para ser versionado en un repositorio junto con el codigo.
* Ganamos consistencia, el mismo archivo va a dar resultados estructuralmente similares. El modelo deja de alucionar al codificar.

#### ¿Como escribir o generar esto?

##### Primer paso >> Alineacion y contexto para el agente

1. Solicitar que nos pregunte todas las dudas hasta que este seguro. Que pregunte que queremos que pase en cada caso limite.
2. Incorporar referencias visuales de como deberia verse el producto. (por ejemplo: v0 de Vercel >> wireframes en Figma >> capturas para el agente).
3. Definir estandares de codificacion en el repositorio para que los pueda leer y seguir al momento de generar el producto.

##### Segundo paso >> Marcar los limites

1. Restricciones tecnologicas
2. Restricciones de datos
3. Restricciones funcionales

##### Tercer paso >> Definir subtareas para una ejecucion ordenada

1. Crear el modelo de usuario.
    * Agente especializado para BD.
2. Crear los endpoints de la API para login/refresh token.
    * Agente especializado en APIs.
3. Implementar el frontend siguiendo los lineamientos establecidos.
    * Agente especializado en UI/UX.

---
