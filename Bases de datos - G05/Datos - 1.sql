-- Provincias y Ciudades
INSERT INTO PROVINCIAS (Provincia) VALUES ('Misiones'), ('Corrientes'), ('Chaco');
INSERT INTO CIUDADES (CodProv, Ciudad) VALUES 
(1, 'Apóstoles'), (1, 'Posadas'), (1, 'Oberá'), 
(2, 'Corrientes Capital'), (2, 'Ituzaingó');

-- Categorías de Empleados
INSERT INTO CATEGORIAS (Categ, Sueldo) VALUES 
('Administrativo', 450000.00), 
('Gerente', 950000.00), 
('Seguridad', 380000.00), 
('Atención al Cliente', 420000.00);

-- Tipos de Cuentas
INSERT INTO TIPOSCUENTAS (Descripcion, Tasa) VALUES 
('Caja de Ahorro en Pesos', 0.50), 
('Cuenta Corriente', 0.00), 
('Caja de Ahorro en Dólares', 0.10);

-- Operaciones Base (Debe = 0, Haber = 1)
INSERT INTO OPERACIONES (CodOp, Tipo, DescripTipOp) VALUES 
(0, 'D', 'Debe'), 
(1, 'H', 'Haber');

-- Tipos de Operaciones (al menos 8 como pide la imagen)
INSERT INTO TIPOSOPERACIONES (CodOp, Operacion) VALUES 
(0, 'Débito por Extracción'),     -- 1
(1, 'Crédito por Depósito'),      -- 2
(0, 'Pago Tarjeta de Crédito'),   -- 3
(1, 'Cobro de Sueldo'),           -- 4
(0, 'Transferencia Enviada'),     -- 5
(1, 'Transferencia Recibida'),    -- 6
(0, 'Cobro Mantenimiento'),       -- 7
(0, 'Pago de Servicios');         -- 8

-- Sucursales
INSERT INTO SUCURSALES (CodCiud) VALUES (1), (2), (4);

-- Empleados
INSERT INTO EMPLEADOS (Apellido, Nombre, CodCateg, NrSuc, CodCiud, FechaIngreso) VALUES 
('Pérez', 'Juan', 2, 1, 1, '2020-05-15'),
('Gómez', 'María', 1, 1, 1, '2022-03-10'),
('López', 'Carlos', 3, 2, 2, '2021-08-01');

-- Clientes
INSERT INTO CLIENTES (DNI, Apellido, Nombre, CodCiud) VALUES 
(30123456, 'Fernández', 'Lucas', 1),
(32654987, 'Martínez', 'Ana', 2),
(28999111, 'Rodríguez', 'Diego', 1),
(35444333, 'Sánchez', 'Valeria', 4);

-- Cuentas (Saldos iniciales variados)
INSERT INTO CUENTAS (DNI, NrSuc, TipoCuenta, Saldo) VALUES 
(30123456, 1, 1, 150000.00), -- Cuenta 1
(30123456, 1, 2, 50000.00),  -- Cuenta 2
(32654987, 2, 1, 320000.00), -- Cuenta 3
(28999111, 1, 3, 1500.00);   -- Cuenta 4