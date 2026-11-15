USE VETERINARIA;
GO

-- Ingresos y comparacion mensual
-- Ingresos, variacion frente al periodo anterior disponible y acumulado.

;WITH ingresos_mensuales AS (
    select
        DATEFROMPARTS(YEAR(f.fecha_emision), MONTH(f.fecha_emision), 1) as mes,
        SUM(f.monto_total) as ingresos,
        COUNT(*) as facturas_pagadas
    from dbo.factura as f
    where f.estado_factura = 'Pagada'
    GROUP BY DATEFROMPARTS(YEAR(f.fecha_emision), MONTH(f.fecha_emision), 1)
)
SELECT
    actual.mes,
    actual.ingresos,
    actual.facturas_pagadas,
    anterior.ingresos as ingresos_mes_anterior,
    actual.ingresos - anterior.ingresos AS variacion_mes_anterior,
    SUM(actual.ingresos) OVER (order by actual.mes) AS ingresos_acumulados
FROM ingresos_mensuales AS actual
LEFT JOIN ingresos_mensuales AS anterior
    ON anterior.mes = DATEADD(MONTH, -1, actual.mes)
ORDER BY actual.mes;
GO

CREATE NONCLUSTERED INDEX IX_factura_estado_fecha_monto
ON dbo.factura (estado_factura, fecha_emision)
INCLUDE (monto_total);

-- DROP INDEX IF EXISTS IX_factura_estado_fecha_monto ON dbo.factura;


--Consulta 2: Desempeno mensual por veterinario.

;WITH citas_mensuales AS (
    SELECT
        c.id_veterinario,
        DATEFROMPARTS(YEAR(c.fecha_cita), MONTH(c.fecha_cita), 1) AS mes,
        COUNT_BIG(*) AS citas_totales,
        COUNT_BIG(CASE WHEN c.estado_cita = 'Completada' THEN 1 END) AS citas_completadas,
        COUNT_BIG(CASE WHEN c.estado_cita = 'Cancelada' THEN 1 END) AS citas_canceladas
    FROM dbo.cita AS c
    GROUP BY
        c.id_veterinario,
        DATEFROMPARTS(YEAR(c.fecha_cita), MONTH(c.fecha_cita), 1)
)
SELECT
    actual.id_veterinario,
    v.nombres,
    v.apellidos,
    actual.mes,
    actual.citas_totales,
    actual.citas_completadas,
    actual.citas_canceladas,
    CAST(100.0 * actual.citas_completadas / NULLIF(actual.citas_totales, 0) AS DECIMAL(5, 2)) AS porcentaje_completadas,
    CAST(100.0 * actual.citas_canceladas / NULLIF(actual.citas_totales, 0) AS DECIMAL(5, 2)) AS porcentaje_canceladas,
    anterior.citas_totales AS citas_mes_anterior,
    SUM(actual.citas_completadas) OVER (
        PARTITION BY actual.id_veterinario
        ORDER BY actual.mes
    ) AS completadas_acumuladas
FROM citas_mensuales AS actual
INNER JOIN dbo.veterinario AS v
    ON v.id_veterinario = actual.id_veterinario
LEFT JOIN citas_mensuales AS anterior
    ON anterior.id_veterinario = actual.id_veterinario
   AND anterior.mes = DATEADD(month, -1, actual.mes)
ORDER BY actual.id_veterinario, actual.mes;
GO

CREATE NONCLUSTERED INDEX IX_cita_veterinario_fecha_estado
ON dbo.cita (id_veterinario, fecha_cita)
INCLUDE (estado_cita);

-- drop index if exists IX_cita_veterinario_fecha_estado on dbo.cita;


--Consulta 3: Articulos (medicamentos) mas recetados por especie.

;WITH articulos_recetados AS (
    SELECT
        a.id_articulo,
        a.nombre_articulo,
        e.id_especie,
        e.nombre_especie,
        COUNT_BIG(*) AS veces_recetado
    FROM dbo.medicamento_tratamiento AS mt
    INNER JOIN dbo.articulo AS a ON mt.id_articulo = a.id_articulo
    INNER JOIN dbo.tratamiento AS t ON mt.id_tratamiento = t.id_tratamiento
    INNER JOIN dbo.cita AS c ON t.id_cita = c.id_cita
    INNER JOIN dbo.mascota AS m ON c.id_mascota = m.id_mascota
    INNER JOIN dbo.especie AS e ON m.id_especie = e.id_especie
    GROUP BY a.id_articulo, a.nombre_articulo, e.id_especie, e.nombre_especie
),
ranking_articulos AS (
    SELECT
        ar.id_articulo,
        ar.nombre_articulo,
        ar.id_especie,
        ar.nombre_especie,
        ar.veces_recetado,
        RANK() OVER (PARTITION BY ar.id_especie ORDER BY ar.veces_recetado DESC) AS ranking_por_especie
    FROM articulos_recetados AS ar
)
SELECT 
    id_articulo,
    nombre_articulo,
    id_especie,
    nombre_especie,
    veces_recetado
FROM ranking_articulos
WHERE ranking_por_especie = 1;

-- 1. Índice principal para la tabla de unión (medicamento_tratamiento)
CREATE NONCLUSTERED INDEX IX_medicamento_tratamiento_articulo_tratamiento
ON dbo.medicamento_tratamiento (id_tratamiento)
INCLUDE (id_articulo);

-- 2. Índice para conectar tratamientos con citas
CREATE NONCLUSTERED INDEX IX_tratamiento_cita_id
ON dbo.tratamiento (id_tratamiento)
INCLUDE (id_cita);

-- 3. Índice para conectar citas con mascotas
CREATE NONCLUSTERED INDEX IX_cita_mascota_id
ON dbo.cita (id_cita)
INCLUDE (id_mascota);

-- 4. Índice para conectar mascotas con su respectiva especie
CREATE NONCLUSTERED INDEX IX_mascota_especie_id
ON dbo.mascota (id_mascota)
INCLUDE (id_especie);

--drop index if exists IX_medicamento_tratamiento_articulo_tratamiento on dbo.medicamento_tratamiento;
--drop index if exists IX_tratamiento_cita_id on dbo.tratamiento;
--drop index if exists IX_cita_mascota_id on dbo.cita;
--drop index if exists IX_mascota_especie_id on dbo.mascota;