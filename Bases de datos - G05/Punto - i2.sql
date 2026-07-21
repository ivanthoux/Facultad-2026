CREATE OR REPLACE PROCEDURE sp_premiar_cuentas_pf()
LANGUAGE plpgsql AS $$
DECLARE
    -- Cursor avanzado con un JOIN para verificar la descripción del tipo de cuenta
    cur_CuentasPF CURSOR FOR 
        SELECT c.NrCuenta, c.Saldo 
        FROM CUENTAS c
        JOIN TIPOSCUENTAS t ON c.TipoCuenta = t.TipoCuenta
        WHERE t.Descripcion ILIKE '%Plazo Fijo%' 
          AND c.Saldo > '50000'::money;
          
    v_NroCuenta INT;
    v_Saldo MONEY;
BEGIN
    OPEN cur_CuentasPF;

    LOOP
        FETCH cur_CuentasPF INTO v_NroCuenta, v_Saldo;
        EXIT WHEN NOT FOUND;

        -- Actualización aplicando el 5% de premio. 
        -- Al ser MONEY, multiplicarlo por 0.05 numérico funciona perfecto en Postgres.
        UPDATE CUENTAS
        SET Saldo = Saldo + (Saldo * 0.05)
        WHERE NrCuenta = v_NroCuenta;
        
    END LOOP;

    CLOSE cur_CuentasPF;
    
    RAISE NOTICE 'Premios acreditados a las cuentas de Plazo Fijo que cumplen la condición.';
END;
$$;