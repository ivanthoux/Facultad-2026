CREATE OR REPLACE FUNCTION fn_obtener_ubicacion_sucursal_cuenta(p_nrcuenta INT)
RETURNS TABLE (
    ciudad_sucursal VARCHAR, 
    provincia_sucursal VARCHAR
)
LANGUAGE plpgsql AS $$
BEGIN
    RETURN QUERY
    SELECT ci.Ciudad::VARCHAR, pr.Provincia::VARCHAR
    FROM CUENTAS cu
    JOIN SUCURSALES s ON cu.NrSuc = s.NrSuc
    JOIN CIUDADES ci ON s.CodCiud = ci.CodCiud
    JOIN PROVINCIAS pr ON ci.CodProv = pr.CodProv
    WHERE cu.NrCuenta = p_nrcuenta;
END;
$$;