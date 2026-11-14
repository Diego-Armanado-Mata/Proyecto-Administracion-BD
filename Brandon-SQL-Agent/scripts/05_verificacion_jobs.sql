
USE msdb;
GO

-- 1. Consultar la última ejecución de cada Job

WITH UltimaEjecucion AS (
    SELECT
        j.name AS NombreJob,
        h.run_date AS Fecha,
        h.run_time AS Hora,
        h.run_duration AS Duracion,
        h.run_status AS CodigoEstado,
        h.message AS Mensaje,
        ROW_NUMBER() OVER (
            PARTITION BY j.job_id
            ORDER BY h.instance_id DESC
        ) AS NumeroFila
    FROM dbo.sysjobs AS j
    INNER JOIN dbo.sysjobhistory AS h
        ON j.job_id = h.job_id
    WHERE j.name IN (
        N'Job_Mantenimiento_Veterinaria',
        N'Job_Backup_Veterinaria'
    )
    AND h.step_id = 0
)

SELECT
    NombreJob,
    CASE CodigoEstado
        WHEN 0 THEN 'Fallido'
        WHEN 1 THEN 'Exitoso'
        WHEN 2 THEN 'Reintento'
        WHEN 3 THEN 'Cancelado'
        WHEN 4 THEN 'En progreso'
        ELSE 'Desconocido'
    END AS Estado,
    Fecha,
    Hora,
    Duracion,
    Mensaje
FROM UltimaEjecucion
WHERE NumeroFila = 1
ORDER BY NombreJob;
GO


-- 2. Verificar los horarios configurados

SELECT
    j.name AS NombreJob,
    s.name AS NombreHorario,
    CASE s.freq_type
        WHEN 4 THEN 'Diario'
        WHEN 8 THEN 'Semanal'
        ELSE 'Otro'
    END AS Frecuencia,
    STUFF(
        STUFF(
            RIGHT('000000' + CAST(s.active_start_time AS VARCHAR(6)), 6),
            3, 0, ':'
        ),
        6, 0, ':'
    ) AS HoraProgramada,
    CASE s.enabled
        WHEN 1 THEN 'Habilitado'
        ELSE 'Deshabilitado'
    END AS EstadoHorario
FROM dbo.sysjobs AS j
INNER JOIN dbo.sysjobschedules AS js
    ON j.job_id = js.job_id
INNER JOIN dbo.sysschedules AS s
    ON js.schedule_id = s.schedule_id
WHERE j.name IN (
    N'Job_Mantenimiento_Veterinaria',
    N'Job_Backup_Veterinaria'
);
GO


-- 3. Verificar la integridad del respaldo automático

RESTORE VERIFYONLY
FROM DISK = '/var/opt/mssql/data/VETERINARIA_Automatico.bak'
WITH CHECKSUM;
GO