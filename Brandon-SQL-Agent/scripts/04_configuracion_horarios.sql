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
    @active_start_time = 080000;
GO

-- Respaldo completo: viernes a las 5:15 p. m.

EXEC dbo.sp_add_jobschedule
    @job_name = N'Job_Backup_Veterinaria',
    @name = N'Horario_Backup_Semanal',
    @enabled = 1,
    @freq_type = 8,
    @freq_interval = 32,
    @freq_recurrence_factor = 1,
    @active_start_time = 231500;
GO
-- Respaldo diferencial: sábado a jueves a las 3:45 p. m.

EXEC dbo.sp_add_jobschedule
    @job_name = N'Job_Backup_Diferencial_Veterinaria',
    @name = N'Horario_Backup_Diferencial',
    @enabled = 1,
    @freq_type = 8,
    @freq_interval = 95,
    @freq_recurrence_factor = 1,
    @active_start_time = 214500;
GO

-- Respaldo del log: cada 30 minutos, todos los días

EXEC dbo.sp_add_jobschedule
    @job_name = N'Job_Backup_Log_Veterinaria',
    @name = N'Horario_Backup_Log',
    @enabled = 1,
    @freq_type = 4,
    @freq_interval = 1,
    @freq_subday_type = 4,
    @freq_subday_interval = 30,
    @active_start_time = 000000,
    @active_end_time = 235959;
GO