-- ==========================================================
-- SP_DEBITO (Con control transaccional PL/pgSQL)
-- ==========================================================
CREATE OR REPLACE PROCEDURE SP_DEBITO(
    p_NrCuenta INT,
    p_Monto MONEY,
    p_Fecha DATE,
    p_CodTipoOp INT
)
LANGUAGE plpgsql AS $$
DECLARE
    v_Saldo MONEY;
    v_NrMov INT;
BEGIN
    -- SELECT ... FOR UPDATE bloquea la fila para evitar lecturas fantasmas
    SELECT Saldo INTO v_Saldo 
    FROM CUENTAS 
    WHERE NrCuenta = p_NrCuenta 
    FOR UPDATE;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Cuenta inexistente: %', p_NrCuenta;
    END IF;

    IF v_Saldo < p_Monto THEN
        RAISE EXCEPTION 'Saldo insuficiente en la cuenta %.', p_NrCuenta;
    END IF;

    UPDATE CUENTAS
    SET Saldo = Saldo - p_Monto
    WHERE NrCuenta = p_NrCuenta;

    SELECT COALESCE(MAX(NrMov), 0) + 1 INTO v_NrMov FROM MOVIMIENTOS;

    INSERT INTO MOVIMIENTOS (NrMov, NrCuenta, Monto, Fecha, CodTipoOp)
    VALUES (v_NrMov, p_NrCuenta, p_Monto, p_Fecha, p_CodTipoOp);

    -- Si llegamos hasta acá sin errores, la subtransacción es exitosa.
    -- (No se pone COMMIT explícito por la existencia del bloque EXCEPTION)

EXCEPTION
    WHEN OTHERS THEN
        -- Al entrar aquí, PostgreSQL YA HIZO EL ROLLBACK de los UPDATE/INSERT anteriores
        RAISE NOTICE 'Error detectado en SP_DEBITO: %', SQLERRM;
        -- Relanzamos el error para que aborte la transacción superior
        RAISE; 
END;
$$;


-- ==========================================================
-- SP_CREDITO (Con control transaccional PL/pgSQL)
-- ==========================================================
CREATE OR REPLACE PROCEDURE SP_CREDITO(
    p_NrCuenta INT,
    p_Monto MONEY,
    p_Fecha DATE,
    p_CodTipoOp INT
)
LANGUAGE plpgsql AS $$
DECLARE
    v_NrMov INT;
BEGIN
    -- Validamos existencia y bloqueamos el registro
    PERFORM 1 FROM CUENTAS WHERE NrCuenta = p_NrCuenta FOR UPDATE;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Cuenta destino inexistente: %', p_NrCuenta;
    END IF;

    UPDATE CUENTAS
    SET Saldo = Saldo + p_Monto
    WHERE NrCuenta = p_NrCuenta;

    SELECT COALESCE(MAX(NrMov), 0) + 1 INTO v_NrMov FROM MOVIMIENTOS;

    INSERT INTO MOVIMIENTOS (NrMov, NrCuenta, Monto, Fecha, CodTipoOp)
    VALUES (v_NrMov, p_NrCuenta, p_Monto, p_Fecha, p_CodTipoOp);

EXCEPTION
    WHEN OTHERS THEN
        -- El ROLLBACK local se ejecuta de forma implícita
        RAISE NOTICE 'Error detectado en SP_CREDITO: %', SQLERRM;
        RAISE; -- Relanzamos a la capa superior
END;
$$;