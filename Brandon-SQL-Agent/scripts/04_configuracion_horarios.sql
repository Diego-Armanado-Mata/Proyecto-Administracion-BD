USE msdb;
GO

-- Horario del Job de mantenimiento
-- Ejecución diaria a las 2:00 a. m.

EXEC dbo.sp_add_jobschedule
    @job_name = N'Job_Mantenimiento_Veterinaria',
    @name = N'Horario_Mantenimiento_Diario',
    @enabled = 1,
    @freq_type = 4,
    @freq_interval = 1,
    @active_start_time = 020000;
GO

-- Horario del Job de respaldo
-- Ejecución diaria a las 3:00 a. m.

EXEC dbo.sp_add_jobschedule
    @job_name = N'Job_Backup_Veterinaria',
    @name = N'Horario_Backup_Diario',
    @enabled = 1,
    @freq_type = 4,
    @freq_interval = 1,
    @active_start_time = 030000;
GO