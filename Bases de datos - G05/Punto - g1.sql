CREATE OR REPLACE PROCEDURE sp_actualizar_saldo_porcentaje(
    p_NroCuenta INT,
    p_Porcentaje NUMERIC
)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE CUENTAS
    SET Saldo = Saldo + (Saldo * (p_Porcentaje / 100.0))
    WHERE NrCuenta = p_NroCuenta;
END;
$$;