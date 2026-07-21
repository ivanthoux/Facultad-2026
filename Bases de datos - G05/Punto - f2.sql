-- =============================================================================
-- 1. SP_DEBITO
-- =============================================================================
CREATE OR REPLACE PROCEDURE sp_debito(
    p_cuenta INT,
    p_monto NUMERIC,
    p_fecha DATE,
    p_codop INT
)
LANGUAGE plpgsql AS $$
DECLARE
    v_saldo_actual NUMERIC;
    v_nrmov INT;
BEGIN
    -- Bloqueamos la fila de la cuenta para evitar condiciones de carrera (Race Conditions)
    SELECT saldo::numeric INTO v_saldo_actual 
    FROM CUENTAS 
    WHERE NrCuenta = p_cuenta 
    FOR UPDATE;
    
    IF NOT FOUND THEN
        RAISE EXCEPTION 'La cuenta origen % no existe.', p_cuenta USING ERRCODE = 'P0003';
    END IF;
    
    IF v_saldo_actual < p_monto THEN
        RAISE EXCEPTION 'Saldo insuficiente en la cuenta origen %. Saldo actual: %', p_cuenta, v_saldo_actual USING ERRCODE = 'P0004';
    END IF;

    -- Actualizamos restando el monto convertido a MONEY
    UPDATE CUENTAS 
    SET saldo = saldo - p_monto::money 
    WHERE NrCuenta = p_cuenta;

    -- Generación del ID secuencial manual
    SELECT COALESCE(MAX(NrMov), 0) + 1 INTO v_nrmov FROM MOVIMIENTOS;
    
    INSERT INTO MOVIMIENTOS (NrMov, NrCuenta, Monto, Fecha, CodTipoOp)
    VALUES (v_nrmov, p_cuenta, p_monto::money, p_fecha, p_codop);
END;
$$;

-- =============================================================================
-- 2. SP_CREDITO
-- =============================================================================
CREATE OR REPLACE PROCEDURE sp_credito(
    p_cuenta INT,
    p_monto NUMERIC,
    p_fecha DATE,
    p_codop INT
)
LANGUAGE plpgsql AS $$
DECLARE
    v_nrmov INT;
BEGIN
    -- PERFORM evalúa la consulta y bloquea el registro sin necesidad de almacenar datos en variables
    PERFORM 1 FROM CUENTAS WHERE NrCuenta = p_cuenta FOR UPDATE;
    
    IF NOT FOUND THEN
        RAISE EXCEPTION 'La cuenta destino % no existe.', p_cuenta USING ERRCODE = 'P0005';
    END IF;

    -- Actualizamos sumando el monto
    UPDATE CUENTAS 
    SET saldo = saldo + p_monto::money 
    WHERE NrCuenta = p_cuenta;

    -- Generación del ID secuencial manual
    SELECT COALESCE(MAX(NrMov), 0) + 1 INTO v_nrmov FROM MOVIMIENTOS;
    
    INSERT INTO MOVIMIENTOS (NrMov, NrCuenta, Monto, Fecha, CodTipoOp)
    VALUES (v_nrmov, p_cuenta, p_monto::money, p_fecha, p_codop);
END;
$$;

-- =============================================================================
-- 3. SP_TRANSFERENCIA (Orquestador)
-- =============================================================================
CREATE OR REPLACE PROCEDURE sp_transferencia(
    p_cuenta_origen INT,
    p_cuenta_destino INT,
    p_monto NUMERIC,
    p_fecha DATE,
    p_codop1 INT,
    p_codop2 INT
)
LANGUAGE plpgsql AS $$
DECLARE
    v_error_state VARCHAR(5);
    v_error_msg TEXT;
BEGIN
    -- Control preventivo rápido: una cuenta no puede transferirse a sí misma
    IF p_cuenta_origen = p_cuenta_destino THEN
        RAISE EXCEPTION 'Operación inválida: La cuenta de origen y destino no pueden ser iguales.' USING ERRCODE = 'P0006';
    END IF;

    -- Invocación anidada de los SP correspondientes
    CALL sp_debito(p_cuenta_origen, p_monto, p_fecha, p_codop1);
    CALL sp_credito(p_cuenta_destino, p_monto, p_fecha, p_codop2);
    
    RAISE NOTICE 'Transferencia de $% realizada con éxito. Origen: %, Destino: %', p_monto, p_cuenta_origen, p_cuenta_destino;

EXCEPTION
    WHEN OTHERS THEN
        -- Capturamos el error para la auditoría / log
        GET STACKED DIAGNOSTICS v_error_state = RETURNED_SQLSTATE,
                                v_error_msg = MESSAGE_TEXT;
        
        RAISE NOTICE '=== ERROR EN TRANSFERENCIA: OPERACIÓN ABORTADA ===';
        
        -- Invocamos el SP de Log de Errores que creamos en el inciso anterior f.1
        CALL SP_Log_Errores('sp_transferencia', v_error_state, v_error_msg);
        
        -- Volvemos a lanzar el error para que la aplicación o consola se entere del fallo
        RAISE EXCEPTION '%', v_error_msg;
END;
$$;