/*
    PROYECTO VETERINARIA
    SCRIPT: 05_seguridad.sql

    Propósito:
    Configurar los logins de SQL Server, usuarios, roles, esquemas,
    organización de tablas y permisos de acceso de VETERINARIA.

    Orden de ejecución:
    1. Ejecutar previamente el DDL que crea la base VETERINARIA
       y sus 15 tablas en el esquema dbo.
    2. Ejecutar este script con una cuenta administradora de SQL Server.

    Nota sobre las contraseñas:
    Las contraseñas incluidas son credenciales ficticias de demostración
    para el entorno académico. No deben reutilizarse en sistemas reales.
*/

------------------------------------------------------------
-- 1. CREACIÓN DE LOGINS A NIVEL DE INSTANCIA
------------------------------------------------------------

USE master;
GO

-- Logins de los usuarios principales.
CREATE LOGIN login_admin
WITH PASSWORD = 'Demo_Admin#2026_A1',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;

CREATE LOGIN login_recepcion
WITH PASSWORD = 'Demo_Recepcion#2026_R2',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;

CREATE LOGIN login_inventario
WITH PASSWORD = 'Demo_Inventario#2026_I3',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;

CREATE LOGIN login_facturacion
WITH PASSWORD = 'Demo_Facturacion#2026_F4',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;

CREATE LOGIN login_gerencia
WITH PASSWORD = 'Demo_Gerencia#2026_G5',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;

CREATE LOGIN login_admin_op
WITH PASSWORD = 'Demo_AdminOp#2026_O6',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;

-- Login destinado a la consulta de registros de auditoría.
CREATE LOGIN login_auditor
WITH PASSWORD = 'Demo_Auditor#2026_A7',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;
GO

-- Logins individuales de los veterinarios.
CREATE LOGIN login_veterinario01
WITH PASSWORD = 'Demo_Veterinario#2026_V01',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;

CREATE LOGIN login_veterinario02
WITH PASSWORD = 'Demo_Veterinario#2026_V02',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;

CREATE LOGIN login_veterinario03
WITH PASSWORD = 'Demo_Veterinario#2026_V03',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;

CREATE LOGIN login_veterinario04
WITH PASSWORD = 'Demo_Veterinario#2026_V04',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;

CREATE LOGIN login_veterinario05
WITH PASSWORD = 'Demo_Veterinario#2026_V05',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;

CREATE LOGIN login_veterinario06
WITH PASSWORD = 'Demo_Veterinario#2026_V06',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;

CREATE LOGIN login_veterinario07
WITH PASSWORD = 'Demo_Veterinario#2026_V07',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;

CREATE LOGIN login_veterinario08
WITH PASSWORD = 'Demo_Veterinario#2026_V08',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;

CREATE LOGIN login_veterinario09
WITH PASSWORD = 'Demo_Veterinario#2026_V09',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;

CREATE LOGIN login_veterinario10
WITH PASSWORD = 'Demo_Veterinario#2026_V10',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;

CREATE LOGIN login_veterinario11
WITH PASSWORD = 'Demo_Veterinario#2026_V11',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;
GO

------------------------------------------------------------
-- 2. CREACIÓN DEL ROL DE AUDITORÍA DE SERVIDOR
------------------------------------------------------------

-- El rol de auditoría es independiente de los roles de VETERINARIA.
CREATE SERVER ROLE rol_auditor_bd;
GO

-- Asignación del login al rol de auditoría.
ALTER SERVER ROLE rol_auditor_bd
ADD MEMBER login_auditor;
GO

-- Permite consultar los registros de auditoría del servidor.
GRANT VIEW SERVER SECURITY AUDIT TO rol_auditor_bd;
GO

-- Establece master como base de datos predeterminada.
ALTER LOGIN login_auditor
WITH DEFAULT_DATABASE = master;
GO

------------------------------------------------------------
-- 3. CREACIÓN DE USUARIOS DE LA BASE DE DATOS
------------------------------------------------------------

USE VETERINARIA;
GO

-- Usuarios principales vinculados con sus respectivos logins.
CREATE USER user_admin FOR LOGIN login_admin;
CREATE USER user_recepcion FOR LOGIN login_recepcion;
CREATE USER user_inventario FOR LOGIN login_inventario;
CREATE USER user_facturacion FOR LOGIN login_facturacion;
CREATE USER user_gerencia FOR LOGIN login_gerencia;
CREATE USER user_admin_op FOR LOGIN login_admin_op;
GO

-- Usuarios individuales de los veterinarios.
CREATE USER user_veterinario01 FOR LOGIN login_veterinario01;
CREATE USER user_veterinario02 FOR LOGIN login_veterinario02;
CREATE USER user_veterinario03 FOR LOGIN login_veterinario03;
CREATE USER user_veterinario04 FOR LOGIN login_veterinario04;
CREATE USER user_veterinario05 FOR LOGIN login_veterinario05;
CREATE USER user_veterinario06 FOR LOGIN login_veterinario06;
CREATE USER user_veterinario07 FOR LOGIN login_veterinario07;
CREATE USER user_veterinario08 FOR LOGIN login_veterinario08;
CREATE USER user_veterinario09 FOR LOGIN login_veterinario09;
CREATE USER user_veterinario10 FOR LOGIN login_veterinario10;
CREATE USER user_veterinario11 FOR LOGIN login_veterinario11;
GO

------------------------------------------------------------
-- 4. CREACIÓN DE ROLES FUNCIONALES DE LA BASE DE DATOS
------------------------------------------------------------

CREATE ROLE rol_administrador_bd;
CREATE ROLE rol_veterinario;
CREATE ROLE rol_recepcionista;
CREATE ROLE rol_inventario;
CREATE ROLE rol_facturacion;
CREATE ROLE rol_gerencia;
CREATE ROLE rol_administrador_operativo;
GO

------------------------------------------------------------
-- 5. ASIGNACIÓN DE USUARIOS A ROLES
------------------------------------------------------------

-- Asignación de los usuarios principales.
ALTER ROLE rol_administrador_bd ADD MEMBER user_admin;
ALTER ROLE rol_recepcionista ADD MEMBER user_recepcion;
ALTER ROLE rol_inventario ADD MEMBER user_inventario;
ALTER ROLE rol_facturacion ADD MEMBER user_facturacion;
ALTER ROLE rol_gerencia ADD MEMBER user_gerencia;
ALTER ROLE rol_administrador_operativo ADD MEMBER user_admin_op;
GO

-- Asignación de los once veterinarios al mismo rol funcional.
ALTER ROLE rol_veterinario ADD MEMBER user_veterinario01;
ALTER ROLE rol_veterinario ADD MEMBER user_veterinario02;
ALTER ROLE rol_veterinario ADD MEMBER user_veterinario03;
ALTER ROLE rol_veterinario ADD MEMBER user_veterinario04;
ALTER ROLE rol_veterinario ADD MEMBER user_veterinario05;
ALTER ROLE rol_veterinario ADD MEMBER user_veterinario06;
ALTER ROLE rol_veterinario ADD MEMBER user_veterinario07;
ALTER ROLE rol_veterinario ADD MEMBER user_veterinario08;
ALTER ROLE rol_veterinario ADD MEMBER user_veterinario09;
ALTER ROLE rol_veterinario ADD MEMBER user_veterinario10;
ALTER ROLE rol_veterinario ADD MEMBER user_veterinario11;
GO

------------------------------------------------------------
-- 6. CREACIÓN DE ESQUEMAS FUNCIONALES
------------------------------------------------------------

CREATE SCHEMA Clinica;
GO

CREATE SCHEMA Recepcion;
GO

CREATE SCHEMA Inventario;
GO

CREATE SCHEMA Facturacion;
GO

------------------------------------------------------------
-- 7. ORGANIZACIÓN DE LAS TABLAS EN SUS ESQUEMAS
------------------------------------------------------------

-- Tablas correspondientes al área clínica.
ALTER SCHEMA Clinica TRANSFER dbo.veterinario;
ALTER SCHEMA Clinica TRANSFER dbo.especialidad;
ALTER SCHEMA Clinica TRANSFER dbo.diagnostico;
ALTER SCHEMA Clinica TRANSFER dbo.tratamiento;
ALTER SCHEMA Clinica TRANSFER dbo.medicamento_tratamiento;
GO

-- Tablas correspondientes al área de recepción.
ALTER SCHEMA Recepcion TRANSFER dbo.propietario;
ALTER SCHEMA Recepcion TRANSFER dbo.mascota;
ALTER SCHEMA Recepcion TRANSFER dbo.raza;
ALTER SCHEMA Recepcion TRANSFER dbo.especie;
ALTER SCHEMA Recepcion TRANSFER dbo.cita;
GO

-- Tablas correspondientes al área de inventario.
ALTER SCHEMA Inventario TRANSFER dbo.articulo;
ALTER SCHEMA Inventario TRANSFER dbo.tipo_articulo;
GO

-- Tablas correspondientes al área de facturación.
ALTER SCHEMA Facturacion TRANSFER dbo.factura;
ALTER SCHEMA Facturacion TRANSFER dbo.detalle_factura;
ALTER SCHEMA Facturacion TRANSFER dbo.forma_pago;
GO

------------------------------------------------------------
-- 8. PERMISOS DEL ROL VETERINARIO
------------------------------------------------------------

-- Consulta de veterinarios y especialidades.
GRANT SELECT ON OBJECT::Clinica.veterinario TO rol_veterinario;
GRANT SELECT ON OBJECT::Clinica.especialidad TO rol_veterinario;

-- Consulta, inserción y actualización de información clínica.
GRANT SELECT, INSERT, UPDATE ON OBJECT::Clinica.diagnostico TO rol_veterinario;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Clinica.tratamiento TO rol_veterinario;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Clinica.medicamento_tratamiento TO rol_veterinario;

-- Consulta, inserción y actualización de razas y especies.
GRANT SELECT, INSERT, UPDATE ON OBJECT::Recepcion.raza TO rol_veterinario;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Recepcion.especie TO rol_veterinario;
GO

------------------------------------------------------------
-- 9. PERMISOS DEL ROL RECEPCIONISTA
------------------------------------------------------------

-- Consulta, inserción y actualización de propietarios, mascotas y citas.
GRANT SELECT, INSERT, UPDATE ON OBJECT::Recepcion.propietario TO rol_recepcionista;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Recepcion.mascota TO rol_recepcionista;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Recepcion.cita TO rol_recepcionista;

-- Consulta de los catálogos de razas y especies.
GRANT SELECT ON OBJECT::Recepcion.raza TO rol_recepcionista;
GRANT SELECT ON OBJECT::Recepcion.especie TO rol_recepcionista;
GO

------------------------------------------------------------
-- 10. PERMISOS DEL ROL INVENTARIO
------------------------------------------------------------

-- Gestión de artículos, incluida su eliminación.
GRANT SELECT, INSERT, UPDATE, DELETE ON OBJECT::Inventario.articulo TO rol_inventario;

-- Consulta, inserción y actualización de tipos de artículo.
GRANT SELECT, INSERT, UPDATE ON OBJECT::Inventario.tipo_articulo TO rol_inventario;
GO

------------------------------------------------------------
-- 11. PERMISOS DEL ROL FACTURACIÓN
------------------------------------------------------------

-- Consulta, inserción y actualización de los registros de facturación.
GRANT SELECT, INSERT, UPDATE ON OBJECT::Facturacion.factura TO rol_facturacion;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Facturacion.detalle_factura TO rol_facturacion;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Facturacion.forma_pago TO rol_facturacion;
GO

------------------------------------------------------------
-- 12. PERMISOS DEL ROL GERENCIA
------------------------------------------------------------

-- Consulta de todas las tablas clínicas.
GRANT SELECT ON OBJECT::Clinica.veterinario TO rol_gerencia;
GRANT SELECT ON OBJECT::Clinica.especialidad TO rol_gerencia;
GRANT SELECT ON OBJECT::Clinica.diagnostico TO rol_gerencia;
GRANT SELECT ON OBJECT::Clinica.tratamiento TO rol_gerencia;
GRANT SELECT ON OBJECT::Clinica.medicamento_tratamiento TO rol_gerencia;

-- Consulta de todas las tablas de recepción.
GRANT SELECT ON OBJECT::Recepcion.propietario TO rol_gerencia;
GRANT SELECT ON OBJECT::Recepcion.mascota TO rol_gerencia;
GRANT SELECT ON OBJECT::Recepcion.raza TO rol_gerencia;
GRANT SELECT ON OBJECT::Recepcion.especie TO rol_gerencia;
GRANT SELECT ON OBJECT::Recepcion.cita TO rol_gerencia;

-- Consulta de todas las tablas de inventario.
GRANT SELECT ON OBJECT::Inventario.articulo TO rol_gerencia;
GRANT SELECT ON OBJECT::Inventario.tipo_articulo TO rol_gerencia;

-- Consulta de todas las tablas de facturación.
GRANT SELECT ON OBJECT::Facturacion.factura TO rol_gerencia;
GRANT SELECT ON OBJECT::Facturacion.detalle_factura TO rol_gerencia;
GRANT SELECT ON OBJECT::Facturacion.forma_pago TO rol_gerencia;
GO

------------------------------------------------------------
-- 13. PERMISOS DEL ROL ADMINISTRADOR OPERATIVO
------------------------------------------------------------

-- Gestión de veterinarios y especialidades, sin permiso de eliminación.
GRANT SELECT, INSERT, UPDATE ON OBJECT::Clinica.veterinario TO rol_administrador_operativo;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Clinica.especialidad TO rol_administrador_operativo;
GO

------------------------------------------------------------
-- 14. PERMISOS DEL ROL ADMINISTRADOR DE BASE DE DATOS
------------------------------------------------------------

-- Administración de usuarios y roles dentro de VETERINARIA.
GRANT CREATE USER TO rol_administrador_bd;
GRANT CREATE ROLE TO rol_administrador_bd;
GRANT ALTER ANY USER TO rol_administrador_bd;
GRANT ALTER ANY ROLE TO rol_administrador_bd;
GO

-- Consulta, inserción y actualización de las quince tablas,
-- con opción de delegar estos permisos a otros usuarios.
GRANT SELECT, INSERT, UPDATE ON OBJECT::Clinica.veterinario TO rol_administrador_bd WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Clinica.especialidad TO rol_administrador_bd WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Clinica.diagnostico TO rol_administrador_bd WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Clinica.tratamiento TO rol_administrador_bd WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Clinica.medicamento_tratamiento TO rol_administrador_bd WITH GRANT OPTION;

GRANT SELECT, INSERT, UPDATE ON OBJECT::Recepcion.propietario TO rol_administrador_bd WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Recepcion.mascota TO rol_administrador_bd WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Recepcion.raza TO rol_administrador_bd WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Recepcion.especie TO rol_administrador_bd WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Recepcion.cita TO rol_administrador_bd WITH GRANT OPTION;

GRANT SELECT, INSERT, UPDATE ON OBJECT::Inventario.articulo TO rol_administrador_bd WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Inventario.tipo_articulo TO rol_administrador_bd WITH GRANT OPTION;

GRANT SELECT, INSERT, UPDATE ON OBJECT::Facturacion.factura TO rol_administrador_bd WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Facturacion.detalle_factura TO rol_administrador_bd WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE ON OBJECT::Facturacion.forma_pago TO rol_administrador_bd WITH GRANT OPTION;

-- Eliminación únicamente sobre la tabla de artículos, con delegación.
GRANT DELETE ON OBJECT::Inventario.articulo TO rol_administrador_bd WITH GRANT OPTION;
GO

------------------------------------------------------------
-- 15. PERMISO DE ADMINISTRACIÓN DE LOGINS
------------------------------------------------------------

-- Permite al login administrador gestionar logins de la instancia.
USE master;
GO

GRANT ALTER ANY LOGIN TO login_admin;
GO

------------------------------------------------------------
-- 16. VERIFICACIONES FINALES
------------------------------------------------------------

USE VETERINARIA;
GO

-- Verifica los usuarios de la base de datos y sus logins asociados.
SELECT
    dp.name AS usuario,
    sp.name AS login_asociado,
    dp.type_desc AS tipo_usuario
FROM sys.database_principals AS dp
LEFT JOIN sys.server_principals AS sp
    ON dp.sid = sp.sid
WHERE dp.name IN (
    'user_admin',
    'user_recepcion',
    'user_inventario',
    'user_facturacion',
    'user_gerencia',
    'user_admin_op',
    'user_veterinario01',
    'user_veterinario02',
    'user_veterinario03',
    'user_veterinario04',
    'user_veterinario05',
    'user_veterinario06',
    'user_veterinario07',
    'user_veterinario08',
    'user_veterinario09',
    'user_veterinario10',
    'user_veterinario11'
)
ORDER BY dp.name;
GO

-- Verifica la pertenencia de los usuarios a los roles de base de datos.
SELECT
    r.name AS rol,
    u.name AS usuario
FROM sys.database_role_members AS rm
INNER JOIN sys.database_principals AS r
    ON rm.role_principal_id = r.principal_id
INNER JOIN sys.database_principals AS u
    ON rm.member_principal_id = u.principal_id
WHERE r.name IN (
    'rol_administrador_bd',
    'rol_veterinario',
    'rol_recepcionista',
    'rol_inventario',
    'rol_facturacion',
    'rol_gerencia',
    'rol_administrador_operativo'
)
ORDER BY r.name, u.name;
GO

-- Verifica la distribución de las quince tablas en los cuatro esquemas.
SELECT
    s.name AS esquema,
    t.name AS tabla
FROM sys.tables AS t
INNER JOIN sys.schemas AS s
    ON t.schema_id = s.schema_id
WHERE s.name IN ('Clinica', 'Recepcion', 'Inventario', 'Facturacion')
ORDER BY s.name, t.name;
GO

-- Verifica los permisos asignados directamente a los roles de base de datos.
SELECT
    dp.name AS rol,
    s.name AS esquema,
    o.name AS tabla,
    p.permission_name AS permiso,
    p.state_desc AS estado
FROM sys.database_permissions AS p
INNER JOIN sys.database_principals AS dp
    ON p.grantee_principal_id = dp.principal_id
INNER JOIN sys.objects AS o
    ON p.major_id = o.object_id
INNER JOIN sys.schemas AS s
    ON o.schema_id = s.schema_id
WHERE dp.name IN (
    'rol_administrador_bd',
    'rol_veterinario',
    'rol_recepcionista',
    'rol_inventario',
    'rol_facturacion',
    'rol_gerencia',
    'rol_administrador_operativo'
)
AND p.class_desc = 'OBJECT_OR_COLUMN'
ORDER BY dp.name, s.name, o.name, p.permission_name;
GO

-- Verifica el permiso de administración de logins del administrador.
USE master;
GO

SELECT
    sp.name AS login,
    p.permission_name AS permiso,
    p.state_desc AS estado
FROM sys.server_permissions AS p
INNER JOIN sys.server_principals AS sp
    ON p.grantee_principal_id = sp.principal_id
WHERE sp.name = 'login_admin'
  AND p.permission_name = 'ALTER ANY LOGIN';
GO

-- Verifica que login_auditor pertenezca al rol de auditoría.
SELECT
    sp.name AS login,
    sr.name AS rol_servidor
FROM sys.server_role_members AS srm
INNER JOIN sys.server_principals AS sr
    ON srm.role_principal_id = sr.principal_id
INNER JOIN sys.server_principals AS sp
    ON srm.member_principal_id = sp.principal_id
WHERE sr.name = 'rol_auditor_bd'
  AND sp.name = 'login_auditor';
GO

-- Verifica el permiso de consulta de auditoría asignado al rol.
SELECT
    sp.name AS rol_servidor,
    p.permission_name AS permiso,
    p.state_desc AS estado
FROM sys.server_permissions AS p
INNER JOIN sys.server_principals AS sp
    ON p.grantee_principal_id = sp.principal_id
WHERE sp.name = 'rol_auditor_bd'
  AND p.permission_name = 'VIEW SERVER SECURITY AUDIT';
GO
