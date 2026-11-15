-- SQL Server procedimientos y triggers para base de datos VETERINARIA.
-- las reservacion es de citas generan una factura de $2.00, y las cancelaciones tardias generan una factura de $5.00.; 
USE VETERINARIA;
GO

CREATE OR ALTER FUNCTION dbo.fn_total_factura
(
    @id_factura INT
)
RETURNS NUMERIC(12,2)
AS
BEGIN
    DECLARE @total NUMERIC(12,2);

    SELECT @total = monto_total
    FROM dbo.factura
    WHERE id_factura = @id_factura;

    RETURN @total;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_historial_mascota
    @id_mascota INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        m.nombre AS mascota,
        c.fecha_cita,
        c.hora_cita,
        c.estado_cita,
        c.fecha_cancelacion,
        d.informe,
        t.dosis
    FROM dbo.mascota AS m
    INNER JOIN dbo.cita AS c
        ON c.id_mascota = m.id_mascota
    LEFT JOIN dbo.diagnostico AS d
        ON d.id_cita = c.id_cita
    LEFT JOIN dbo.tratamiento AS t
        ON t.id_cita = c.id_cita
    WHERE m.id_mascota = @id_mascota
    ORDER BY c.fecha_cita DESC, c.hora_cita DESC, t.id_tratamiento;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_reservar_cita
    @fecha_cita DATE,
    @hora_cita TIME,
    @id_mascota INT,
    @id_veterinario INT,
    @id_cita INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    SET @id_cita = NULL;

    INSERT INTO dbo.cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
    VALUES (@fecha_cita, @hora_cita, @id_mascota, @id_veterinario);

    SET @id_cita = CONVERT(INT, SCOPE_IDENTITY());

    SELECT
        c.id_cita,
        c.fecha_cita,
        c.hora_cita,
        f.id_factura AS id_factura_reserva,
        f.monto_total AS total_reserva
    FROM dbo.cita AS c
    INNER JOIN dbo.factura AS f
        ON f.id_cita = c.id_cita
    INNER JOIN dbo.detalle_factura AS df
        ON df.id_factura = f.id_factura
    INNER JOIN dbo.articulo AS a
        ON a.id_articulo = df.id_articulo
    WHERE c.id_cita = @id_cita
      AND a.nombre_articulo = 'Cargo por reserva';
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_cancelar_cita
    @id_cita INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @estado_cita VARCHAR(20);
    DECLARE @cargo_cancelacion NUMERIC(10,2) = 0;
    DECLARE @impuesto NUMERIC(12,2) = 0;

    BEGIN TRY
        BEGIN TRANSACTION;

        SELECT @estado_cita = estado_cita
        FROM dbo.cita WITH (UPDLOCK, HOLDLOCK)
        WHERE id_cita = @id_cita;

        IF @estado_cita IS NULL
            THROW 51001, 'La cita indicada no existe.', 1;

        IF @estado_cita <> 'Reservada'
            THROW 51002, 'Solo se pueden cancelar citas reservadas.', 1;

        UPDATE dbo.cita
        SET estado_cita = 'Cancelada',
            fecha_cancelacion = SYSDATETIME()
        WHERE id_cita = @id_cita
          AND estado_cita = 'Reservada';

        IF @@ROWCOUNT <> 1
            THROW 51004, 'La cita ya no esta disponible para cancelacion.', 1;

        SELECT
            @cargo_cancelacion = COALESCE(SUM(f.sub_total), 0),
            @impuesto = COALESCE(SUM(f.impuestos_totales), 0)
        FROM dbo.factura AS f
        WHERE f.id_cita = @id_cita
          AND EXISTS (
              SELECT 1
              FROM dbo.detalle_factura AS df
              INNER JOIN dbo.articulo AS a
                  ON a.id_articulo = df.id_articulo
              WHERE df.id_factura = f.id_factura
                AND a.nombre_articulo = 'Cargo por cancelacion tardia'
          );

        COMMIT TRANSACTION;

        SELECT
            @id_cita AS id_cita,
            @cargo_cancelacion AS cargo_cancelacion,
            @impuesto AS impuestos_cargo,
            @cargo_cancelacion + @impuesto AS total_cargo;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_registrar_pago
    @id_factura INT,
    @id_forma_pago INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        IF NOT EXISTS (
            SELECT 1
            FROM dbo.forma_pago
            WHERE id_forma_pago = @id_forma_pago
        )
            THROW 51005, 'La forma de pago indicada no existe.', 1;

        UPDATE dbo.factura
        SET estado_factura = 'Pagada',
            id_forma_pago = @id_forma_pago
        WHERE id_factura = @id_factura
          AND estado_factura = 'Pendiente';

        IF @@ROWCOUNT <> 1
            THROW 51006, 'La factura no existe o ya fue pagada.', 1;

        COMMIT TRANSACTION;

        SELECT id_factura, estado_factura, id_forma_pago, monto_total
        FROM dbo.factura
        WHERE id_factura = @id_factura;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH;
END;
GO

CREATE OR ALTER TRIGGER dbo.tr_cita_after_insert
ON dbo.cita
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @articulo_reserva INT;
    DECLARE @cargo_reserva NUMERIC(10,2);

    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        WHERE i.estado_cita <> 'Reservada'
    )
        THROW 51010, 'Las citas nuevas deben iniciar en estado Reservada.', 1;

    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        WHERE CONVERT(
            DATETIME2(0),
            CONVERT(CHAR(10), i.fecha_cita, 23) + ' ' + CONVERT(CHAR(8), i.hora_cita, 108)
        ) < SYSDATETIME()
    )
        THROW 51011, 'No se pueden reservar citas en el pasado.', 1;

    SELECT
        @articulo_reserva = id_articulo,
        @cargo_reserva = precio_unitario
    FROM dbo.articulo
    WHERE nombre_articulo = 'Cargo por reserva';

    IF @articulo_reserva IS NULL
        THROW 51012, 'Falta configurar el articulo de reserva.', 1;

    -- DML invoices use a 13% tax rate; keep the automatically billed fee consistent.
    INSERT INTO dbo.factura
    (
        fecha_emision,
        sub_total,
        descuento_total,
        impuestos_totales,
        monto_total,
        estado_factura,
        id_cita,
        id_forma_pago
    )
    SELECT
        CONVERT(DATE, SYSDATETIME()),
        @cargo_reserva,
        0,
        ROUND(@cargo_reserva * 0.13, 2),
        @cargo_reserva + ROUND(@cargo_reserva * 0.13, 2),
        'Pendiente',
        i.id_cita,
        NULL
    FROM inserted AS i;

    INSERT INTO dbo.detalle_factura
    (
        id_articulo,
        id_factura,
        cantidad,
        porcentaje_descuento,
        precio_unitario_cobrado
    )
    SELECT
        @articulo_reserva,
        f.id_factura,
        1,
        0,
        @cargo_reserva
    FROM inserted AS i
    INNER JOIN dbo.factura AS f
        ON f.id_cita = i.id_cita
       AND f.estado_factura = 'Pendiente';
END;
GO

CREATE OR ALTER TRIGGER dbo.tr_cita_after_update
ON dbo.cita
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @articulo_cancelacion INT;
    DECLARE @cargo_cancelacion NUMERIC(10,2);

    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        LEFT JOIN deleted AS d
            ON d.id_cita = i.id_cita
        WHERE i.estado_cita = 'Reservada'
          AND (
              d.id_cita IS NULL
              OR i.estado_cita <> d.estado_cita
              OR i.fecha_cita <> d.fecha_cita
              OR i.hora_cita <> d.hora_cita
              OR i.id_veterinario <> d.id_veterinario
          )
          AND CONVERT(
              DATETIME2(0),
              CONVERT(CHAR(10), i.fecha_cita, 23) + ' ' + CONVERT(CHAR(8), i.hora_cita, 108)
          ) < SYSDATETIME()
    )
        THROW 51013, 'No se pueden programar citas reservadas en el pasado.', 1;

    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        WHERE i.estado_cita = 'Completada'
          AND CONVERT(
              DATETIME2(0),
              CONVERT(CHAR(10), i.fecha_cita, 23) + ' ' + CONVERT(CHAR(8), i.hora_cita, 108)
          ) > SYSDATETIME()
    )
        THROW 51016, 'No se pueden completar citas cuya fecha aun no llega.', 1;

    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        INNER JOIN deleted AS d
            ON d.id_cita = i.id_cita
        WHERE (d.estado_cita = 'Cancelada' AND i.estado_cita <> 'Cancelada')
           OR (d.estado_cita <> 'Reservada' AND i.estado_cita = 'Cancelada')
    )
        THROW 51014, 'Solo se cancelan citas reservadas; las citas canceladas no se reactivan.', 1;

    IF NOT EXISTS (
        SELECT 1
        FROM inserted AS i
        INNER JOIN deleted AS d
            ON d.id_cita = i.id_cita
        WHERE d.estado_cita <> 'Cancelada'
          AND i.estado_cita = 'Cancelada'
    )
        RETURN;

    DECLARE @cancelaciones_tardias TABLE
    (
        id_cita INT PRIMARY KEY
    );

    INSERT INTO @cancelaciones_tardias(id_cita)
    SELECT i.id_cita
    FROM inserted AS i
    INNER JOIN deleted AS d
        ON d.id_cita = i.id_cita
    WHERE d.estado_cita <> 'Cancelada'
      AND i.estado_cita = 'Cancelada'
      AND CONVERT(
          DATETIME2(0),
          CONVERT(CHAR(10), i.fecha_cita, 23) + ' ' + CONVERT(CHAR(8), i.hora_cita, 108)
      ) < DATEADD(HOUR, 5, SYSDATETIME());

    IF NOT EXISTS (SELECT 1 FROM @cancelaciones_tardias)
        RETURN;

    SELECT
        @articulo_cancelacion = id_articulo,
        @cargo_cancelacion = precio_unitario
    FROM dbo.articulo
    WHERE nombre_articulo = 'Cargo por cancelacion tardia';

    IF @articulo_cancelacion IS NULL
        THROW 51015, 'Falta configurar el articulo de cancelacion tardia.', 1;

    DECLARE @facturas_cancelacion TABLE
    (
        id_factura INT NOT NULL,
        id_cita INT NOT NULL
    );
    DECLARE @impuesto NUMERIC(12,2) = ROUND(@cargo_cancelacion * 0.13, 2);

    INSERT INTO dbo.factura
    (
        fecha_emision,
        sub_total,
        descuento_total,
        impuestos_totales,
        monto_total,
        estado_factura,
        id_cita,
        id_forma_pago
    )
    OUTPUT inserted.id_factura, inserted.id_cita
        INTO @facturas_cancelacion(id_factura, id_cita)
    SELECT
        CONVERT(DATE, SYSDATETIME()),
        @cargo_cancelacion,
        0,
        @impuesto,
        @cargo_cancelacion + @impuesto,
        'Pendiente',
        c.id_cita,
        NULL
    FROM @cancelaciones_tardias AS c;

    INSERT INTO dbo.detalle_factura
    (
        id_articulo,
        id_factura,
        cantidad,
        porcentaje_descuento,
        precio_unitario_cobrado
    )
    SELECT
        @articulo_cancelacion,
        f.id_factura,
        1,
        0,
        @cargo_cancelacion
    FROM @facturas_cancelacion AS f;
END;
GO

-- Examples using the sample rows loaded by dml.sql:
SELECT dbo.fn_total_factura(1) AS monto_total;
GO

EXEC dbo.sp_historial_mascota @id_mascota = 1;
GO

-- To reserve an appointment, the trigger automatically creates the $2 booking invoice:
-- DECLARE @fecha_nueva DATE = DATEADD(DAY, 30, CONVERT(DATE, GETDATE()));
-- DECLARE @id_cita_nueva INT;
-- EXEC dbo.sp_reservar_cita
--     @fecha_cita = @fecha_nueva,
--     @hora_cita = '10:00',
--     @id_mascota = 1,
--     @id_veterinario = 1,
--     @id_cita = @id_cita_nueva OUTPUT;
-- SELECT @id_cita_nueva AS id_cita_nueva;
--
-- To cancel a reservation, the trigger adds a separate $5 invoice if fewer than 5 hours remain:
-- EXEC dbo.sp_cancelar_cita @id_cita = 141;
--
-- To settle a pending booking or late-cancellation invoice:
-- EXEC dbo.sp_registrar_pago @id_factura = 141, @id_forma_pago = 2;
