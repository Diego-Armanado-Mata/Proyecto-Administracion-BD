USE msdb;
GO

EXEC dbo.sp_add_job
    @job_name = N'Job_Mantenimiento_Veterinaria',
    @enabled = 1,
    @description = N'Actualiza las estadisticas de la base de datos VETERINARIA.';
GO

EXEC dbo.sp_add_jobstep
    @job_name = N'Job_Mantenimiento_Veterinaria',
    @step_name = N'Actualizar_Estadisticas',
    @subsystem = N'TSQL',
    @database_name = N'VETERINARIA',
    @command = N'EXEC sp_updatestats;',
    @on_success_action = 1,
    @on_fail_action = 2;
GO

EXEC dbo.sp_add_jobserver
    @job_name = N'Job_Mantenimiento_Veterinaria';
GO