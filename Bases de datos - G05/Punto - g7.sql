CREATE OR REPLACE FUNCTION fn_ultimos_movimientos_por_tipo(
    p_NrCuenta INT,
    p_Cantidad INT
)
RETURNS TABLE (
    CodigoTipoOperacion INT,
    CantidadMovimientos BIGINT,
    TotalOperado MONEY
)
LANGUAGE plpgsql AS $$
BEGIN
    PERFORM 1 FROM CUENTAS WHERE NrCuenta = p_NrCuenta;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'La cuenta % no existe.', p_NrCuenta USING ERRCODE = 'P0012';
    END IF;

    RETURN QUERY
    SELECT 
        X.CodTipoOp_sub,
        COUNT(X.*) AS CantidadMovimientos,
        SUM(X.Monto_sub) AS TotalOperado
    FROM (
        -- Subconsulta para traer los últimos N movimientos primero
        SELECT m.CodTipoOp AS CodTipoOp_sub, m.Monto AS Monto_sub
        FROM MOVIMIENTOS m
        WHERE m.NrCuenta = p_NrCuenta
        ORDER BY m.Fecha DESC, m.NrMov DESC
        LIMIT p_Cantidad
    ) X
    GROUP BY X.CodTipoOp_sub;
END;
$$;