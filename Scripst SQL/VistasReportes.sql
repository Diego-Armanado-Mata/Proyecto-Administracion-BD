
USE VETERINARIA;
GO

                -- REPORTES CLINICOS Y DE PACIENTES

-- REPORTE MEDICO
CREATE OR ALTER VIEW dbo.vw_reporte_medico AS
SELECT
    c.id_cita,
    c.fecha_cita,
    c.hora_cita,
    m.nombre AS mascota,
    e.nombre_especie AS especie,
    p.nombre + ' ' + p.apellido AS propietario,
    v.nombres + ' ' + v.apellidos AS veterinario,
    d.informe AS diagnostico,
    t.dosis AS tratamiento,
    a.nombre_articulo AS medicamento
FROM Recepcion.cita c
INNER JOIN Recepcion.mascota m
    ON c.id_mascota = m.id_mascota
INNER JOIN Recepcion.especie e
    ON m.id_especie = e.id_especie
INNER JOIN Recepcion.propietario p
    ON m.id_propietario = p.id_propietario
INNER JOIN Clinica.veterinario v
    ON c.id_veterinario = v.id_veterinario
LEFT JOIN Clinica.diagnostico d
    ON c.id_cita = d.id_cita
LEFT JOIN Clinica.tratamiento t
    ON c.id_cita = t.id_cita
LEFT JOIN Clinica.medicamento_tratamiento mt
    ON t.id_tratamiento = mt.id_tratamiento
LEFT JOIN Inventario.articulo a
    ON mt.id_articulo = a.id_articulo;
GO

SELECT *
FROM dbo.vw_reporte_medico
ORDER BY
    CASE WHEN diagnostico IS NULL THEN 1 ELSE 0 END,
    CASE WHEN tratamiento IS NULL THEN 1 ELSE 0 END,
    CASE WHEN medicamento IS NULL THEN 1 ELSE 0 END,
    fecha_cita DESC,
    hora_cita DESC;
GO


                   -- REPORTES DE GESTION Y OPERACIONES

-- REPORTE MENSUAL DE ATENCIONES
CREATE OR ALTER VIEW dbo.vw_reporte_atenciones_mensuales AS
SELECT
    YEAR(c.fecha_cita) AS anio,
    MONTH(c.fecha_cita) AS mes,

    COUNT(*) AS total_citas,

    SUM(CASE
        WHEN c.estado_cita = 'Completada' THEN 1
        ELSE 0
    END) AS citas_completadas,

    SUM(CASE
        WHEN c.estado_cita = 'Cancelada' THEN 1
        ELSE 0
    END) AS citas_canceladas,

    SUM(CASE
        WHEN c.estado_cita = 'Reservada' THEN 1
        ELSE 0
    END) AS citas_reservadas,

    COUNT(DISTINCT CASE
        WHEN c.estado_cita = 'Completada'
        THEN c.id_mascota
    END) AS mascotas_atendidas,

    COUNT(DISTINCT c.id_veterinario) AS veterinarios_participantes,

    CAST(
        100.0 * SUM(CASE
            WHEN c.estado_cita = 'Completada' THEN 1
            ELSE 0
        END) / NULLIF(COUNT(*), 0)
        AS DECIMAL(5,2)
    ) AS porcentaje_cumplimiento,

    CAST(
        100.0 * SUM(CASE
            WHEN c.estado_cita = 'Cancelada' THEN 1
            ELSE 0
        END) / NULLIF(COUNT(*), 0)
        AS DECIMAL(5,2)
    ) AS porcentaje_cancelacion

FROM Recepcion.cita c

GROUP BY
    YEAR(c.fecha_cita),
    MONTH(c.fecha_cita);
GO

SELECT *
FROM dbo.vw_reporte_atenciones_mensuales
ORDER BY anio, mes;
GO


-- AGENDA DE CITAS RESERVADAS
CREATE OR ALTER VIEW dbo.vw_agenda_citas AS
SELECT
    c.id_cita,
    c.fecha_cita,
    c.hora_cita,

    m.nombre AS mascota,
    e.nombre_especie AS especie,

    p.nombre + ' ' + p.apellido AS propietario,
    p.telefono AS telefono_contacto,

    c.estado_cita

FROM Recepcion.cita c

INNER JOIN Recepcion.mascota m
    ON c.id_mascota = m.id_mascota

INNER JOIN Recepcion.especie e
    ON m.id_especie = e.id_especie

INNER JOIN Recepcion.propietario p
    ON m.id_propietario = p.id_propietario

INNER JOIN Clinica.veterinario v
    ON c.id_veterinario = v.id_veterinario

WHERE c.estado_cita = 'Reservada';
GO

SELECT *
FROM dbo.vw_agenda_citas
ORDER BY fecha_cita, hora_cita;
GO


                 -- REPORTES FINANCIEROS Y ADMINISTRATIVOS

-- VISTA DE INGRESOS MENSUALES
CREATE OR ALTER VIEW dbo.vw_ingresos_mensuales AS
SELECT
    YEAR(f.fecha_emision) AS anio,
    MONTH(f.fecha_emision) AS mes,

    COUNT(f.id_factura) AS facturas_pagadas,

    SUM(f.monto_total) AS ingresos_cobrados,

    SUM(f.descuento_total) AS descuentos_aplicados,

    SUM(f.impuestos_totales) AS impuestos_registrados

FROM Facturacion.factura f

WHERE f.estado_factura = 'Pagada'

GROUP BY
    YEAR(f.fecha_emision),
    MONTH(f.fecha_emision);
GO

SELECT *
FROM dbo.vw_ingresos_mensuales
ORDER BY anio, mes;
GO


-- VISTA DE CUENTAS POR COBRAR
CREATE OR ALTER VIEW dbo.vw_cuentas_por_cobrar AS
SELECT
    f.id_factura,
    f.fecha_emision,
    f.estado_factura,

    p.id_propietario,
    p.nombre + ' ' + p.apellido AS propietario,
    p.telefono,
    p.correo,

    m.nombre AS mascota,
    e.nombre_especie AS especie,
    r.nombre_raza AS raza,

    c.id_cita,

    f.sub_total,
    f.descuento_total,
    f.impuestos_totales,
    f.monto_total AS monto_pendiente,

    DATEDIFF(DAY, f.fecha_emision, GETDATE()) AS dias_desde_emision

FROM Facturacion.factura f

INNER JOIN Recepcion.cita c
    ON f.id_cita = c.id_cita

INNER JOIN Recepcion.mascota m
    ON c.id_mascota = m.id_mascota

INNER JOIN Recepcion.especie e
    ON m.id_especie = e.id_especie

LEFT JOIN Recepcion.raza r
    ON m.id_raza = r.id_raza
    AND m.id_especie = r.id_especie

INNER JOIN Recepcion.propietario p
    ON m.id_propietario = p.id_propietario

WHERE f.estado_factura = 'Pendiente';
GO

SELECT *
FROM dbo.vw_cuentas_por_cobrar
ORDER BY
    CASE WHEN raza IS NULL THEN 1 ELSE 0 END,
    CASE WHEN telefono IS NULL THEN 1 ELSE 0 END,
    CASE WHEN correo IS NULL THEN 1 ELSE 0 END,
    dias_desde_emision DESC;
GO
