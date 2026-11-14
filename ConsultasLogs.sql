
USE VETERINARIA;
GO

-- 1 consultar todos los movimientos de la veterinaria
SELECT TOP 100
    event_time AS fecha_hora,
    server_principal_name AS usuario,
    database_name AS base_datos,
    schema_name AS esquema,
    object_name AS objeto,
    action_id AS operacion,
    succeeded AS exitoso,
    statement AS instruccion_sql
FROM sys.fn_get_audit_file(
    '/var/opt/mssql/data/*.sqlaudit',
    DEFAULT,
    DEFAULT
)
WHERE database_name = 'VETERINARIA'
ORDER BY event_time DESC;
GO

-- 2 consultar registros insertados modificados o eliminados
SELECT
    event_time AS fecha_hora,
    server_principal_name AS usuario,
    object_name AS tabla,
    CASE action_id
        WHEN 'IN' THEN 'INSERT'
        WHEN 'UP' THEN 'UPDATE'
        WHEN 'DL' THEN 'DELETE'
    END AS operacion,
    succeeded AS exitoso,
    statement AS instruccion_sql
FROM sys.fn_get_audit_file(
    '/var/opt/mssql/data/*.sqlaudit',
    DEFAULT,
    DEFAULT
)
WHERE database_name = 'VETERINARIA'
  AND action_id IN ('IN', 'UP', 'DL')
ORDER BY event_time DESC;
GO

-- 3 consultar cambios en la estructura de la base
SELECT
    event_time AS fecha_hora,
    server_principal_name AS usuario,
    object_name AS objeto,
    CASE action_id
        WHEN 'CR' THEN 'CREATE'
        WHEN 'AL' THEN 'ALTER'
        WHEN 'DR' THEN 'DROP'
        ELSE action_id
    END AS operacion,
    succeeded AS exitoso,
    statement AS instruccion_sql
FROM sys.fn_get_audit_file(
    '/var/opt/mssql/data/*.sqlaudit',
    DEFAULT,
    DEFAULT
)
WHERE database_name = 'VETERINARIA'
  AND action_id IN ('CR', 'AL', 'DR')
ORDER BY event_time DESC;
GO

-- 4 consultar los accesos al servidor
SELECT TOP 100
    event_time AS fecha_hora,
    server_principal_name AS usuario,
    CASE action_id
        WHEN 'LGIS' THEN 'inicio exitoso'
        WHEN 'LGIF' THEN 'inicio fallido'
    END AS tipo_acceso,
    succeeded AS exitoso,
    client_ip AS direccion_ip,
    application_name AS aplicacion
FROM sys.fn_get_audit_file(
    '/var/opt/mssql/data/*.sqlaudit',
    DEFAULT,
    DEFAULT
)
WHERE action_id IN ('LGIS', 'LGIF')
ORDER BY event_time DESC;
GO

-- 5 consultar operaciones que no tuvieron exito
SELECT
    event_time AS fecha_hora,
    server_principal_name AS usuario,
    database_name AS base_datos,
    object_name AS objeto,
    action_id AS operacion,
    statement AS instruccion_sql
FROM sys.fn_get_audit_file(
    '/var/opt/mssql/data/*.sqlaudit',
    DEFAULT,
    DEFAULT
)
WHERE succeeded = 0
  AND (
      database_name = 'VETERINARIA'
      OR action_id IN ('LGIS', 'LGIF')
  )
ORDER BY event_time DESC;
GO
