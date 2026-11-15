-- dml inicial para veterinaria
-- ejecutar cuando las 15 tablas ya estan vacias y organizadas por esquemas
-- compatible con los triggers de cita existentes
-- datos de ejemplo para reportes, facturacion y seguimiento
USE VETERINARIA;
GO
SET XACT_ABORT ON;
SET NOCOUNT ON;

-- evitar cargar dos veces o cargar sobre una base con datos
IF EXISTS (SELECT 1 FROM Recepcion.especie)
   OR EXISTS (SELECT 1 FROM Recepcion.raza)
   OR EXISTS (SELECT 1 FROM Recepcion.propietario)
   OR EXISTS (SELECT 1 FROM Recepcion.mascota)
   OR EXISTS (SELECT 1 FROM Recepcion.cita)
   OR EXISTS (SELECT 1 FROM Clinica.especialidad)
   OR EXISTS (SELECT 1 FROM Clinica.veterinario)
   OR EXISTS (SELECT 1 FROM Clinica.diagnostico)
   OR EXISTS (SELECT 1 FROM Clinica.tratamiento)
   OR EXISTS (SELECT 1 FROM Clinica.medicamento_tratamiento)
   OR EXISTS (SELECT 1 FROM Inventario.tipo_articulo)
   OR EXISTS (SELECT 1 FROM Inventario.articulo)
   OR EXISTS (SELECT 1 FROM Facturacion.forma_pago)
   OR EXISTS (SELECT 1 FROM Facturacion.factura)
   OR EXISTS (SELECT 1 FROM Facturacion.detalle_factura)
BEGIN
    THROW 50001, 'El dml requiere una base vacia. No se modificaron datos.', 1;
END;
GO

BEGIN TRY
BEGIN TRANSACTION;

-- detener temporalmente los triggers de citas durante la carga historica
-- no cambia ni elimina la definicion de los triggers
IF EXISTS (SELECT 1 FROM sys.triggers WHERE name='tr_cita_after_insert' AND parent_id=OBJECT_ID('Recepcion.cita') AND is_disabled=0)
    DISABLE TRIGGER tr_cita_after_insert ON Recepcion.cita;
IF EXISTS (SELECT 1 FROM sys.triggers WHERE name='tr_cita_after_update' AND parent_id=OBJECT_ID('Recepcion.cita') AND is_disabled=0)
    DISABLE TRIGGER tr_cita_after_update ON Recepcion.cita;

-- reiniciar los contadores de las tablas vacias para conservar relaciones
DBCC CHECKIDENT ('Recepcion.especie', RESEED, 0) WITH NO_INFOMSGS;
DBCC CHECKIDENT ('Recepcion.raza', RESEED, 0) WITH NO_INFOMSGS;
DBCC CHECKIDENT ('Recepcion.propietario', RESEED, 0) WITH NO_INFOMSGS;
DBCC CHECKIDENT ('Recepcion.mascota', RESEED, 0) WITH NO_INFOMSGS;
DBCC CHECKIDENT ('Recepcion.cita', RESEED, 0) WITH NO_INFOMSGS;
DBCC CHECKIDENT ('Clinica.especialidad', RESEED, 0) WITH NO_INFOMSGS;
DBCC CHECKIDENT ('Clinica.veterinario', RESEED, 0) WITH NO_INFOMSGS;
DBCC CHECKIDENT ('Clinica.diagnostico', RESEED, 0) WITH NO_INFOMSGS;
DBCC CHECKIDENT ('Clinica.tratamiento', RESEED, 0) WITH NO_INFOMSGS;
DBCC CHECKIDENT ('Inventario.tipo_articulo', RESEED, 0) WITH NO_INFOMSGS;
DBCC CHECKIDENT ('Inventario.articulo', RESEED, 0) WITH NO_INFOMSGS;
DBCC CHECKIDENT ('Facturacion.forma_pago', RESEED, 0) WITH NO_INFOMSGS;
DBCC CHECKIDENT ('Facturacion.factura', RESEED, 0) WITH NO_INFOMSGS;

-- catalogos
INSERT INTO Recepcion.especie(nombre_especie) VALUES
('Perro'),('Gato'),('Conejo'),('Ave');

INSERT INTO Recepcion.raza(nombre_raza,id_especie) VALUES
('Mestizo',1),('Labrador',1),('Poodle',1),('Chihuahua',1),('Pastor aleman',1),
('Mestizo',2),('Siames',2),('Persa',2),('Angora',2),
('Enano',3),('Holandes',3),('Canario',4),('Periquito',4);

INSERT INTO Clinica.especialidad(nombre) VALUES
('Medicina general'),('Dermatologia'),('Cirugia'),('Medicina preventiva'),('Medicina felina');

INSERT INTO Clinica.veterinario(nombres,apellidos,carne,id_especialidad) VALUES
('Ana','Martinez','VET-001',1),('Carlos','Lopez','VET-002',2),
('Daniela','Rivera','VET-003',3),('Jose','Hernandez','VET-004',4),
('Sofia','Castro','VET-005',5);

INSERT INTO Inventario.tipo_articulo(tipo_nombre) VALUES ('Uso medico'),('Uso general');

INSERT INTO Inventario.articulo(nombre_articulo,precio_unitario,id_tipo_articulo) VALUES
('Cargo por reserva',2.00,2),
('Cargo por cancelacion tardia',5.00,2),
('Consulta veterinaria',18.00,1),
('Vacuna antirrabica',12.00,1),
('Desparasitante',8.50,1),
('Solucion para limpieza de oidos',6.50,1),
('Shampoo dermatologico',10.00,1),
('Vitaminas para mascota',9.00,1),
('Material para curacion',7.00,1),
('Analgesico veterinario',11.00,1),
('Collar para mascota',9.99,2),
('Cepillo para mascota',5.45,2),
('Alimento para mascota',14.00,2),
('Solucion salina esteril',4.50,1),
('Antibiotico veterinario',16.00,1),
('Solucion de rehidratacion',8.00,1),
('Colirio veterinario',9.50,1),
('Antiparasitario externo',12.50,1),
('Alimento gastrointestinal',19.00,1),
('Suplemento de fibra',7.00,1),
('Material de vendaje',6.00,1),
('Antiseptico veterinario',6.75,1),
('Suplemento para conejo',8.00,1),
('Suplemento para ave',7.50,1);

INSERT INTO Facturacion.forma_pago(nombre_forma_pago) VALUES
('Efectivo'),('Tarjeta'),('Transferencia');

-- propietarios de ejemplo
INSERT INTO Recepcion.propietario(nombre,apellido,telefono,correo,direccion) VALUES
('Maria','Garcia','70000001','maria.garcia@example.com','San Salvador'),
('Luis','Perez','70000002','luis.perez@example.com','Soyapango'),
('Andrea','Lopez','70000003','andrea.lopez@example.com','Santa Tecla'),
('Carlos','Hernandez','70000004','carlos.hernandez@example.com','Mejicanos'),
('Daniela','Martinez','70000005','daniela.martinez@example.com','Ilopango'),
('Jose','Ramirez','70000006','jose.ramirez@example.com','Apopa'),
('Sofia','Flores','70000007','sofia.flores@example.com','San Marcos'),
('Miguel','Castro','70000008','miguel.castro@example.com','Antiguo Cuscatlan'),
('Valeria','Ruiz','70000009','valeria.ruiz@example.com','San Salvador'),
('Fernando','Torres','70000010','fernando.torres@example.com','Soyapango'),
('Gabriela','Molina','70000011','gabriela.molina@example.com','Santa Tecla'),
('Ricardo','Diaz','70000012','ricardo.diaz@example.com','Mejicanos'),
('Paola','Reyes','70000013','paola.reyes@example.com','Ilopango'),
('Javier','Vargas','70000014','javier.vargas@example.com','Apopa'),
('Camila','Romero','70000015','camila.romero@example.com','San Marcos'),
('Diego','Morales','70000016','diego.morales@example.com','San Salvador'),
('Elena','Aguilar','70000017','elena.aguilar@example.com','Soyapango'),
('Oscar','Sanchez','70000018','oscar.sanchez@example.com','Santa Tecla'),
('Natalia','Cruz','70000019','natalia.cruz@example.com','Ilopango'),
('Roberto','Vega','70000020','roberto.vega@example.com','San Salvador');

-- mascotas con especies y razas compatibles
INSERT INTO Recepcion.mascota(nombre,edad,id_especie,id_raza,id_propietario) VALUES
('Luna',3,1,2,1),('Max',5,1,1,2),('Mia',2,2,7,3),('Rocky',6,1,5,4),
('Nala',4,2,6,5),('Toby',1,1,3,6),('Coco',2,3,10,7),('Simba',3,2,8,8),
('Kira',7,1,4,9),('Pelusa',2,2,9,10),('Bruno',4,1,2,11),('Milo',1,2,6,12),
('Nube',2,4,12,13),('Canela',5,1,1,14),('Lola',3,3,11,15),('Zeus',6,1,5,16),
('Olivia',2,2,7,17),('Paco',1,4,13,18),('Bobby',8,1,3,19),('Cleo',4,2,8,20),
('Daisy',2,1,4,1),('Chispa',3,1,1,2),('Tigre',5,2,6,3),('Nina',1,2,9,4),
('Copito',2,3,10,5),('Rex',4,1,5,6),('Kiwi',2,4,13,7),('Manchas',3,1,1,8),
('Gala',6,2,7,9),('Balu',2,1,2,10);

-- 500 citas: 380 completadas, 40 canceladas y 80 reservadas
-- se generan fechas pasadas y futuras para los reportes
-- la carga historica se hace sin disparar las reglas para citas nuevas
;WITH numeros AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM numeros WHERE n < 500
)
INSERT INTO Recepcion.cita
(fecha_cita,hora_cita,id_mascota,id_veterinario,estado_cita,fecha_cancelacion)
SELECT
    CASE WHEN n <= 420
         THEN DATEADD(DAY,-(1 + ((n-1)*2)),CONVERT(date,GETDATE()))
         ELSE DATEADD(DAY,1 + (n-421),CONVERT(date,GETDATE())) END,
    TIMEFROMPARTS(8 + ((n-1)%9),0,0,0,0),
    1 + ((n-1)%30),
    1 + ((n-1)%5),
    CASE WHEN n <= 380 THEN 'Completada'
         WHEN n <= 420 THEN 'Cancelada' ELSE 'Reservada' END,
    CASE WHEN n BETWEEN 381 AND 420
         THEN DATEADD(DAY,-(3 + ((n-1)*2)),CONVERT(datetime2(0),CONVERT(date,GETDATE())))
         ELSE NULL END
FROM numeros
OPTION (MAXRECURSION 500);

-- diagnosticos variados y adecuados a la especie
-- cada cita completada recibe un diagnostico relacionado con su tratamiento
INSERT INTO Clinica.diagnostico(informe,id_cita)
SELECT
    CASE m.id_especie
      WHEN 1 THEN CASE c.id_cita % 8
        WHEN 0 THEN 'Dermatitis superficial con picazon y enrojecimiento en la piel.'
        WHEN 1 THEN 'Gastroenteritis leve con diarrea, sin signos de deshidratacion grave.'
        WHEN 2 THEN 'Otitis externa con irritacion y acumulacion de cerumen.'
        WHEN 3 THEN 'Herida superficial en extremidad sin complicaciones.'
        WHEN 4 THEN 'Presencia de pulgas y rascado frecuente.'
        WHEN 5 THEN 'Revision preventiva y control de vacunacion.'
        WHEN 6 THEN 'Molestia articular leve; requiere control veterinario.'
        ELSE 'Revision general con peso y signos vitales dentro de lo esperado.' END
      WHEN 2 THEN CASE c.id_cita % 8
        WHEN 0 THEN 'Conjuntivitis leve con secrecion ocular.'
        WHEN 1 THEN 'Malestar digestivo con vomitos ocasionales.'
        WHEN 2 THEN 'Presencia de parasitos externos y prurito.'
        WHEN 3 THEN 'Dermatitis localizada por irritacion.'
        WHEN 4 THEN 'Deshidratacion leve; requiere seguimiento.'
        WHEN 5 THEN 'Revision preventiva y actualizacion de control sanitario.'
        WHEN 6 THEN 'Herida superficial por rasguño.'
        ELSE 'Revision general felina sin hallazgos importantes.' END
      WHEN 3 THEN CASE c.id_cita % 6
        WHEN 0 THEN 'Disminucion del apetito y cambios en las heces.'
        WHEN 1 THEN 'Irritacion leve de piel en extremidades.'
        WHEN 2 THEN 'Crecimiento dental que requiere evaluacion especializada.'
        WHEN 3 THEN 'Deshidratacion leve y baja ingesta de agua.'
        WHEN 4 THEN 'Revision preventiva de alimentacion y peso.'
        ELSE 'Molestia digestiva leve; seguimiento del transito intestinal.' END
      ELSE CASE c.id_cita % 6
        WHEN 0 THEN 'Plumaje opaco y necesidad de revision nutricional.'
        WHEN 1 THEN 'Irritacion leve de piel en zona de plumaje.'
        WHEN 2 THEN 'Cambios en apetito; requiere observacion.'
        WHEN 3 THEN 'Revision preventiva de pico, patas y plumaje.'
        WHEN 4 THEN 'Lesion superficial en pata sin sangrado activo.'
        ELSE 'Control general de ave con recomendaciones de manejo.' END
    END,
    c.id_cita
FROM Recepcion.cita c
JOIN Recepcion.mascota m ON m.id_mascota=c.id_mascota
WHERE c.estado_cita='Completada';

-- tratamientos con frecuencia y duracion cuando corresponde
-- el campo dosis admite maximo 100 caracteres
INSERT INTO Clinica.tratamiento(dosis,id_cita)
SELECT
    CASE m.id_especie
      WHEN 1 THEN CASE c.id_cita % 8
        WHEN 0 THEN 'Shampoo dermatologico cada 48 h por 10 dias; control al finalizar.'
        WHEN 1 THEN 'Dieta gastrointestinal 3 dias; rehidratacion y control en 48 h.'
        WHEN 2 THEN 'Solucion otica 1 vez al dia por 7 dias; reevaluar.'
        WHEN 3 THEN 'Limpieza con solucion salina cada 12 h por 5 dias; cubrir herida.'
        WHEN 4 THEN 'Antiparasitario externo segun peso; repetir segun ficha tecnica.'
        WHEN 5 THEN 'Vacunacion segun calendario y control preventivo en 6 meses.'
        WHEN 6 THEN 'Analgesico solo con receta; control veterinario en 72 h.'
        ELSE 'Control de peso, alimentacion y ejercicio; revision en 6 meses.' END
      WHEN 2 THEN CASE c.id_cita % 8
        WHEN 0 THEN 'Colirio prescrito cada 12 h por 5 dias; revisar evolucion.'
        WHEN 1 THEN 'Dieta gastrointestinal 3 dias y control de hidratacion cada 24 h.'
        WHEN 2 THEN 'Antiparasitario externo especifico para gatos; control en 30 dias.'
        WHEN 3 THEN 'Limpieza suave de piel 1 vez al dia por 7 dias.'
        WHEN 4 THEN 'Solucion de rehidratacion bajo supervision; control en 24 h.'
        WHEN 5 THEN 'Control preventivo y vacunacion segun calendario veterinario.'
        WHEN 6 THEN 'Limpieza con solucion salina cada 12 h por 5 dias.'
        ELSE 'Revision de peso, alimentacion y cuidados; control en 6 meses.' END
      WHEN 3 THEN CASE c.id_cita % 6
        WHEN 0 THEN 'Ajuste de heno y fibra; vigilar heces cada dia por 5 dias.'
        WHEN 1 THEN 'Limpieza suave con solucion salina 1 vez al dia por 5 dias.'
        WHEN 2 THEN 'Evaluacion dental especializada; no medicar sin indicacion.'
        WHEN 3 THEN 'Hidratacion supervisada y control de consumo cada 24 h.'
        WHEN 4 THEN 'Control de dieta rica en heno y peso; revision en 3 meses.'
        ELSE 'Aumentar fibra segun valoracion; control digestivo en 48 h.' END
      ELSE CASE c.id_cita % 6
        WHEN 0 THEN 'Suplemento nutricional indicado para aves; control en 14 dias.'
        WHEN 1 THEN 'Higiene de plumaje y entorno 1 vez al dia por 7 dias.'
        WHEN 2 THEN 'Control de alimentacion y agua; reevaluacion en 48 h.'
        WHEN 3 THEN 'Revision de dieta, jaula y plumaje; control en 6 meses.'
        WHEN 4 THEN 'Limpieza de pata con solucion salina cada 24 h por 5 dias.'
        ELSE 'Mejoras de manejo y alimentacion; control en 3 meses.' END
    END,
    c.id_cita
FROM Recepcion.cita c
JOIN Recepcion.mascota m ON m.id_mascota=c.id_mascota
WHERE c.estado_cita='Completada';

-- asociar articulos medicos coherentes con cada caso
INSERT INTO Clinica.medicamento_tratamiento(id_articulo,id_tratamiento)
SELECT a.id_articulo,t.id_tratamiento
FROM Clinica.tratamiento t
JOIN Recepcion.cita c ON c.id_cita=t.id_cita
JOIN Recepcion.mascota m ON m.id_mascota=c.id_mascota
JOIN Inventario.articulo a ON a.nombre_articulo =
    CASE m.id_especie
      WHEN 1 THEN CASE c.id_cita % 8
        WHEN 0 THEN 'Shampoo dermatologico' WHEN 1 THEN 'Alimento gastrointestinal'
        WHEN 2 THEN 'Solucion para limpieza de oidos' WHEN 3 THEN 'Solucion salina esteril'
        WHEN 4 THEN 'Antiparasitario externo' WHEN 5 THEN 'Vacuna antirrabica'
        WHEN 6 THEN 'Analgesico veterinario' ELSE 'Consulta veterinaria' END
      WHEN 2 THEN CASE c.id_cita % 8
        WHEN 0 THEN 'Colirio veterinario' WHEN 1 THEN 'Alimento gastrointestinal'
        WHEN 2 THEN 'Antiparasitario externo' WHEN 3 THEN 'Shampoo dermatologico'
        WHEN 4 THEN 'Solucion de rehidratacion' WHEN 5 THEN 'Consulta veterinaria'
        WHEN 6 THEN 'Solucion salina esteril' ELSE 'Consulta veterinaria' END
      WHEN 3 THEN CASE c.id_cita % 6
        WHEN 0 THEN 'Suplemento de fibra' WHEN 1 THEN 'Solucion salina esteril'
        WHEN 2 THEN 'Consulta veterinaria' WHEN 3 THEN 'Solucion de rehidratacion'
        WHEN 4 THEN 'Suplemento para conejo' ELSE 'Suplemento de fibra' END
      ELSE CASE c.id_cita % 6
        WHEN 0 THEN 'Suplemento para ave' WHEN 1 THEN 'Material para curacion'
        WHEN 2 THEN 'Suplemento para ave' WHEN 3 THEN 'Consulta veterinaria'
        WHEN 4 THEN 'Solucion salina esteril' ELSE 'Suplemento para ave' END
    END;

-- facturas iniciales con montos que se calcularan a partir de los detalles
-- no se inventan montos fijos para todas las atenciones
INSERT INTO Facturacion.factura
(fecha_emision,sub_total,descuento_total,impuestos_totales,monto_total,
 estado_factura,id_cita,id_forma_pago)
SELECT
    CASE WHEN c.estado_cita='Reservada' THEN CONVERT(date,GETDATE())
         ELSE c.fecha_cita END,
    0,0,0,0,
    CASE WHEN c.estado_cita='Completada' AND c.id_cita % 7 <> 0
         THEN 'Pagada' ELSE 'Pendiente' END,
    c.id_cita,
    CASE WHEN c.estado_cita='Completada' AND c.id_cita % 7 <> 0
         THEN 1 + (c.id_cita % 3) ELSE NULL END
FROM Recepcion.cita c;

-- todas las citas tienen un cargo de reserva
INSERT INTO Facturacion.detalle_factura
(id_articulo,id_factura,cantidad,porcentaje_descuento,precio_unitario_cobrado)
SELECT a.id_articulo,f.id_factura,1,0,a.precio_unitario
FROM Facturacion.factura f
JOIN Inventario.articulo a ON a.nombre_articulo='Cargo por reserva';

-- las atenciones completadas tienen una consulta veterinaria
-- se varia el precio cobrado segun el caso, sin modificar el catalogo
INSERT INTO Facturacion.detalle_factura
(id_articulo,id_factura,cantidad,porcentaje_descuento,precio_unitario_cobrado)
SELECT a.id_articulo,f.id_factura,1,
       CASE WHEN c.id_cita % 11=0 THEN 10 ELSE 0 END,
       CAST(18.00 + (c.id_cita % 5)*2.00 AS NUMERIC(10,2))
FROM Facturacion.factura f
JOIN Recepcion.cita c ON c.id_cita=f.id_cita
JOIN Inventario.articulo a ON a.nombre_articulo='Consulta veterinaria'
WHERE c.estado_cita='Completada';

-- agregar a la factura el articulo relacionado con el tratamiento
-- cuando el tratamiento es solo consulta no se repite el mismo articulo
INSERT INTO Facturacion.detalle_factura
(id_articulo,id_factura,cantidad,porcentaje_descuento,precio_unitario_cobrado)
SELECT mt.id_articulo,f.id_factura,
       CASE WHEN c.id_cita % 9=0 THEN 2 ELSE 1 END,
       CASE WHEN c.id_cita % 13=0 THEN 5 ELSE 0 END,
       a.precio_unitario
FROM Facturacion.factura f
JOIN Recepcion.cita c ON c.id_cita=f.id_cita
JOIN Clinica.tratamiento t ON t.id_cita=c.id_cita
JOIN Clinica.medicamento_tratamiento mt ON mt.id_tratamiento=t.id_tratamiento
JOIN Inventario.articulo a ON a.id_articulo=mt.id_articulo
WHERE c.estado_cita='Completada'
  AND a.nombre_articulo<>'Consulta veterinaria';

-- algunas cancelaciones tardias generan un cargo adicional
INSERT INTO Facturacion.detalle_factura
(id_articulo,id_factura,cantidad,porcentaje_descuento,precio_unitario_cobrado)
SELECT a.id_articulo,f.id_factura,1,0,a.precio_unitario
FROM Facturacion.factura f
JOIN Recepcion.cita c ON c.id_cita=f.id_cita
JOIN Inventario.articulo a ON a.nombre_articulo='Cargo por cancelacion tardia'
WHERE c.estado_cita='Cancelada' AND c.id_cita % 3=0;

-- calcular subtotal, descuento, iva del 13 por ciento y monto total
-- usando exactamente los importes registrados en detalle_factura
;WITH totales AS (
    SELECT df.id_factura,
           CAST(SUM(df.cantidad*df.precio_unitario_cobrado) AS NUMERIC(12,2)) AS subtotal,
           CAST(ROUND(SUM(df.cantidad*df.precio_unitario_cobrado
                  *df.porcentaje_descuento/100.0),2) AS NUMERIC(12,2)) AS descuento
    FROM Facturacion.detalle_factura df
    GROUP BY df.id_factura
)
UPDATE f
SET f.sub_total = t.subtotal,
    f.descuento_total = t.descuento,
    f.impuestos_totales = ROUND((t.subtotal-t.descuento)*0.13,2),
    f.monto_total = t.subtotal-t.descuento
                  + ROUND((t.subtotal-t.descuento)*0.13,2)
FROM Facturacion.factura f
JOIN totales t ON t.id_factura=f.id_factura;

-- volver a activar los triggers para las operaciones normales
IF EXISTS (SELECT 1 FROM sys.triggers WHERE name='tr_cita_after_insert' AND parent_id=OBJECT_ID('Recepcion.cita'))
    ENABLE TRIGGER tr_cita_after_insert ON Recepcion.cita;
IF EXISTS (SELECT 1 FROM sys.triggers WHERE name='tr_cita_after_update' AND parent_id=OBJECT_ID('Recepcion.cita'))
    ENABLE TRIGGER tr_cita_after_update ON Recepcion.cita;

COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    -- asegurarse de que las reglas queden activas incluso si hubo un error
    IF EXISTS (SELECT 1 FROM sys.triggers WHERE name='tr_cita_after_insert' AND parent_id=OBJECT_ID('Recepcion.cita'))
        ENABLE TRIGGER tr_cita_after_insert ON Recepcion.cita;
    IF EXISTS (SELECT 1 FROM sys.triggers WHERE name='tr_cita_after_update' AND parent_id=OBJECT_ID('Recepcion.cita'))
        ENABLE TRIGGER tr_cita_after_update ON Recepcion.cita;
    THROW;
END CATCH;
GO

-- revisar los registros cargados
SELECT 'especie' AS tabla,COUNT(*) AS registros FROM Recepcion.especie
UNION ALL SELECT 'raza',COUNT(*) FROM Recepcion.raza
UNION ALL SELECT 'especialidad',COUNT(*) FROM Clinica.especialidad
UNION ALL SELECT 'veterinario',COUNT(*) FROM Clinica.veterinario
UNION ALL SELECT 'tipo_articulo',COUNT(*) FROM Inventario.tipo_articulo
UNION ALL SELECT 'articulo',COUNT(*) FROM Inventario.articulo
UNION ALL SELECT 'forma_pago',COUNT(*) FROM Facturacion.forma_pago
UNION ALL SELECT 'propietario',COUNT(*) FROM Recepcion.propietario
UNION ALL SELECT 'mascota',COUNT(*) FROM Recepcion.mascota
UNION ALL SELECT 'cita',COUNT(*) FROM Recepcion.cita
UNION ALL SELECT 'diagnostico',COUNT(*) FROM Clinica.diagnostico
UNION ALL SELECT 'tratamiento',COUNT(*) FROM Clinica.tratamiento
UNION ALL SELECT 'medicamento_tratamiento',COUNT(*) FROM Clinica.medicamento_tratamiento
UNION ALL SELECT 'factura',COUNT(*) FROM Facturacion.factura
UNION ALL SELECT 'detalle_factura',COUNT(*) FROM Facturacion.detalle_factura;
GO

SELECT estado_cita,COUNT(*) AS cantidad FROM Recepcion.cita GROUP BY estado_cita;
SELECT estado_factura,COUNT(*) AS cantidad FROM Facturacion.factura GROUP BY estado_factura;
GO

-- comprobar que cada factura coincida con sus detalles
;WITH revision AS (
    SELECT f.id_factura, f.monto_total,
           CAST(ROUND(SUM(df.cantidad*df.precio_unitario_cobrado
                *(1-df.porcentaje_descuento/100.0))*1.13,2) AS NUMERIC(12,2)) AS calculado
    FROM Facturacion.factura f
    JOIN Facturacion.detalle_factura df ON df.id_factura=f.id_factura
    GROUP BY f.id_factura,f.monto_total
)
SELECT COUNT(*) AS facturas_con_diferencia
FROM revision WHERE ABS(monto_total-calculado)>0.01;
GO

SELECT TOP 20 f.id_factura,c.estado_cita,f.estado_factura,
       f.sub_total,f.descuento_total,f.impuestos_totales,f.monto_total
FROM Facturacion.factura f
JOIN Recepcion.cita c ON c.id_cita=f.id_cita
WHERE f.estado_factura='Pendiente'
ORDER BY f.monto_total DESC;
GO
