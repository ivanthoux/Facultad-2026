# Sistema Integral de Gestión de Créditos, Cobranzas y Refinanciación (SIG-CCR) para Entidades Financieras Regionales

La empresa "Financiera Apóstoles S.R.L.", ubicada en el centro de Apóstoles, Misiones, cuenta tanto con clientes locales como con clientes de zonas aledañas como Azara, Concepción, Liebig y San José. Actualmente, la financiera ha crecido gracias al movimiento económico de la yerba mate y el comercio local. Atienden a dos grandes grupos: Individuos (empleados públicos, docentes, trabajadores rurales, etc.) y PyMEs (secaderos, ferreterías, comercios, etc.).

## Problemática

Actualmente, todo se maneja mediante planillas de cálculo desconectadas y carpetas físicas. Esto genera los siguientes problemas graves que el sistema busca solucionar:

1. **Evaluación de riesgo ineficiente:** el oficial de crédito tarda 48 horas en aprobar un préstamo porque debe cruzar datos manualmente. A veces prestan a personas que ya tienen deudas impagas en otros comercios porque no hay un historial centralizado.
2. **Rigidez en los pagos:** si un cliente (ej. un empleado de comercio) pierde su trabajo, el sistema actual no permite "pausar" o "recalcular" la deuda fácilmente. La deuda sigue acumulando intereses punitorios impagables, convirtiendo al cliente en incobrable.
3. **Caos en la segmentación:** no se distingue correctamente entre un Responsable Inscripto (que requiere análisis de Balance y DDJJ de IVA) y un Monotributista o Asalariado (que requiere recibo de sueldo).
4. **Falta de trazabilidad:** los dueños no saben cuánto dinero exacto entrará la próxima semana para volver a prestar.

## Solución propuesta

Para resolver esto, el sistema deberá contar con los siguientes módulos clave.

### A. Módulo de Gestión de Entidades (Legajo Digital)

El sistema debe permitir la carga dinámica de requisitos según el tipo de persona:

* Persona Física (Relación de Dependencia): carga obligatoria de últimos 3 recibos de sueldo y DNI. Cálculo automático de relación cuota/ingreso (ej: la cuota no puede superar el 30% del sueldo neto).
* Autónomos / Monotributistas: carga de categoría de monotributo y certificación de ingresos.
* PyMEs / Resp. Inscriptos: análisis de flujo de fondos. El sistema debe permitir cargar balances simplificados o declaraciones de IVA para determinar el límite de crédito.

### B. Motor de simulación y otorgamiento

**Sistemas de amortización:** debe soportar Sistema Francés (cuota constante) y Sistema Alemán (amortización constante).
Fórmula: el sistema calculará la cuota automáticamente.
$$C = \frac{V \cdot i}{1 - (1+i)^{-n}}$$

* Donde $C$ es la cuota, $V$ el capital prestado, $i$ la tasa de interés periódica y $n$ la cantidad de cuotas.

### C. Módulo de refinanciación inteligente

El sistema detectará o permitirá gestionar situaciones de crisis:
Escenario: "Cliente 'X' se quedó sin trabajo".
El operador selecciona "Refinanciar por Contingencia". El sistema toma el Capital Adeudado actual y permite aplicar una "Quita de intereses punitorios", generando un nuevo plan con un Período de Gracia (ej: 3 meses sin pagar capital, solo interés, o diferimiento total) hasta que el cliente consiga trabajo. Al finalizar, el sistema emite el nuevo contrato de mutuo acuerdo.

### D. Módulo de Cobranzas y Caja

* Registro de pagos parciales o totales.
* Cálculo automático de mora diaria si el pago se realiza después del vencimiento.
* Emisión de comprobantes de pago.

### E. Automatizaciones Sugeridas

#### 1. Motor de notificaciones multi-canal

Está diseñado para maximizar la tasa de lectura mediante el envío automatizado de alertas vía WhatsApp y SMS, además del correo electrónico. Esta funcionalidad responde a la necesidad de mantener contacto efectivo con trabajadores rurales y clientes de zonas aledañas (Azara, San José, etc.), donde la mensajería instantánea presenta una mayor utilización que el correo electrónico.

* Recordatorio preventivo: 48 horas antes del vencimiento.
* Aviso de 'mora': al día siguiente del vencimiento, con el monto actualizado incluyendo el interés diario.
* Confirmación de pago: envío automático del recibo digital (PDF) apenas el cajero confirma la transacción.

#### 2. Proceso de cierre de día y proyecciones

Un proceso que corra automáticamente a las 00:00 hs:

* Recálculo de mora: actualizar los saldos de todos los préstamos vencidos.
* Reporte de liquidez: un correo automático al Gerente con el flujo de caja proyectado para los próximos 7, 15 y 30 días, basado en los vencimientos de cuotas.

### Justificación técnica y académica

Es importante mencionar qué desafíos técnicos se abarcan dentro del proyecto:

1. **Integridad de datos:** manejo de transacciones (ACID) para asegurar que si se crea un préstamo, se descuente el dinero de la caja de la financiera al mismo tiempo.
2. **Seguridad (roles y permisos)** (El "Cajero" no puede aprobar créditos; el "Oficial de Créditos" no puede tocar la caja; el "Gerente" autoriza refinanciaciones especiales).
3. **Auditoría:** registro de logs (quién modificó una tasa de interés, quién autorizó una refinanciación).
