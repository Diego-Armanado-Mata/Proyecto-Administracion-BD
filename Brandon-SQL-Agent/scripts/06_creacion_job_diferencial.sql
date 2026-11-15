-- Respaldo diferencial: sábado a jueves a las 3:45 p. m.

EXEC dbo.sp_add_jobschedule
    @job_name = N'Job_Backup_Diferencial_Veterinaria',
    @name = N'Horario_Backup_Diferencial',
    @enabled = 1,
    @freq_type = 8,
    @freq_interval = 95,
    @freq_recurrence_factor = 1,
    @active_start_time = 154500;
GO