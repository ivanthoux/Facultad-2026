-- ==========================================================
-- SP_TRANSFERENCIA (Orquestador Transaccional)
-- ==========================================================
CREATE OR REPLACE PROCEDURE SP_TRANSFERENCIA(
    p_Cuenta_Origen INT,
    p_Cuenta_Destino INT,
    p_Monto MONEY,
    p_Fecha DATE,
    p_CodOp1 INT,
    p_CodOp2 INT
)
LANGUAGE plpgsql AS $$
BEGIN
    -- Invocamos la operación de débito a la cuenta origen
    CALL SP_DEBITO(p_Cuenta_Origen, p_Monto, p_Fecha, p_CodOp1);

    -- Invocamos la operación de crédito a la cuenta destino
    CALL SP_CREDITO(p_Cuenta_Destino, p_Monto, p_Fecha, p_CodOp2);

    -- Si ambas llamadas (Debito y Credito) terminaron sin disparar excepciones, 
    -- el bloque confirma los cambios en la base de datos automáticamente al finalizar.
    RAISE NOTICE 'Transferencia realizada y confirmada con éxito.';

EXCEPTION
    WHEN OTHERS THEN
        -- Si SP_DEBITO o SP_CREDITO dispararon un RAISE, el flujo cae directamente aquí.
        -- PostgreSQL revierte (ROLLBACK implícito) todas las escrituras hechas en este bloque.
        
        RAISE NOTICE '=== TRANSACCIÓN ABORTADA ===';
        RAISE NOTICE 'Error en la transferencia. Operación cancelada.';
        RAISE NOTICE 'Detalle técnico: %', SQLERRM;
        
        -- Opcional: Podrías llamar a SP_Log_Errores aquí para auditar el fallo.
END;
$$;