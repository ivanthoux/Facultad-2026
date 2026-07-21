-- 1. Creamos la tabla donde se van a guardar permanentemente los fallos
CREATE TABLE LOG_ERRORES (
    IdLog SERIAL PRIMARY KEY,
    Procedimiento VARCHAR(100),
    CodError VARCHAR(5),
    MensajeError TEXT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Actualizamos el SP_Log_Errores para que escriba en la tabla y también avise en pantalla
CREATE OR REPLACE PROCEDURE SP_Log_Errores(
    p_Procedimiento VARCHAR(100),
    p_CodError VARCHAR(5),
    p_MensajeError TEXT
)
LANGUAGE plpgsql AS $$
BEGIN
    -- Inserta el fallo de forma persistente
    INSERT INTO LOG_ERRORES (Procedimiento, CodError, MensajeError)
    VALUES (p_Procedimiento, p_CodError, p_MensajeError);

    -- Muestra el aviso inmediato en la consola de pgAdmin
    RAISE NOTICE '>> LOG DE SISTEMA GUARDADO EN TABLA: Error % en % - Detalle: %', p_CodError, p_Procedimiento, p_MensajeError;
END;
$$;