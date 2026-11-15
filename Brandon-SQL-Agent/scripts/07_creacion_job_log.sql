USE msdb;
GO

-- Crear Job de respaldo del registro de transacciones
EXEC dbo.sp_add_job
    @job_name = N'Job_Backup_Log_Veterinaria',
    @enabled = 1,
    @description = N'Realiza respaldos del log de transacciones de VETERINARIA.';
GO

-- Agregar paso de respaldo del log
EXEC dbo.sp_add_jobstep
    @job_name = N'Job_Backup_Log_Veterinaria',
    @step_name = N'Respaldo_Log',
    @subsystem = N'TSQL',
    @database_name = N'master',
    @command = N'
        DECLARE @Fecha VARCHAR(20);
        DECLARE @Ruta NVARCHAR(500);

        SET @Fecha = CONVERT(VARCHAR(8), GETDATE(), 112)
                   + ''_''
                   + REPLACE(CONVERT(VARCHAR(8), GETDATE(), 108), '':'', '''');

        SET @Ruta = N''/backup/VETERINARIA_LOG_''
                    + @Fecha + N''.trn'';

        BACKUP LOG VETERINARIA
        TO DISK = @Ruta
        WITH CHECKSUM, COMPRESSION, STATS = 10;
    ',
    @on_success_action = 1,
    @on_fail_action = 2;
GO

-- Asociar el Job al servidor
EXEC dbo.sp_add_jobserver
    @job_name = N'Job_Backup_Log_Veterinaria';
GO