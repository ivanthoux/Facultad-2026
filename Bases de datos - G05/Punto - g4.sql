CREATE OR REPLACE PROCEDURE sp_obtener_suma_saldos_cliente(
    p_DNI INT,
    OUT p_SumaTotalSaldos MONEY
)
LANGUAGE plpgsql AS $$
BEGIN
    -- COALESCE reemplaza el valor por $0.00 si el SUM() devuelve NULL
    SELECT COALESCE(SUM(Saldo), '0'::money) INTO p_SumaTotalSaldos
    FROM CUENTAS
    WHERE DNI = p_DNI;
END;
$$;