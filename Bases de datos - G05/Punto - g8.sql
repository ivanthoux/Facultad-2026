CREATE OR REPLACE PROCEDURE sp_incrementar_sueldo_por_categoria(
    p_Porcentaje NUMERIC, 
    p_Categoria VARCHAR
)
LANGUAGE plpgsql AS $$
DECLARE
    v_filas_afectadas INT;
BEGIN
    UPDATE CATEGORIAS 
    SET Sueldo = Sueldo + (Sueldo * (p_Porcentaje / 100.0)) 
    WHERE Categ = p_Categoria;
    
    GET DIAGNOSTICS v_filas_afectadas = ROW_COUNT;
    
    IF v_filas_afectadas = 0 THEN
        RAISE NOTICE 'No se encontró la categoría: %', p_Categoria;
    ELSE
        RAISE NOTICE 'Actualización exitosa. Categorías afectadas: %', v_filas_afectadas;
    END IF;
END;
$$;