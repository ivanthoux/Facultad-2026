CREATE OR REPLACE PROCEDURE SP_Log_Errores(
    p_Procedimiento VARCHAR(100),
    p_CodError VARCHAR(5),
    p_MensajeError TEXT
)
LANGUAGE plpgsql AS $$
BEGIN
    RAISE NOTICE '>> LOG DE SISTEMA GUARDADO: Error % en % - Detalle: %', p_CodError, p_Procedimiento, p_MensajeError;
END;
$$;

CREATE OR REPLACE PROCEDURE SP_AltaEmpleado_Avanzado(
    p_Apellido VARCHAR(30),
    p_Nombre VARCHAR(30),
    p_CodCateg INT,
    p_NrSuc INT,
    p_CodCiud INT,
    OUT p_LegajoGenerado_OUT INT
)
LANGUAGE plpgsql AS $$
DECLARE
    -- Variables internas
    v_NuevoLegajo INT;
    v_error_state VARCHAR(5);
    v_error_msg TEXT;
BEGIN
    -- 1. Controles de Integridad (Si no existe, se lanza una excepción personalizada)
    IF NOT EXISTS (SELECT 1 FROM SUCURSALES WHERE NrSuc = p_NrSuc) THEN
        -- Usamos ERRCODE personalizados que empiecen con 'P' (User-defined exception)
        RAISE EXCEPTION 'Error de Integridad: La sucursal indicada no existe en el sistema.' USING ERRCODE = 'P0001';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM CATEGORIAS WHERE CodCateg = p_CodCateg) THEN
        RAISE EXCEPTION 'Error de Integridad: El código de categoría ingresado es inválido.' USING ERRCODE = 'P0002';
    END IF;

    -- 2. Generar siguiente Nro de ID
    -- COALESCE reemplaza al ISNULL de SQL Server
    SELECT COALESCE(MAX(LegEmp), 0) + 1 INTO v_NuevoLegajo FROM EMPLEADOS;

    -- 3. Inserción (CURRENT_DATE reemplaza a GETDATE())
    INSERT INTO EMPLEADOS (LegEmp, Apellido, Nombre, CodCateg, NrSuc, CodCiud, FechaIngreso)
    VALUES (v_NuevoLegajo, p_Apellido, p_Nombre, p_CodCateg, p_NrSuc, p_CodCiud, CURRENT_DATE);

    -- 4. Asignar el parámetro de salida
    p_LegajoGenerado_OUT := v_NuevoLegajo;

    RAISE NOTICE 'Operación Exitosa: Empleado % registrado. Legajo Asignado: %', p_Apellido, v_NuevoLegajo;

EXCEPTION
    -- 5. Bloque CATCH (Captura de errores)
    WHEN OTHERS THEN
        -- Extraemos el código y el mensaje original del error
        GET STACKED DIAGNOSTICS v_error_state = RETURNED_SQLSTATE,
                                v_error_msg = MESSAGE_TEXT;
        
        RAISE NOTICE '=== ATENCIÓN: LA OPERACIÓN HA FALLADO ===';
        
        -- Ejecutamos el SP anidado
        CALL SP_Log_Errores('SP_AltaEmpleado_Avanzado', v_error_state, v_error_msg);
        
        -- Relanzamos la excepción (equivalente al THROW vacío de SQL Server)
        RAISE;
END;
$$;