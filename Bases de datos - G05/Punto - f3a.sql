CREATE OR REPLACE PROCEDURE sp_tipo_cuenta_mensaje(p_nrcuenta INT)
LANGUAGE plpgsql AS $$
DECLARE
    v_tipo INT;
    v_mensaje VARCHAR(50);
BEGIN
    SELECT TipoCuenta INTO v_tipo 
    FROM CUENTAS 
    WHERE NrCuenta = p_nrcuenta;
    
    IF NOT FOUND THEN
        RAISE NOTICE 'La cuenta número % no se encuentra en el sistema.', p_nrcuenta;
        RETURN;
    END IF;

    -- Evaluación condicional mediante CASE
    v_mensaje := CASE v_tipo
                    WHEN 1 THEN 'Caja de Ahorro en Pesos'
                    WHEN 2 THEN 'Cuenta Corriente'
                    WHEN 3 THEN 'Caja de Ahorro en Dólares'
                    ELSE 'Tipo de cuenta especial/desconocido'
                 END;
                 
    RAISE NOTICE 'La cuenta % está clasificada como: %', p_nrcuenta, v_mensaje;
END;
$$;