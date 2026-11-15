
USE msdb;
GO

-- 1. Estado de la base de datos y hora del servidor.
SELECT name AS BaseDeDatos,
       state_desc AS Estado,
       recovery_model_desc AS ModeloRecuperacion
FROM sys.databases
WHERE name = N'VETERINARIA';

SELECT SYSDATETIME() AS HoraServidor,
       SYSDATETIMEOFFSET() AS HoraServidorConZona,
       GETUTCDATE() AS HoraUTC;
GO

-- 2. Existencia y habilitacion de los cuatro Jobs.
WITH Esperados AS (
    SELECT N'Job_Mantenimiento_Veterinaria' AS NombreJob
    UNION ALL SELECT N'Job_Backup_Veterinaria'
    UNION ALL SELECT N'Job_Backup_Diferencial_Veterinaria'
    UNION ALL SELECT N'Job_Backup_Log_Veterinaria'
)
SELECT e.NombreJob,
       CASE WHEN j.job_id IS NULL THEN N'NO EXISTE' ELSE N'EXISTE' END AS Existencia,
       CASE WHEN j.job_id IS NULL THEN N'NO APLICA'
            WHEN j.enabled = 1 THEN N'HABILITADO' ELSE N'DESHABILITADO' END AS EstadoJob,
       j.description AS Descripcion
FROM Esperados AS e
LEFT JOIN dbo.sysjobs AS j ON j.name = e.NombreJob
ORDER BY e.NombreJob;
GO

-- 3. Pasos configurados en cada Job.
SELECT j.name AS NombreJob,
       st.step_id AS NumeroPaso,
       st.step_name AS NombrePaso,
       st.subsystem AS TipoPaso,
       st.database_name AS BaseContexto,
       st.command AS ComandoConfigurado
FROM dbo.sysjobs AS j
INNER JOIN dbo.sysjobsteps AS st ON st.job_id = j.job_id
WHERE j.name IN (N'Job_Mantenimiento_Veterinaria',
                 N'Job_Backup_Veterinaria',
                 N'Job_Backup_Diferencial_Veterinaria',
                 N'Job_Backup_Log_Veterinaria')
ORDER BY j.name, st.step_id;
GO

-- 4. Horarios configurados (los horarios se interpretan en la hora del servidor).
SELECT j.name AS NombreJob,
       s.name AS NombreHorario,
       CASE WHEN s.enabled = 1 THEN N'HABILITADO' ELSE N'DESHABILITADO' END AS EstadoHorario,
       CASE s.freq_type
            WHEN 4 THEN N'Diario'
            WHEN 8 THEN N'Semanal'
            ELSE CONCAT(N'Otro (', s.freq_type, N')') END AS TipoFrecuencia,
       s.freq_interval AS ValorDias,
       CASE
            WHEN s.freq_type = 8 AND s.freq_interval = 32 THEN N'Viernes'
            WHEN s.freq_type = 8 AND s.freq_interval = 95 THEN N'Sabado a jueves'
            WHEN s.freq_type = 4 THEN N'Todos los dias'
            ELSE N'Revisar mascara de dias' END AS DiasInterpretados,
       CASE WHEN s.freq_subday_type = 4
            THEN CONCAT(N'Cada ', s.freq_subday_interval, N' minutos')
            WHEN s.freq_subday_type = 1 THEN N'Una vez a la hora indicada'
            ELSE CONCAT(N'Subfrecuencia ', s.freq_subday_type) END AS Repeticion,
       STUFF(STUFF(RIGHT('000000' + CONVERT(VARCHAR(6), s.active_start_time), 6), 3, 0, ':'), 6, 0, ':') AS HoraInicio,
       STUFF(STUFF(RIGHT('000000' + CONVERT(VARCHAR(6), s.active_end_time), 6), 3, 0, ':'), 6, 0, ':') AS HoraFin
FROM dbo.sysjobs AS j
INNER JOIN dbo.sysjobschedules AS js ON js.job_id = j.job_id
INNER JOIN dbo.sysschedules AS s ON s.schedule_id = js.schedule_id
WHERE j.name IN (N'Job_Mantenimiento_Veterinaria',
                 N'Job_Backup_Veterinaria',
                 N'Job_Backup_Diferencial_Veterinaria',
                 N'Job_Backup_Log_Veterinaria')
ORDER BY j.name;
GO

-- 5. Ultimo resultado de ejecucion de cada Job

WITH UltimasEjecuciones AS (
    SELECT
        j.name AS NombreJob,
        h.run_status,
        h.run_date,
        h.run_time,
        h.run_duration,
        h.message,
        ROW_NUMBER() OVER (
            PARTITION BY j.job_id
            ORDER BY h.instance_id DESC
        ) AS NumeroFila
    FROM msdb.dbo.sysjobs AS j
    LEFT JOIN msdb.dbo.sysjobhistory AS h
        ON j.job_id = h.job_id
        AND h.step_id = 0
    WHERE j.name IN (
        N'Job_Mantenimiento_Veterinaria',
        N'Job_Backup_Veterinaria',
        N'Job_Backup_Diferencial_Veterinaria',
        N'Job_Backup_Log_Veterinaria'
    )
)
SELECT
    NombreJob,
    CASE
        WHEN run_status = 1 THEN 'EXITOSO'
        WHEN run_status = 0 THEN 'FALLIDO'
        WHEN run_status = 2 THEN 'REINTENTO'
        WHEN run_status = 3 THEN 'CANCELADO'
        ELSE 'SIN EJECUCIONES'
    END AS UltimoResultado,
    CASE
        WHEN run_date IS NOT NULL
        THEN msdb.dbo.agent_datetime(run_date, run_time)
        ELSE NULL
    END AS FechaHoraEjecucion,
    run_duration AS DuracionHHMMSS,
    message AS Mensaje
FROM UltimasEjecuciones
WHERE NumeroFila = 1
ORDER BY NombreJob;
GO

-- 6. Ultimas cinco ejecuciones por Job, para documentar exitos y errores.
WITH Historial AS (
    SELECT j.name AS NombreJob, h.run_status, h.run_date, h.run_time,
           h.run_duration, h.message,
           ROW_NUMBER() OVER (PARTITION BY j.job_id ORDER BY h.instance_id DESC) AS Fila
    FROM dbo.sysjobs AS j
    INNER JOIN dbo.sysjobhistory AS h ON h.job_id = j.job_id
    WHERE h.step_id = 0
      AND j.name IN (N'Job_Mantenimiento_Veterinaria',
                     N'Job_Backup_Veterinaria',
                     N'Job_Backup_Diferencial_Veterinaria',
                     N'Job_Backup_Log_Veterinaria')
)
SELECT NombreJob,
       msdb.dbo.agent_datetime(run_date, run_time) AS FechaHora,
       CASE run_status WHEN 1 THEN N'EXITOSO' WHEN 0 THEN N'FALLIDO'
                       WHEN 2 THEN N'REINTENTO' WHEN 3 THEN N'CANCELADO'
                       ELSE N'DESCONOCIDO' END AS Resultado,
       run_duration AS DuracionHHMMSS, message AS Mensaje
FROM Historial
WHERE Fila <= 5
ORDER BY NombreJob, FechaHora DESC;
GO

-- 7. Historial real de respaldos registrado en msdb.
--    D = completo, I = diferencial, L = log. No confundir con ejecucion programada:
--    un respaldo manual tambien aparece aqui.
SELECT TOP (30)
       bs.database_name AS BaseDeDatos,
       CASE bs.type WHEN 'D' THEN N'COMPLETO'
                    WHEN 'I' THEN N'DIFERENCIAL'
                    WHEN 'L' THEN N'LOG'
                    ELSE bs.type END AS TipoRespaldo,
       bs.backup_start_date AS Inicio,
       bs.backup_finish_date AS Finalizacion,
       bs.is_copy_only AS EsCopyOnly,
       CAST(bs.backup_size / 1048576.0 AS DECIMAL(18,2)) AS TamanoMB,
       bmf.physical_device_name AS RutaArchivo,
       bs.backup_set_id AS IdRespaldo
FROM dbo.backupset AS bs
LEFT JOIN dbo.backupmediafamily AS bmf ON bmf.media_set_id = bs.media_set_id
WHERE bs.database_name = N'VETERINARIA'
  AND bs.type IN ('D', 'I', 'L')
ORDER BY bs.backup_finish_date DESC, bs.backup_set_id DESC;
GO

-- 8. Comprobar archivos presentes en el directorio persistente /backup.
--    Requiere permisos para xp_dirtree.
EXEC master.dbo.xp_dirtree N'/backup', 1, 1;
GO

-- 9. Verificacion de la zona horaria del servidor

SELECT
    SYSDATETIME() AS HoraServidor,
    SYSDATETIMEOFFSET() AS HoraConZona,
    CURRENT_TIMEZONE() AS ZonaHoraria,
    GETUTCDATE() AS HoraUTC;
GO
