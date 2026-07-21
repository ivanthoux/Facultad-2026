-- =============================================================================
-- 1. AMPLIACIÓN DE GEOGRAFÍA Y SUCURSALES
-- =============================================================================
INSERT INTO CIUDADES (CodProv, Ciudad) VALUES 
(1, 'Eldorado'), 
(1, 'Puerto Iguazú'), 
(1, 'San Javier'),
(2, 'Goya'),
(2, 'Santo Tomé');

-- Agregamos nuevas sucursales (Asumiendo IDs autoincrementales 4, 5, 6...)
INSERT INTO SUCURSALES (CodCiud) VALUES 
(6), -- Sucursal Eldorado
(7), -- Sucursal Puerto Iguazú
(9); -- Sucursal Santo Tomé

-- =============================================================================
-- 2. CARGA MASIVA DE CLIENTES (DNIs variados para pruebas)
-- =============================================================================
INSERT INTO CLIENTES (DNI, Apellido, Nombre, CodCiud) VALUES 
(34111222, 'Silva', 'Cristian', 1),
(36444555, 'Duarte', 'Nancy', 3),
(25888999, 'Novak', 'Walter', 1),
(40123987, 'Romero', 'Florencia', 2),
(42333222, 'Galeano', 'Facundo', 6),
(31555444, 'Kozlowski', 'Esteban', 1),
(29777666, 'Vogel', 'Elena', 7),
(38111000, 'Benítez', 'Lucas', 3),
(41222333, 'Sosa', 'Camila', 8),
(33444555, 'Méndez', 'Alejandro', 9),
(27666555, 'Giménez', 'Patricia', 2),
(39888777, 'Acosta', 'Lautaro', 6);

-- =============================================================================
-- 3. CARGA DE NUEVAS CUENTAS PARA LOS CLIENTES
-- =============================================================================
INSERT INTO CUENTAS (DNI, NrSuc, TipoCuenta, Saldo) VALUES 
(34111222, 1, 1, 85000.50),  -- CA Pesos
(34111222, 1, 2, 120000.00), -- CC
(36444555, 1, 1, 4500.00),   -- CA Pesos
(25888999, 1, 1, 612000.00), -- CA Pesos
(40123987, 2, 1, 19500.00),  -- CA Pesos
(42333222, 4, 1, 115000.00), -- CA Pesos (Sucursal Eldorado)
(42333222, 4, 3, 450.00),    -- CA Dólares
(31555444, 1, 2, 350000.00), -- CC
(29777666, 5, 1, 89000.00),  -- CA Pesos (Sucursal Iguazú)
(38111000, 1, 1, 12000.00),  -- CA Pesos
(41222333, 3, 1, 74000.00),  -- CA Pesos
(33444555, 6, 2, 500000.00), -- CC (Sucursal Santo Tomé)
(27666555, 2, 1, 23000.00),  -- CA Pesos
(39888777, 4, 1, 9500.00);   -- CA Pesos

-- =============================================================================
-- 4. GENERADOR AUTOMÁTICO DE MOVIMIENTOS (Simulación Masiva)
-- =============================================================================
-- Este bloque inserta 150 movimientos aleatorios distribuidos entre las cuentas
-- y los distintos tipos de operaciones para simular un historial real.
DO $$
DECLARE
    i INT;
    v_cuenta INT;
    v_tipo_op INT;
    v_monto NUMERIC(15,2);
    v_fecha DATE;
    v_max_cuentas INT;
BEGIN
    -- Obtenemos el total de cuentas disponibles para el bucle
    SELECT MAX(NrCuenta) INTO v_max_cuentas FROM CUENTAS;

    FOR i IN 1..150 LOOP
        -- Selecciona una cuenta aleatoria existente
        v_cuenta := floor(random() * v_max_cuentas + 1);
        
        -- Evita errores si hay saltos en los IDs de las cuentas
        IF EXISTS (SELECT 1 FROM CUENTAS WHERE NrCuenta = v_cuenta) THEN
            -- Selecciona un tipo de operación aleatorio entre 1 y 8
            v_tipo_op := floor(random() * 8 + 1);
            
            -- Genera un monto aleatorio entre $500 y $45000
            v_monto := (random() * 44500 + 500)::NUMERIC(15,2);
            
            -- Genera una fecha aleatoria dentro de los últimos 6 meses
            v_fecha := CURRENT_DATE - floor(random() * 180 + 1)::INT;
            
            -- Inserta el movimiento
            INSERT INTO MOVIMIENTOS (NrCuenta, Monto, Fecha, CodTipoOp)
            VALUES (v_cuenta, v_monto, v_fecha, v_tipo_op);
        END IF;
    END LOOP;
END $$;