CREATE OR REPLACE PROCEDURE sp_calcular_total_extracciones(
    p_Cuenta_X INT, 
    p_Dias_N INT, 
    OUT p_MontoTotal MONEY
)
LANGUAGE plpgsql AS $$
DECLARE
    v_filas INT;
BEGIN
    PERFORM 1 FROM CUENTAS WHERE NrCuenta = p_Cuenta_X;
    
    IF NOT FOUND THEN
        RAISE NOTICE 'Atención: La cuenta Nro % no existe.', p_Cuenta_X;
        p_MontoTotal := '0'::money;
        RETURN;
    END IF;

    -- Filtramos por CodOp = 0 que corresponde al "Debe"
    SELECT COALESCE(SUM(m.Monto), '0'::money) INTO p_MontoTotal
    FROM MOVIMIENTOS m
    JOIN TIPOSOPERACIONES t ON m.CodTipoOp = t.CodTipoOp
    JOIN OPERACIONES o ON t.CodOp = o.CodOp
    WHERE m.NrCuenta = p_Cuenta_X 
      AND o.CodOp = 0 
      AND m.Fecha >= CURRENT_DATE - p_Dias_N;

    -- Extraemos la cantidad de filas afectadas simulando el @@ROWCOUNT
    GET DIAGNOSTICS v_filas = ROW_COUNT;
    
    IF p_MontoTotal = '0'::money THEN
        RAISE NOTICE 'No se registraron extracciones en los últimos % días.', p_Dias_N;
    ELSE
        RAISE NOTICE 'Cálculo exitoso. Monto total extraído: %', p_MontoTotal;
    END IF;
END;
$$;