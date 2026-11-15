-- CREACIÓN DE BASE DE DATOS VETERINARIA

CREATE DATABASE VETERINARIA;
GO

USE VETERINARIA;
GO
-- ==========================================
-- crear especie y raza
CREATE TABLE especie (
    id_especie INT IDENTITY(1,1) PRIMARY KEY,
    nombre_especie VARCHAR(100) NOT NULL
);

CREATE TABLE raza (
    id_raza INT IDENTITY(1,1) PRIMARY KEY,
    nombre_raza VARCHAR(100) NOT NULL,
    id_especie INT NOT NULL,

    CONSTRAINT fk_raza_especie
        FOREIGN KEY (id_especie)
        REFERENCES especie(id_especie)
        ON DELETE NO ACTION,

    CONSTRAINT uq_raza_id_especie
        UNIQUE (id_raza, id_especie)
);

-- ==========================================
-- crear propietario
CREATE TABLE propietario (
    id_propietario INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(150),
    direccion VARCHAR(MAX)
);

CREATE UNIQUE INDEX ux_propietario_telefono
    ON propietario(telefono)
    WHERE telefono IS NOT NULL;

CREATE UNIQUE INDEX ux_propietario_correo
    ON propietario(correo)
    WHERE correo IS NOT NULL;

CREATE TABLE especialidad (
    id_especialidad INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
-- ==========================================
-- crear veterinario
CREATE TABLE veterinario (
    id_veterinario INT IDENTITY(1,1) PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    carne VARCHAR(50) UNIQUE NOT NULL,
    id_especialidad INT NOT NULL,

    CONSTRAINT fk_veterinario_especialidad
        FOREIGN KEY (id_especialidad)
        REFERENCES especialidad(id_especialidad)
        ON DELETE NO ACTION
);

-- ==========================================
-- mascota
CREATE TABLE mascota (
    id_mascota INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT,
    id_especie INT NOT NULL,
    id_raza INT NULL,
    id_propietario INT NOT NULL,

    CONSTRAINT fk_mascota_especie
        FOREIGN KEY (id_especie)
        REFERENCES especie(id_especie)
        ON DELETE NO ACTION,

    CONSTRAINT fk_mascota_raza_especie
        FOREIGN KEY (id_raza, id_especie)
        REFERENCES raza(id_raza, id_especie)
        ON DELETE NO ACTION,

    CONSTRAINT fk_mascota_propietario
        FOREIGN KEY (id_propietario)
        REFERENCES propietario(id_propietario)
        ON DELETE NO ACTION,

    CONSTRAINT ck_edad CHECK (edad >= 0)
);

-- ==========================================
-- cita

CREATE TABLE cita (
    id_cita INT IDENTITY(1,1) PRIMARY KEY,
    fecha_cita DATE NOT NULL,
    hora_cita TIME NOT NULL,
    id_mascota INT NOT NULL,
    id_veterinario INT NOT NULL,
    estado_cita VARCHAR(20) NOT NULL
        CONSTRAINT df_cita_estado DEFAULT ('Reservada'),
    fecha_cancelacion DATETIME2(0) NULL,

    CONSTRAINT fk_cita_mascota
        FOREIGN KEY (id_mascota)
        REFERENCES mascota(id_mascota)
        ON DELETE NO ACTION,

    CONSTRAINT fk_cita_veterinario
        FOREIGN KEY (id_veterinario)
        REFERENCES veterinario(id_veterinario)
        ON DELETE NO ACTION,

    CONSTRAINT ck_cita_estado
        CHECK (estado_cita IN ('Reservada', 'Completada', 'Cancelada')),

    CONSTRAINT ck_cita_fecha_cancelacion
        CHECK (
            (estado_cita = 'Cancelada' AND fecha_cancelacion IS NOT NULL)
            OR (estado_cita <> 'Cancelada' AND fecha_cancelacion IS NULL)
        )
);

CREATE UNIQUE INDEX ux_cita_veterinario_fecha_hora_activa
    ON cita(id_veterinario, fecha_cita, hora_cita)
    WHERE estado_cita <> 'Cancelada';

-- ==========================================
-- diagnostico/tratamiento

CREATE TABLE diagnostico (
    id_diagnostico INT IDENTITY(1,1) PRIMARY KEY,
    informe VARCHAR(MAX) NOT NULL,
    id_cita INT NOT NULL,

    CONSTRAINT fk_diagnostico_cita
        FOREIGN KEY (id_cita)
        REFERENCES cita(id_cita)
        ON DELETE NO ACTION,

    CONSTRAINT uq_id_cita UNIQUE (id_cita)
);

CREATE TABLE tratamiento (
    id_tratamiento INT IDENTITY(1,1) PRIMARY KEY,
    dosis VARCHAR(100),
    id_cita INT NOT NULL,

    CONSTRAINT fk_tratamiento_cita
        FOREIGN KEY (id_cita)
        REFERENCES cita(id_cita)
        ON DELETE NO ACTION
);

-- ==========================================
-- articulos

CREATE TABLE tipo_articulo (
    id_tipo_articulo INT IDENTITY(1,1) PRIMARY KEY,
    tipo_nombre VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE articulo (
    id_articulo INT IDENTITY(1,1) PRIMARY KEY,
    nombre_articulo VARCHAR(150) NOT NULL
        CONSTRAINT uq_articulo_nombre UNIQUE,
    precio_unitario NUMERIC(10,2) NOT NULL,
    id_tipo_articulo INT NOT NULL,

    CONSTRAINT fk_articulo_tipo
        FOREIGN KEY (id_tipo_articulo)
        REFERENCES tipo_articulo(id_tipo_articulo)
        ON DELETE NO ACTION,

    CONSTRAINT ck_precio_unitario CHECK (precio_unitario >= 0.00)
);

-- ==========================================
-- medicamento_tratamiento

CREATE TABLE medicamento_tratamiento (
    id_articulo INT NOT NULL,
    id_tratamiento INT NOT NULL,

    PRIMARY KEY (id_articulo, id_tratamiento),

    CONSTRAINT fk_mt_articulo
        FOREIGN KEY (id_articulo)
        REFERENCES articulo(id_articulo)
        ON DELETE NO ACTION,

    CONSTRAINT fk_mt_tratamiento
        FOREIGN KEY (id_tratamiento)
        REFERENCES tratamiento(id_tratamiento)
        ON DELETE NO ACTION
);

-- ==========================================
-- formas de pago

CREATE TABLE forma_pago (
    id_forma_pago INT IDENTITY(1,1) PRIMARY KEY,
    nombre_forma_pago VARCHAR(100) NOT NULL
        CONSTRAINT uq_forma_pago_nombre UNIQUE
);

-- ==========================================
-- factura

CREATE TABLE factura (
    id_factura INT IDENTITY(1,1) PRIMARY KEY,
    fecha_emision DATE NOT NULL
        CONSTRAINT df_factura_fecha_emision DEFAULT (CONVERT(DATE, GETDATE())),
    sub_total NUMERIC(12,2) NOT NULL,
    descuento_total NUMERIC(12,2) NOT NULL CONSTRAINT df_factura_descuento_total DEFAULT (0),
    impuestos_totales NUMERIC(12,2) NOT NULL CONSTRAINT df_factura_impuestos_totales DEFAULT (0),
    monto_total NUMERIC(12,2) NOT NULL,
    estado_factura VARCHAR(20) NOT NULL
        CONSTRAINT df_factura_estado DEFAULT ('Pagada'),
    id_cita INT NOT NULL,
    id_forma_pago INT NULL,

    CONSTRAINT fk_factura_cita
        FOREIGN KEY (id_cita)
        REFERENCES cita(id_cita)
        ON DELETE NO ACTION,

    CONSTRAINT fk_factura_forma_pago
        FOREIGN KEY (id_forma_pago)
        REFERENCES forma_pago(id_forma_pago)
        ON DELETE NO ACTION,

    CONSTRAINT ck_factura_estado_pago
        CHECK (
            (estado_factura = 'Pendiente' AND id_forma_pago IS NULL)
            OR (estado_factura = 'Pagada' AND id_forma_pago IS NOT NULL)
        ),

    CONSTRAINT ck_subtotal CHECK (sub_total >= 0.00),
    CONSTRAINT ck_descuento CHECK (descuento_total >= 0.00),
    CONSTRAINT ck_monto CHECK (monto_total >= 0.00),
    CONSTRAINT ck_impuestos CHECK (impuestos_totales >= 0.00)
);

-- ==========================================
-- factura detallitos

CREATE TABLE detalle_factura (
    id_articulo INT NOT NULL,
    id_factura INT NOT NULL,
    cantidad INT NOT NULL,
    porcentaje_descuento NUMERIC(5,2) NOT NULL CONSTRAINT df_detalle_factura_porcentaje_descuento DEFAULT (0),
    precio_unitario_cobrado NUMERIC(10,2) NOT NULL, --esto se pone por si acaso los precios suben, que las facturas antiguas no se vean afectadas

    PRIMARY KEY (id_articulo, id_factura),

    CONSTRAINT fk_detalle_articulo
        FOREIGN KEY (id_articulo)
        REFERENCES articulo(id_articulo)
        ON DELETE NO ACTION,

    CONSTRAINT fk_detalle_factura
        FOREIGN KEY (id_factura)
        REFERENCES factura(id_factura)
        ON DELETE NO ACTION,

    CONSTRAINT ck_cantidad CHECK (cantidad > 0),
    CONSTRAINT ck_porcentaje_descuento CHECK (porcentaje_descuento BETWEEN 0 AND 100),
    CONSTRAINT ck_precio_unitario_cobrado CHECK (precio_unitario_cobrado >= 0.00)
);