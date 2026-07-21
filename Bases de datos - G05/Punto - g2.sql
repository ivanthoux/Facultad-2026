CREATE OR REPLACE PROCEDURE sp_modificar_ciudad_cliente(
    p_DNI INT,
    p_NuevoCodCiud INT
)
LANGUAGE plpgsql AS $$
BEGIN
    -- Validamos existencia sin almacenar datos
    PERFORM 1 FROM CLIENTES WHERE DNI = p_DNI;
    
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Cliente inexistente.' USING ERRCODE = 'P0010';
    END IF;

    UPDATE CLIENTES
    SET CodCiud = p_NuevoCodCiud
    WHERE DNI = p_DNI;
    
    RAISE NOTICE 'Ciudad actualizada correctamente.';
END;
$$;