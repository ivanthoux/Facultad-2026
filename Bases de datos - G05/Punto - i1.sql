CREATE OR REPLACE PROCEDURE sp_actualizar_sueldos_categorias(
    p_PorcAdm NUMERIC,
    p_PorcGer NUMERIC,
    p_PorcSeg NUMERIC
)
LANGUAGE plpgsql AS $$
DECLARE
    -- 1. Declaración explícita del cursor en la sección DECLARE
    cur_categ CURSOR FOR SELECT CodCateg, Categ FROM CATEGORIAS;
    
    -- Variables para volcar los datos de cada lectura
    v_CodCateg INT;
    v_Categ VARCHAR(50);
BEGIN
    -- 2. Apertura del cursor
    OPEN cur_categ;

    -- 3. Bucle infinito que romperemos manualmente
    LOOP
        -- 4. Lectura del siguiente registro (equivalente a FETCH NEXT)
        FETCH cur_categ INTO v_CodCateg, v_Categ;
        
        -- 5. Condición de corte (reemplaza al @@FETCH_STATUS = 0)
        EXIT WHEN NOT FOUND;

        -- 6. Lógica de negocio (Evaluación condicional)
        IF v_Categ = 'Administrativo' THEN
            UPDATE CATEGORIAS
            SET Sueldo = Sueldo + (Sueldo * (p_PorcAdm / 100.0))
            WHERE CodCateg = v_CodCateg;
            
        ELSIF v_Categ = 'Gerente' THEN
            UPDATE CATEGORIAS
            SET Sueldo = Sueldo + (Sueldo * (p_PorcGer / 100.0))
            WHERE CodCateg = v_CodCateg;
            
        ELSIF v_Categ = 'Seguridad' THEN
            UPDATE CATEGORIAS
            SET Sueldo = Sueldo + (Sueldo * (p_PorcSeg / 100.0))
            WHERE CodCateg = v_CodCateg;
        END IF;
        
    END LOOP;

    -- 7. Cierre y liberación del cursor
    CLOSE cur_categ;
    
    RAISE NOTICE 'Sueldos actualizados mediante cursor exitosamente.';
END;
$$;