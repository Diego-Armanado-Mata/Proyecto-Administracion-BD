/*
Verificación de SQL Server Agent
Verificar la versión de SQL Server y comprobar
que SQL Server Agent se encuentra funcionando.
*/

SELECT
    SERVERPROPERTY('Edition') AS Edicion,
    SERVERPROPERTY('ProductVersion') AS VersionSQL,
    SERVERPROPERTY('EngineEdition') AS TipoMotor;
GO

SELECT
    servicename AS Servicio,
    status_desc AS Estado,
    startup_type_desc AS TipoInicio
FROM sys.dm_server_services
WHERE servicename LIKE '%SQL Server Agent%';
GO