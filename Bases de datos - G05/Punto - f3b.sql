CREATE OR REPLACE FUNCTION fn_clasificar_cuentas_saldo()
RETURNS TABLE (
    nro_cuenta INT, 
    saldo_actual MONEY, 
    clasificacion VARCHAR
)
LANGUAGE plpgsql AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.NrCuenta, 
        c.Saldo,
        CASE 
            WHEN c.Saldo < '10000'::money THEN 'Saldo bajo'::VARCHAR
            WHEN c.Saldo BETWEEN '10000'::money AND '50000'::money THEN 'Saldo medio'::VARCHAR
            WHEN c.Saldo > '50000'::money THEN 'Saldo alto'::VARCHAR
        END
    FROM CUENTAS c;
END;
$$;