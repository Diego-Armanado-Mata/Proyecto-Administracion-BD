USE msdb;
GO

EXEC dbo.sp_add_job
    @job_name = N'Job_Backup_Veterinaria',
    @enabled = 1,
    @description = N'Realiza respaldos completos de VETERINARIA en un volumen persistente.';
GO

EXEC dbo.sp_add_jobstep
    @job_name = N'Job_Backup_Veterinaria',
    @step_name = N'Respaldo_Completo',
    @subsystem = N'TSQL',
    @database_name = N'master',
    @command = N'
        DECLARE @Fecha VARCHAR(20);
        DECLARE @Ruta NVARCHAR(500);

        SET @Fecha = CONVERT(VARCHAR(8), GETDATE(), 112)
                   + ''_''
                   + REPLACE(CONVERT(VARCHAR(8), GETDATE(), 108), '':'', '''');

        SET @Ruta = N''/backup/VETERINARIA_'' + @Fecha + N''.bak'';

        BACKUP DATABASE VETERINARIA
        TO DISK = @Ruta
        WITH CHECKSUM, COMPRESSION, STATS = 10;
    ',
    @on_success_action = 1,
    @on_fail_action = 2;
GO

EXEC dbo.sp_add_jobserver
    @job_name = N'Job_Backup_Veterinaria';
GO