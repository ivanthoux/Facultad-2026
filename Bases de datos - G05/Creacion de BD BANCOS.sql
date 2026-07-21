-- 1. Tablas de Ubicación Geográfica
CREATE TABLE PROVINCIAS (
    CodProv SERIAL PRIMARY KEY,
    Provincia VARCHAR(50) NOT NULL
);

CREATE TABLE CIUDADES (
    CodCiud SERIAL PRIMARY KEY,
    CodProv INT NOT NULL,
    Ciudad VARCHAR(50) NOT NULL,
    CONSTRAINT fk_ciudad_provincia FOREIGN KEY (CodProv) REFERENCES PROVINCIAS(CodProv)
);

-- 2. Clasificaciones y Tipos
CREATE TABLE CATEGORIAS (
    CodCateg SERIAL PRIMARY KEY,
    Categ VARCHAR(50) NOT NULL,
    Sueldo NUMERIC(12, 2) NOT NULL
);

CREATE TABLE TIPOSCUENTAS (
    TipoCuenta SERIAL PRIMARY KEY,
    Descripcion VARCHAR(30) NOT NULL,
    Tasa DECIMAL(5, 2) NOT NULL
);

CREATE TABLE OPERACIONES (
    CodOp INT PRIMARY KEY, -- 0 para Debe, 1 para Haber
    Tipo CHAR(5) CHECK (Tipo IN ('D', 'H')),
    DescripTipOp VARCHAR(10) NOT NULL
);

CREATE TABLE TIPOSOPERACIONES (
    CodTipoOp SERIAL PRIMARY KEY,
    CodOp INT NOT NULL,
    Operacion VARCHAR(30) NOT NULL,
    CONSTRAINT fk_tipoop_operacion FOREIGN KEY (CodOp) REFERENCES OPERACIONES(CodOp)
);

-- 3. Entidades Principales
CREATE TABLE SUCURSALES (
    NrSuc SERIAL PRIMARY KEY,
    CodCiud INT NOT NULL,
    CONSTRAINT fk_sucursal_ciudad FOREIGN KEY (CodCiud) REFERENCES CIUDADES(CodCiud)
);

CREATE TABLE EMPLEADOS (
    LegEmp SERIAL PRIMARY KEY,
    Apellido VARCHAR(50) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    CodCateg INT NOT NULL,
    NrSuc INT NOT NULL,
    CodCiud INT NOT NULL,
    FechaIngreso DATE NOT NULL,
    CONSTRAINT fk_emp_categoria FOREIGN KEY (CodCateg) REFERENCES CATEGORIAS(CodCateg),
    CONSTRAINT fk_emp_sucursal FOREIGN KEY (NrSuc) REFERENCES SUCURSALES(NrSuc),
    CONSTRAINT fk_emp_ciudad FOREIGN KEY (CodCiud) REFERENCES CIUDADES(CodCiud)
);

CREATE TABLE CLIENTES (
    DNI INT PRIMARY KEY,
    Apellido VARCHAR(50) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    CodCiud INT NOT NULL,
    CONSTRAINT fk_cliente_ciudad FOREIGN KEY (CodCiud) REFERENCES CIUDADES(CodCiud)
);

CREATE TABLE CUENTAS (
    NrCuenta SERIAL PRIMARY KEY,
    DNI INT NOT NULL,
    NrSuc INT NOT NULL,
    TipoCuenta INT NOT NULL,
    Saldo NUMERIC(15, 2) DEFAULT 0,
    CONSTRAINT fk_cuenta_cliente FOREIGN KEY (DNI) REFERENCES CLIENTES(DNI),
    CONSTRAINT fk_cuenta_sucursal FOREIGN KEY (NrSuc) REFERENCES SUCURSALES(NrSuc),
    CONSTRAINT fk_cuenta_tipocuenta FOREIGN KEY (TipoCuenta) REFERENCES TIPOSCUENTAS(TipoCuenta)
);

-- Nota: Movimientos se relaciona con CodTipoOp para saber exactamente qué operación fue (débito, pago, etc.)
CREATE TABLE MOVIMIENTOS (
    NrMov SERIAL PRIMARY KEY,
    NrCuenta INT NOT NULL,
    Monto NUMERIC(15, 2) NOT NULL,
    Fecha DATE NOT NULL,
    CodTipoOp INT NOT NULL,
    CONSTRAINT fk_movimiento_cuenta FOREIGN KEY (NrCuenta) REFERENCES CUENTAS(NrCuenta),
    CONSTRAINT fk_movimiento_tipoop FOREIGN KEY (CodTipoOp) REFERENCES TIPOSOPERACIONES(CodTipoOp)
);