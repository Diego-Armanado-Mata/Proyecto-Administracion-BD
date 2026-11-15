USE VETERINARIA;
GO

-- Consulta el espacio utilizado actualmente por cada tabla incluyendo datos e indices
EXEC sp_MSforeachtable 'EXEC sp_spaceused ''?''';
GO


-- Obtiene la cantidad real de registros de cada tabla
SELECT
    t.name AS tabla,
    SUM(p.rows) AS registros
FROM sys.tables t
INNER JOIN sys.partitions p
    ON t.object_id = p.object_id
WHERE p.index_id IN (0, 1)
GROUP BY t.name
ORDER BY t.name;
GO


-- Tamaño general y espacio utilizado por la base 
EXEC sp_spaceused;
GO


-- Muestra los archivos de datos y log
-- junto con su tamaño y ubicacion
SELECT
    name AS nombre_archivo,
    type_desc AS tipo,
    size / 128.0 AS tamano_mb,
    physical_name AS ubicacion
FROM sys.database_files;
GO


-- Suma el tamaño definido para las columnas de cada tabla
-- este valor se usa como una estimacion teorica
SELECT
    t.name AS tabla,
    SUM(c.max_length) AS tamano_fila_bytes
FROM sys.tables t
INNER JOIN sys.columns c
    ON t.object_id = c.object_id
GROUP BY t.name
ORDER BY t.name;
GO



-- Calcula el tamaño estimado de una fila por tabla
;WITH tamanos AS (
    SELECT
        t.object_id,
        t.name AS tabla,
        SUM(c.max_length) AS tamano_fila_bytes
    FROM sys.tables t
    INNER JOIN sys.columns c
        ON t.object_id = c.object_id
    GROUP BY
        t.object_id,
        t.name
),
-- obtiene la cantidad real de registros
registros AS (
    SELECT
        object_id,
        SUM(rows) AS registros_actuales
    FROM sys.partitions
    WHERE index_id IN (0, 1)
    GROUP BY object_id
),
-- asigna el crecimiento segun el tipo de tabla
calculos AS (
    SELECT
        t.tabla,
        t.tamano_fila_bytes,
        r.registros_actuales,
        CASE
            -- tablas operativas
            -- crecimiento proyectado del 100 %
            WHEN t.tabla IN (
                'cita',
                'diagnostico',
                'tratamiento',
                'factura',
                'detalle_factura',
                'medicamento_tratamiento'
            )
            THEN 2.0
            -- tablas de crecimiento moderado
            -- crecimiento proyectado del 50 %

            WHEN t.tabla IN (
                'propietario',
                'mascota',
                'veterinario',
                'articulo'
            )
            THEN 1.5
            -- tablas de catalogo
            -- crecimiento proyectado del 10 %
            ELSE 1.1
        END AS factor_crecimiento
    FROM tamanos t
    INNER JOIN registros r
        ON t.object_id = r.object_id
)
-- aplica la formula de dimensionamiento y suma toda la base
SELECT
    SUM(
        (tamano_fila_bytes + 7) *
        CEILING(registros_actuales * factor_crecimiento)
    ) AS espacio_total_bytes,

    CAST(
        SUM(
            (tamano_fila_bytes + 7) *
            CEILING(registros_actuales * factor_crecimiento)
        ) / 1024.0
        AS DECIMAL(10,2)
    ) AS espacio_total_kb,

    CAST(
        SUM(
            (tamano_fila_bytes + 7) *
            CEILING(registros_actuales * factor_crecimiento)
        ) / 1024.0 / 1024.0
        AS DECIMAL(10,4)
    ) AS espacio_total_mb,

    -- NUEVO: espacio total aplicando el factor de indices 1.3
    CAST(
        SUM(
            (tamano_fila_bytes + 7) *
            CEILING(registros_actuales * factor_crecimiento)
        ) * 1.3
        AS DECIMAL(18,2)
    ) AS espacio_total_bytes_con_indices,

    CAST(
        SUM(
            (tamano_fila_bytes + 7) *
            CEILING(registros_actuales * factor_crecimiento)
        ) * 1.3 / 1024.0
        AS DECIMAL(18,2)
    ) AS espacio_total_kb_con_indices,

    CAST(
        SUM(
            (tamano_fila_bytes + 7) *
            CEILING(registros_actuales * factor_crecimiento)
        ) * 1.3 / 1024.0 / 1024.0
        AS DECIMAL(18,4)
    ) AS espacio_total_mb_con_indices

FROM calculos;
GO
