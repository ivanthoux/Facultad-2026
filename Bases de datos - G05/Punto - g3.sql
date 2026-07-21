CREATE OR REPLACE PROCEDURE sp_obtener_cuentas_cliente(
    p_DNI_Cliente INT,
    OUT p_CantidadCuentas INT
)
LANGUAGE plpgsql AS $$
DECLARE
    r_cuenta RECORD;
BEGIN
    p_CantidadCuentas := 0;
    
    -- Recorremos e imprimimos las cuentas encontradas
    FOR r_cuenta IN SELECT NrCuenta, Saldo, NrSuc FROM CUENTAS WHERE DNI = p_DNI_Cliente
    LOOP
        p_CantidadCuentas := p_CantidadCuentas + 1;
        RAISE NOTICE '>> Nro Cuenta: %, Saldo: %, Sucursal: %', r_cuenta.NrCuenta, r_cuenta.Saldo, r_cuenta.NrSuc;
    END LOOP;

    IF p_CantidadCuentas = 0 THEN
        RAISE NOTICE 'El cliente con DNI % no posee cuentas registradas.', p_DNI_Cliente;
    ELSE
        RAISE NOTICE 'Se encontraron % cuenta(s) para el cliente.', p_CantidadCuentas;
    END IF;
END;
$$;