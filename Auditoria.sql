
USE master;
GO

-- crear la auditoria principal si no existe
IF NOT EXISTS (
    SELECT 1
    FROM sys.server_audits
    WHERE name = 'Auditoria_Veterinaria'
)
BEGIN
    CREATE SERVER AUDIT Auditoria_Veterinaria
    TO FILE
    (
        FILEPATH = '/var/opt/mssql/data/',
        MAXSIZE = 100 MB,
        MAX_ROLLOVER_FILES = 10
    )
    WITH
    (
        QUEUE_DELAY = 1000,
        ON_FAILURE = CONTINUE
    );
END;
GO

-- activar la auditoria principal
IF EXISTS (
    SELECT 1
    FROM sys.server_audits
    WHERE name = 'Auditoria_Veterinaria'
      AND is_state_enabled = 0
)
BEGIN
    ALTER SERVER AUDIT Auditoria_Veterinaria
    WITH (STATE = ON);
END;
GO

-- crear la auditoria de accesos si no existe
IF NOT EXISTS (
    SELECT 1
    FROM sys.server_audit_specifications
    WHERE name = 'Auditoria_Accesos_Veterinaria'
)
BEGIN
    CREATE SERVER AUDIT SPECIFICATION Auditoria_Accesos_Veterinaria
    FOR SERVER AUDIT Auditoria_Veterinaria
        ADD (SUCCESSFUL_LOGIN_GROUP),
        ADD (FAILED_LOGIN_GROUP);
END;
GO

-- activar la auditoria de accesos
IF EXISTS (
    SELECT 1
    FROM sys.server_audit_specifications
    WHERE name = 'Auditoria_Accesos_Veterinaria'
      AND is_state_enabled = 0
)
BEGIN
    ALTER SERVER AUDIT SPECIFICATION Auditoria_Accesos_Veterinaria
    WITH (STATE = ON);
END;
GO

USE VETERINARIA;
GO

-- crear la auditoria de datos y estructura si no existe
IF NOT EXISTS (
    SELECT 1
    FROM sys.database_audit_specifications
    WHERE name = 'Auditoria_Datos_Veterinaria'
)
BEGIN
    CREATE DATABASE AUDIT SPECIFICATION Auditoria_Datos_Veterinaria
    FOR SERVER AUDIT Auditoria_Veterinaria
        ADD (INSERT ON DATABASE::VETERINARIA BY PUBLIC),
        ADD (UPDATE ON DATABASE::VETERINARIA BY PUBLIC),
        ADD (DELETE ON DATABASE::VETERINARIA BY PUBLIC),
        ADD (DATABASE_OBJECT_CHANGE_GROUP),
        ADD (SCHEMA_OBJECT_CHANGE_GROUP);
END;
GO

-- activar la auditoria de datos y estructura
IF EXISTS (
    SELECT 1
    FROM sys.database_audit_specifications
    WHERE name = 'Auditoria_Datos_Veterinaria'
      AND is_state_enabled = 0
)
BEGIN
    ALTER DATABASE AUDIT SPECIFICATION Auditoria_Datos_Veterinaria
    WITH (STATE = ON);
END;
GO

-- comprobar la auditoria principal
SELECT
    name AS auditoria,
    is_state_enabled AS activa
FROM sys.server_audits
WHERE name = 'Auditoria_Veterinaria';
GO

-- comprobar la auditoria de accesos
SELECT
    name AS auditoria,
    is_state_enabled AS activa
FROM sys.server_audit_specifications
WHERE name = 'Auditoria_Accesos_Veterinaria';
GO

-- comprobar la auditoria de datos
SELECT
    name AS auditoria,
    is_state_enabled AS activa
FROM sys.database_audit_specifications
WHERE name = 'Auditoria_Datos_Veterinaria';
GO
