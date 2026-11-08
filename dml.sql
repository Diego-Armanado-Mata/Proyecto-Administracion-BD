--=======DML VETERINARIA=========

-- Run once after ddl.sql against an empty VETERINARIA database.
USE VETERINARIA;
GO

SET XACT_ABORT ON;
BEGIN TRANSACTION;

--Insert tipo_articulo
insert into tipo_articulo(tipo_nombre)
values ('Uso medico');
insert into tipo_articulo(tipo_nombre)
values('Uso general');

select * from tipo_articulo;
--fin insert tipo_articulo

--insert articulo
insert into articulo(nombre_articulo, precio_unitario,id_tipo_articulo)
values('Shampoo para perro', 1.50, 2);
insert into articulo(nombre_articulo, precio_unitario,id_tipo_articulo)
values('Correa para gato', 9.99, 2);
insert into articulo(nombre_articulo, precio_unitario,id_tipo_articulo)
values('Corta uñas para mascota', 3.30, 2);
insert into articulo(nombre_articulo, precio_unitario,id_tipo_articulo)
values('Cepillo para mascota', 5.45, 2);
insert into articulo(nombre_articulo, precio_unitario,id_tipo_articulo)
values('Dispensador de comida', 15.76, 2);
insert into articulo(nombre_articulo, precio_unitario,id_tipo_articulo)
values('Vacuna Parvovirus', 5.95, 1);
insert into articulo(nombre_articulo, precio_unitario,id_tipo_articulo)
values('Jeringa para mascotas', 0.85, 1);
insert into articulo(nombre_articulo, precio_unitario,id_tipo_articulo)
values('Collarín para gato', 11.10, 1);
insert into articulo(nombre_articulo, precio_unitario,id_tipo_articulo)
values('Camisa anti alergias', 60.34, 1);
insert into articulo(nombre_articulo, precio_unitario,id_tipo_articulo)
values('Vitaminas para mascota', 19.90, 1);
insert into articulo(nombre_articulo, precio_unitario,id_tipo_articulo)
values('Cargo por reserva', 2.00, 2);
insert into articulo(nombre_articulo, precio_unitario,id_tipo_articulo)
values('Cargo por cancelacion tardia', 5.00, 2);

select * from articulo;
-- fin insert articulo

-- insert forma_pago
insert into forma_pago(nombre_forma_pago)
values('Transferencia');
insert into forma_pago(nombre_forma_pago)
values('Efectivo');
insert into forma_pago(nombre_forma_pago)
values('POS');

select * from forma_pago;
--fin insert forma_pago

--insert especialidad
insert into especialidad(nombre)
values ('Cardiología');
insert into especialidad(nombre)
values ('Dermatología');
insert into especialidad(nombre)
values ('Oncología');
insert into especialidad(nombre)
values ('Medicina Interna');
insert into especialidad(nombre)
values ('Medicina Felina');

select * from especialidad;
--fin insert especialidad

--insert veterinario
insert into veterinario(nombres,apellidos,carne,id_especialidad)
values('Juan Jose', 'Castro Lopez', '00021345', 1);
insert into veterinario(nombres,apellidos,carne,id_especialidad) 
values('maria fernanda', 'gomez perez', '00021346', 2);
insert into veterinario(nombres,apellidos,carne,id_especialidad) 
values('carlos alberto', 'ramirez soto', '00021347', 3);
insert into veterinario(nombres,apellidos,carne,id_especialidad) 
values('ana lucia', 'martinez cruz', '00021348', 4);
insert into veterinario(nombres,apellidos,carne,id_especialidad) 
values('luis enrique', 'flores ruiz', '00021349', 5);
insert into veterinario(nombres,apellidos,carne,id_especialidad) 
values('elena isabel', 'diaz morales', '00021350', 1);
insert into veterinario(nombres,apellidos,carne,id_especialidad) 
values('pedro pablo', 'ortiz reyes', '00021351', 2);
insert into veterinario(nombres,apellidos,carne,id_especialidad) 
values('claudia beatriz', 'vargas luna', '00021352', 3);
insert into veterinario(nombres,apellidos,carne,id_especialidad) 
values('jorge mario', 'mendoza aguilar', '00021353', 4);
insert into veterinario(nombres,apellidos,carne,id_especialidad) 
values('sofia carolina', 'herrera blanco', '00021354', 5);
insert into veterinario(nombres,apellidos,carne,id_especialidad) 
values('miguel angel', 'castillo navarro', '00021355', 1);

select * from veterinario;
--fin insert veterinario

--insert especia
insert into especie(nombre_especie) 
values('perro');
insert into especie(nombre_especie) 
values('gato');
insert into especie(nombre_especie) 
values('conejo');
insert into especie(nombre_especie) 
values('caballo');
insert into especie(nombre_especie) 
values('vaca');
insert into especie(nombre_especie) 
values('cerdo');
insert into especie(nombre_especie) 
values('oveja');
insert into especie(nombre_especie) 
values('loro');
insert into especie(nombre_especie) 
values('iguana');
insert into especie(nombre_especie) 
values('hamster');

select * from especie;
--fin insert especie

--insert raza
insert into raza(nombre_raza,id_especie) 
values('pastor aleman', 1);
insert into raza(nombre_raza,id_especie) 
values('siames', 2);
insert into raza(nombre_raza,id_especie) 
values('cabeza de leon', 3);
insert into raza(nombre_raza,id_especie) 
values('pura sangre', 4);
insert into raza(nombre_raza,id_especie) 
values('holstein', 5);
insert into raza(nombre_raza,id_especie) 
values('duroc', 6);
insert into raza(nombre_raza,id_especie) 
values('merino', 7);
insert into raza(nombre_raza,id_especie) 
values('loro gris', 8);
insert into raza(nombre_raza,id_especie) 
values('iguana verde', 9);
insert into raza(nombre_raza,id_especie) 
values('hamster sirio', 10);

select * from raza;
--fin insert raza

-- insert propietario (120 registros)
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('ricardo', 'lopez', '77770001', 'ricardo@mail.com', 'san salvador');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('daniel', 'martinez', '77770002', 'daniel@mail.com', 'soyapango');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('israel', 'gomez', '77770003', 'israel@mail.com', 'ilopango');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('carlos', 'mata', '77770004', 'mata@mail.com', 'mejicanos');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('andrea', 'rivas', '77770005', 'andrea@mail.com', 'san salvador');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('luis', 'castillo', '77770006', 'luis@mail.com', 'santa tecla');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('marta', 'ramirez', '77770007', 'marta@mail.com', 'soyapango');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('jose', 'perez', '77770008', 'jose@mail.com', 'ilopango');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('ana', 'flores', '77770009', 'ana@mail.com', 'mejicanos');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('diego', 'cruz', '77770010', 'diego@mail.com', 'san salvador');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('sofia', 'ortiz', '77770011', 'sofia@mail.com', 'antiguo cuscatlan');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('gabriel', 'reyes', '77770012', 'gabriel@mail.com', 'san salvador');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('lucia', 'morales', '77770013', 'lucia@mail.com', 'soyapango');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('fernando', 'aguilar', '77770014', 'fernando@mail.com', 'mejicanos');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('valeria', 'mendoza', '77770015', 'valeria@mail.com', 'ilopango');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('jorge', 'vargas', '77770016', 'jorge@mail.com', 'san salvador');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('camila', 'romero', '77770017', 'camila@mail.com', 'santa tecla');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('miguel', 'blanco', '77770018', 'miguel@mail.com', 'soyapango');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('paola', 'herrera', '77770019', 'paola@mail.com', 'mejicanos');
insert into propietario(nombre, apellido, telefono, correo, direccion) 
values('roberto', 'navarro', '77770020', 'roberto@mail.com', 'san salvador');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('hugo', 'garcia', '77770101', 'hugo.garcia@mail.com', 'san salvador');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('pablo', 'fernandez', '77770102', 'pablo.f@mail.com', 'santa tecla');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('mateo', 'gonzalez', '77770103', 'mateo.g@mail.com', 'soyapango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('leonardo', 'rodriguez', '77770104', 'leonardo.r@mail.com', 'ilopango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('david', 'lopez', '77770105', 'david.l@mail.com', 'mejicanos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('alejandro', 'martinez', '77770106', 'alejandro.m@mail.com', 'antiguo cuscatlan');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('mario', 'perez', '77770107', 'mario.p@mail.com', 'apopa');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('nicolas', 'gomez', '77770108', 'nicolas.g@mail.com', 'san marcos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('samuel', 'sanchez', '77770109', 'samuel.s@mail.com', 'cuscatancingo');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('martin', 'diaz', '77770110', 'martin.d@mail.com', 'ayutuxtepeque');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('victor', 'torres', '77770111', 'victor.t@mail.com', 'san salvador');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('gonzalo', 'ruiz', '77770112', 'gonzalo.r@mail.com', 'santa tecla');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('marcos', 'ramirez', '77770113', 'marcos.r@mail.com', 'soyapango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('oscar', 'flores', '77770114', 'oscar.f@mail.com', 'ilopango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('jesus', 'acosta', '77770115', 'jesus.a@mail.com', 'mejicanos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('antonio', 'benitez', '77770116', 'antonio.b@mail.com', 'antiguo cuscatlan');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('jose', 'castro', '77770117', 'jose.c@mail.com', 'apopa');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('manuel', 'cruz', '77770118', 'manuel.c@mail.com', 'san marcos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('francisco', 'delgado', '77770119', 'francisco.d@mail.com', 'cuscatancingo');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('juan', 'espinoza', '77770120', 'juan.e@mail.com', 'ayutuxtepeque');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('pedro', 'fuentes', '77770121', 'pedro.f@mail.com', 'san salvador');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('luis', 'garrido', '77770122', 'luis.g@mail.com', 'santa tecla');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('javier', 'hernandez', '77770123', 'javier.h@mail.com', 'soyapango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('miguel', 'iglesias', '77770124', 'miguel.i@mail.com', 'ilopango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('angel', 'jimenez', '77770125', 'angel.j@mail.com', 'mejicanos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('carlos', 'juarez', '77770126', 'carlos.j@mail.com', 'antiguo cuscatlan');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('eduardo', 'lara', '77770127', 'eduardo.l@mail.com', 'apopa');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('rafael', 'medina', '77770128', 'rafael.m@mail.com', 'san marcos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('rodrigo', 'mendez', '77770129', 'rodrigo.m@mail.com', 'cuscatancingo');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('sergio', 'navarro', '77770130', 'sergio.n@mail.com', 'ayutuxtepeque');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('tomas', 'ortega', '77770131', 'tomas.o@mail.com', 'san salvador');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('fernando', 'pacheco', '77770132', 'fernando.p@mail.com', 'santa tecla');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('diego', 'quintero', '77770133', 'diego.q@mail.com', 'soyapango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('jorge', 'rojas', '77770134', 'jorge.r@mail.com', 'ilopango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('andres', 'salinas', '77770135', 'andres.s@mail.com', 'mejicanos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('ramon', 'tapia', '77770136', 'ramon.t@mail.com', 'antiguo cuscatlan');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('hector', 'uribe', '77770137', 'hector.u@mail.com', 'apopa');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('julio', 'valenzuela', '77770138', 'julio.v@mail.com', 'san marcos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('ruben', 'vargas', '77770139', 'ruben.v@mail.com', 'cuscatancingo');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('pascual', 'zavala', '77770140', 'pascual.z@mail.com', 'ayutuxtepeque');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('lucia', 'garcia', '77770141', 'lucia.g@mail.com', 'san salvador');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('maria', 'fernandez', '77770142', 'maria.f@mail.com', 'santa tecla');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('paula', 'gonzalez', '77770143', 'paula.g@mail.com', 'soyapango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('daniela', 'rodriguez', '77770144', 'daniela.r@mail.com', 'ilopango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('valeria', 'lopez', '77770145', 'valeria.l@mail.com', 'mejicanos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('alba', 'martinez', '77770146', 'alba.m@mail.com', 'antiguo cuscatlan');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('carmen', 'perez', '77770147', 'carmen.p@mail.com', 'apopa');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('claudia', 'gomez', '77770148', 'claudia.g@mail.com', 'san marcos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('elena', 'sanchez', '77770149', 'elena.s@mail.com', 'cuscatancingo');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('sara', 'diaz', '77770150', 'sara.d@mail.com', 'ayutuxtepeque');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('laura', 'torres', '77770151', 'laura.t@mail.com', 'san salvador');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('carlota', 'ruiz', '77770152', 'carlota.r@mail.com', 'santa tecla');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('irene', 'ramirez', '77770153', 'irene.r@mail.com', 'soyapango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('marta', 'flores', '77770154', 'marta.f@mail.com', 'ilopango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('julia', 'acosta', '77770155', 'julia.a@mail.com', 'mejicanos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('silvia', 'benitez', '77770156', 'silvia.b@mail.com', 'antiguo cuscatlan');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('ana', 'castro', '77770157', 'ana.c@mail.com', 'apopa');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('andrea', 'cruz', '77770158', 'andrea.c@mail.com', 'san marcos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('rocio', 'delgado', '77770159', 'rocio.d@mail.com', 'cuscatancingo');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('monica', 'espinoza', '77770160', 'monica.e@mail.com', 'ayutuxtepeque');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('teresa', 'fuentes', '77770161', 'teresa.f@mail.com', 'san salvador');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('raquel', 'garrido', '77770162', 'raquel.g@mail.com', 'santa tecla');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('beatriz', 'hernandez', '77770163', 'beatriz.h@mail.com', 'soyapango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('alicia', 'iglesias', '77770164', 'alicia.i@mail.com', 'ilopango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('patricia', 'jimenez', '77770165', 'patricia.j@mail.com', 'mejicanos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('natalia', 'juarez', '77770166', 'natalia.j@mail.com', 'antiguo cuscatlan');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('isabel', 'lara', '77770167', 'isabel.l@mail.com', 'apopa');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('victoria', 'medina', '77770168', 'victoria.m@mail.com', 'san marcos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('marina', 'mendez', '77770169', 'marina.m@mail.com', 'cuscatancingo');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('lorena', 'navarro', '77770170', 'lorena.n@mail.com', 'ayutuxtepeque');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('clara', 'ortega', '77770171', 'clara.o@mail.com', 'san salvador');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('blanca', 'pacheco', '77770172', 'blanca.p@mail.com', 'santa tecla');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('diana', 'quintero', '77770173', 'diana.q@mail.com', 'soyapango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('eva', 'rojas', '77770174', 'eva.r@mail.com', 'ilopango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('sofia', 'salinas', '77770175', 'sofia.s@mail.com', 'mejicanos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('miriam', 'tapia', '77770176', 'miriam.t@mail.com', 'antiguo cuscatlan');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('elsa', 'uribe', '77770177', 'elsa.u@mail.com', 'apopa');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('inmaculada', 'valenzuela', '77770178', 'inmaculada.v@mail.com', 'san marcos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('mercedes', 'vargas', '77770179', 'mercedes.v@mail.com', 'cuscatancingo');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('rosario', 'zavala', '77770180', 'rosario.z@mail.com', 'ayutuxtepeque');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('alberto', 'solis', '77770181', 'alberto.s@mail.com', 'san salvador');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('ernesto', 'mora', '77770182', 'ernesto.m@mail.com', 'santa tecla');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('roberto', 'avila', '77770183', 'roberto.a@mail.com', 'soyapango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('ignacio', 'miranda', '77770184', 'ignacio.m@mail.com', 'ilopango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('arturo', 'leiva', '77770185', 'arturo.l@mail.com', 'mejicanos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('felipe', 'cordova', '77770186', 'felipe.c@mail.com', 'antiguo cuscatlan');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('joaquin', 'barrios', '77770187', 'joaquin.b@mail.com', 'apopa');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('guillermo', 'araya', '77770188', 'guillermo.a@mail.com', 'san marcos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('emilio', 'segovia', '77770189', 'emilio.s@mail.com', 'cuscatancingo');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('julio', 'escobar', '77770190', 'julio.e@mail.com', 'ayutuxtepeque');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('tomas', 'montes', '77770191', 'tomas.m@mail.com', 'san salvador');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('ricardo', 'salazar', '77770192', 'ricardo.s@mail.com', 'santa tecla');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('humberto', 'aguirre', '77770193', 'humberto.a@mail.com', 'soyapango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('federico', 'castaneda', '77770194', 'federico.c@mail.com', 'ilopango');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('armando', 'cervantes', '77770195', 'armando.c@mail.com', 'mejicanos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('alfonso', 'vega', '77770196', 'alfonso.v@mail.com', 'antiguo cuscatlan');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('alonso', 'guerra', '77770197', 'alonso.g@mail.com', 'apopa');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('jaime', 'berrios', '77770198', 'jaime.b@mail.com', 'san marcos');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('mario', 'guzman', '77770199', 'mario.guz@mail.com', 'cuscatancingo');
insert into propietario(nombre, apellido, telefono, correo, direccion)
values('esteban', 'arias', '77770200', 'esteban.a@mail.com', 'ayutuxtepeque');

select * from propietario;
--fin insert propietario

--insert mascota (120 registros)
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('max', 3, 1, 1, 1);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('luna', 2, 2, 2, 2);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('copo', 1, 3, 3, 3);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('relampago', 5, 4, 4, 4);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('manchas', 4, 5, 5, 5);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('porky', 2, 6, 6, 6);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('nube', 3, 7, 7, 7);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('paco', 10, 8, 8, 8);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('godzilla', 4, 9, 9, 9);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('bolt', 1, 10, 10, 10);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('rocky', 6, 1, 1, 11);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('michi', 3, 2, 2, 12);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('tambor', 2, 3, 3, 13);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('spirit', 7, 4, 4, 14);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('lola', 5, 5, 5, 15);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('babe', 1, 6, 6, 16);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('dolly', 4, 7, 7, 17);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('rio', 15, 8, 8, 18);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('reptar', 3, 9, 9, 19);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('hammy', 1, 10, 10, 20);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('zeus', 4, 1, 1, 1);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('simba', 2, 2, 2, 2);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('orejas', 1, 3, 3, 3);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('tornado', 6, 4, 4, 4);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario) 
values('blanca', 3, 5, 5, 5);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('toby', 2, 1, 1, 1);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('fido', 4, 2, 2, 2);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('pelusa', 1, 3, 3, 3);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('rex', 5, 4, 4, 4);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('nala', 3, 5, 5, 5);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('kira', 2, 6, 6, 6);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('thor', 6, 7, 7, 7);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('loki', 1, 8, 8, 8);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('simba', 4, 9, 9, 9);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('miau', 2, 10, 10, 10);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('blanco', 3, 1, 1, 11);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('negro', 5, 2, 2, 12);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('pinto', 2, 3, 3, 13);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('manchas', 7, 4, 4, 14);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('bobby', 1, 5, 5, 15);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('rambo', 8, 6, 6, 16);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('choco', 3, 7, 7, 17);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('princesa', 4, 8, 8, 18);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('reina', 2, 9, 9, 19);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('rey', 6, 10, 10, 20);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('duque', 5, 1, 1, 21);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('rocky', 4, 2, 2, 22);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('zeus', 3, 3, 3, 23);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('apolo', 7, 4, 4, 24);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('titan', 2, 5, 5, 25);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('goliat', 9, 6, 6, 26);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('paco', 1, 7, 7, 27);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('pepe', 3, 8, 8, 28);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('coco', 4, 9, 9, 29);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('lola', 2, 10, 10, 30);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('mia', 5, 1, 1, 31);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('luna', 1, 2, 2, 32);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('estrella', 3, 3, 3, 33);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('sol', 6, 4, 4, 34);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('cometa', 4, 5, 5, 35);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('rayo', 2, 6, 6, 36);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('chispa', 7, 7, 7, 37);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('bella', 3, 8, 8, 38);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('canela', 5, 9, 9, 39);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('cafe', 2, 10, 10, 40);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('oso', 8, 1, 1, 41);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('lobo', 4, 2, 2, 42);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('zorro', 3, 3, 3, 43);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('tigre', 6, 4, 4, 44);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('leon', 2, 5, 5, 45);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('pecas', 1, 6, 6, 46);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('dante', 5, 7, 7, 47);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('bruno', 7, 8, 8, 48);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('max', 3, 9, 9, 49);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('milo', 4, 10, 10, 50);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('leo', 2, 1, 1, 51);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('jack', 6, 2, 2, 52);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('tomas', 1, 3, 3, 53);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('felix', 5, 4, 4, 54);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('silvestre', 3, 5, 5, 55);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('piolin', 4, 6, 6, 56);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('lucas', 2, 7, 7, 57);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('snoop', 7, 8, 8, 58);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('scooby', 8, 9, 9, 59);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('pluto', 3, 10, 10, 60);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('goofy', 5, 1, 1, 61);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('mickey', 2, 2, 2, 62);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('donald', 4, 3, 3, 63);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('daisy', 1, 4, 4, 64);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('minnie', 6, 5, 5, 65);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('chloe', 3, 6, 6, 66);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('zoe', 2, 7, 7, 67);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('sasha', 7, 8, 8, 68);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('roxy', 5, 9, 9, 69);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('ruby', 4, 10, 10, 70);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('perla', 2, 1, 1, 71);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('joya', 3, 2, 2, 72);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('bambi', 6, 3, 3, 73);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('dumbo', 1, 4, 4, 74);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('nemo', 4, 5, 5, 75);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('dory', 5, 6, 6, 76);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('marlin', 2, 7, 7, 77);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('simon', 7, 8, 8, 78);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('alvin', 3, 9, 9, 79);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('theodore', 4, 10, 10, 80);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('garfield', 6, 1, 1, 81);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('oddie', 2, 2, 2, 82);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('snoopy', 1, 3, 3, 83);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('charlie', 5, 4, 4, 84);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('lucy', 4, 5, 5, 85);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('linus', 3, 6, 6, 86);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('sally', 7, 7, 7, 87);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('schroeder', 2, 8, 8, 88);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('pajarito', 4, 9, 9, 89);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('lora', 6, 10, 10, 90);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('polly', 1, 1, 1, 91);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('kiko', 3, 2, 2, 92);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('chavo', 5, 3, 3, 93);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('peppa', 2, 4, 4, 94);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('rita', 4, 5, 5, 95);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('suzy', 7, 6, 6, 96);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('pinky', 6, 7, 7, 97);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('cerebro', 2, 8, 8, 98);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('animaniac', 3, 9, 9, 99);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('wacko', 5, 10, 10, 100);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('dot', 1, 1, 1, 101);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('yakko', 4, 2, 2, 102);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('bugs', 2, 3, 3, 103);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('daffy', 6, 4, 4, 104);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('taz', 3, 5, 5, 105);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('lola', 5, 6, 6, 106);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('bugs', 7, 7, 7, 107);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('porky', 2, 8, 8, 108);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('petunia', 4, 9, 9, 109);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('elmer', 1, 10, 10, 110);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('fudd', 3, 1, 1, 111);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('sam', 5, 2, 2, 112);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('gossamer', 2, 3, 3, 113);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('speedy', 6, 4, 4, 114);
insert into mascota(nombre, edad, id_especie, id_raza, id_propietario)
values('silvestre', 4, 5, 5, 115);

select * from mascota;
--fin insert mascota

--insert cita (120 registros)
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-20', '08:00:00', 1, 1);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-20', '09:00:00', 2, 2);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-21', '10:00:00', 3, 3);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-21', '11:00:00', 4, 4);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-22', '14:00:00', 5, 5);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-22', '15:00:00', 6, 6);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-23', '08:30:00', 7, 7);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-23', '09:30:00', 8, 8);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-24', '16:00:00', 9, 9);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-24', '17:00:00', 10, 10);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-25', '08:00:00', 11, 11);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-25', '10:30:00', 12, 1);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-26', '13:00:00', 13, 2);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-26', '14:30:00', 14, 3);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-27', '09:00:00', 15, 4);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-27', '11:15:00', 16, 5);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-28', '15:45:00', 17, 6);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-28', '16:30:00', 18, 7);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-29', '08:45:00', 19, 8);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-29', '10:00:00', 20, 9);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-30', '14:00:00', 21, 10);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-06-30', '15:30:00', 22, 11);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-07-01', '09:15:00', 23, 1);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-07-01', '11:45:00', 24, 2);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario) 
values('2026-07-02', '13:30:00', 25, 3);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-03', '08:00:00', 1, 1);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-03', '09:00:00', 2, 2);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-03', '09:30:00', 3, 3);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-03', '10:00:00', 4, 4);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-03', '11:00:00', 5, 5);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-03', '13:00:00', 6, 6);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-03', '14:00:00', 7, 7);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-03', '14:30:00', 8, 8);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-03', '15:00:00', 9, 9);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-03', '16:00:00', 10, 10);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-04', '08:00:00', 11, 11);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-04', '09:00:00', 12, 1);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-04', '09:30:00', 13, 2);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-04', '10:00:00', 14, 3);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-04', '11:00:00', 15, 4);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-04', '13:00:00', 16, 5);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-04', '14:00:00', 17, 6);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-04', '14:30:00', 18, 7);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-04', '15:00:00', 19, 8);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-04', '16:00:00', 20, 9);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-05', '08:00:00', 21, 10);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-05', '09:00:00', 22, 11);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-05', '09:30:00', 23, 1);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-05', '10:00:00', 24, 2);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-05', '11:00:00', 25, 3);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-05', '13:00:00', 26, 4);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-05', '14:00:00', 27, 5);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-05', '14:30:00', 28, 6);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-05', '15:00:00', 29, 7);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-05', '16:00:00', 30, 8);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-06', '08:00:00', 31, 9);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-06', '09:00:00', 32, 10);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-06', '09:30:00', 33, 11);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-06', '10:00:00', 34, 1);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-06', '11:00:00', 35, 2);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-06', '13:00:00', 36, 3);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-06', '14:00:00', 37, 4);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-06', '14:30:00', 38, 5);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-06', '15:00:00', 39, 6);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-06', '16:00:00', 40, 7);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-07', '08:00:00', 41, 8);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-07', '09:00:00', 42, 9);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-07', '09:30:00', 43, 10);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-07', '10:00:00', 44, 11);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-07', '11:00:00', 45, 1);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-07', '13:00:00', 46, 2);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-07', '14:00:00', 47, 3);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-07', '14:30:00', 48, 4);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-07', '15:00:00', 49, 5);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-07', '16:00:00', 50, 6);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-08', '08:00:00', 51, 7);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-08', '09:00:00', 52, 8);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-08', '09:30:00', 53, 9);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-08', '10:00:00', 54, 10);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-08', '11:00:00', 55, 11);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-08', '13:00:00', 56, 1);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-08', '14:00:00', 57, 2);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-08', '14:30:00', 58, 3);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-08', '15:00:00', 59, 4);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-08', '16:00:00', 60, 5);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-09', '08:00:00', 61, 6);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-09', '09:00:00', 62, 7);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-09', '09:30:00', 63, 8);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-09', '10:00:00', 64, 9);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-09', '11:00:00', 65, 10);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-09', '13:00:00', 66, 11);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-09', '14:00:00', 67, 1);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-09', '14:30:00', 68, 2);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-09', '15:00:00', 69, 3);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-09', '16:00:00', 70, 4);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-10', '08:00:00', 71, 5);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-10', '09:00:00', 72, 6);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-10', '09:30:00', 73, 7);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-10', '10:00:00', 74, 8);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-10', '11:00:00', 75, 9);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-10', '13:00:00', 76, 10);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-10', '14:00:00', 77, 11);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-10', '14:30:00', 78, 1);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-10', '15:00:00', 79, 2);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-10', '16:00:00', 80, 3);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-11', '08:00:00', 81, 4);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-11', '09:00:00', 82, 5);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-11', '09:30:00', 83, 6);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-11', '10:00:00', 84, 7);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-11', '11:00:00', 85, 8);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-11', '13:00:00', 86, 9);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-11', '14:00:00', 87, 10);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-11', '14:30:00', 88, 11);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-11', '15:00:00', 89, 1);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-11', '16:00:00', 90, 2);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-12', '08:00:00', 91, 3);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-12', '09:00:00', 92, 4);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-12', '09:30:00', 93, 5);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-12', '10:00:00', 94, 6);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-12', '11:00:00', 95, 7);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-12', '13:00:00', 96, 8);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-12', '14:00:00', 97, 9);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-12', '14:30:00', 98, 10);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-12', '15:00:00', 99, 11);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-12', '16:00:00', 100, 1);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-13', '08:00:00', 101, 2);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-13', '09:00:00', 102, 3);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-13', '09:30:00', 103, 4);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-13', '10:00:00', 104, 5);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-13', '11:00:00', 105, 6);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-13', '13:00:00', 106, 7);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-13', '14:00:00', 107, 8);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-13', '14:30:00', 108, 9);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-13', '15:00:00', 109, 10);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-13', '16:00:00', 110, 11);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-14', '08:00:00', 111, 1);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-14', '09:00:00', 112, 2);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-14', '09:30:00', 113, 3);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-14', '10:00:00', 114, 4);
insert into cita(fecha_cita, hora_cita, id_mascota, id_veterinario)
values('2026-07-14', '11:00:00', 115, 5);

select * from cita;
--fin insert cita;

-- Seeded appointments are historical and already have clinical and billing records.
UPDATE cita
SET estado_cita = 'Completada';

--insert tratamiento (120 registros)
insert into tratamiento(dosis, id_cita) 
values('vitaminas 1 vez al dia', 1);
insert into tratamiento(dosis, id_cita) 
values('antibiotico 5ml cada 12 horas', 2);
insert into tratamiento(dosis, id_cita) 
values('limpieza dental y analgesico', 3);
insert into tratamiento(dosis, id_cita)
values('reposo absoluto por 7 dias', 4);
insert into tratamiento(dosis, id_cita) 
values('pastilla desparasitante dosis unica', 5);
insert into tratamiento(dosis, id_cita) 
values('cambio a dieta baja en grasas', 6);
insert into tratamiento(dosis, id_cita) 
values('crema topica 2 veces al dia', 7);
insert into tratamiento(dosis, id_cita) 
values('suplemento de calcio', 8);
insert into tratamiento(dosis, id_cita) 
values('baños de agua tibia diarios', 9);
insert into tratamiento(dosis, id_cita) 
values('ningun tratamiento especifico', 10);
insert into tratamiento(dosis, id_cita) 
values('analgesico 1 pastilla c/8h', 11);
insert into tratamiento(dosis, id_cita) 
values('gotas oftalmicas 2 gotas c/12h', 12);
insert into tratamiento(dosis, id_cita) 
values('antiinflamatorio inyectable', 13);
insert into tratamiento(dosis, id_cita) 
values('vacuna antirrabica anual', 14);
insert into tratamiento(dosis, id_cita) 
values('corte de uñas y limpieza oidos', 15);
insert into tratamiento(dosis, id_cita) 
values('suero oral 10ml c/4h', 16);
insert into tratamiento(dosis, id_cita) 
values('shampoo medicado semanal', 17);
insert into tratamiento(dosis, id_cita) 
values('jarabe para tos 3ml c/8h', 18);
insert into tratamiento(dosis, id_cita) 
values('pomada cicatrizante 3 veces al dia', 19);
insert into tratamiento(dosis, id_cita) 
values('revision de peso mensual', 20);
insert into tratamiento(dosis, id_cita) 
values('dieta hipercalorica', 21);
insert into tratamiento(dosis, id_cita)
values('terapia fisica 2 veces x semana', 22);
insert into tratamiento(dosis, id_cita) 
values('antihistaminico 1 pastilla al dia', 23);
insert into tratamiento(dosis, id_cita)
values('protector gastrico en ayunas', 24);
insert into tratamiento(dosis, id_cita) 
values('control general sin medicacion', 25);
--sql
insert into tratamiento(dosis, id_cita)
values('antibiotico 5ml cada 12 horas', 26);
insert into tratamiento(dosis, id_cita)
values('vitaminas en polvo 1 cucharada diaria', 27);
insert into tratamiento(dosis, id_cita)
values('desparasitante dosis unica', 28);
insert into tratamiento(dosis, id_cita)
values('analgesico 1 pastilla cada 8 horas', 29);
insert into tratamiento(dosis, id_cita)
values('antiinflamatorio inyectable', 30);
insert into tratamiento(dosis, id_cita)
values('limpieza de oidos con solucion salina', 31);
insert into tratamiento(dosis, id_cita)
values('corte de uñas y limado', 32);
insert into tratamiento(dosis, id_cita)
values('vacuna quintuple', 33);
insert into tratamiento(dosis, id_cita)
values('refuerzo de vacuna antirrabica', 34);
insert into tratamiento(dosis, id_cita)
values('dieta blanda por 3 dias', 35);
insert into tratamiento(dosis, id_cita)
values('reposo absoluto por 48 horas', 36);
insert into tratamiento(dosis, id_cita)
values('baño medicado para pulgas', 37);
insert into tratamiento(dosis, id_cita)
values('gotas oftalmicas 2 gotas cada 8 horas', 38);
insert into tratamiento(dosis, id_cita)
values('pomada cicatrizante 2 veces al dia', 39);
insert into tratamiento(dosis, id_cita)
values('suero oral a voluntad', 40);
insert into tratamiento(dosis, id_cita)
values('protector gastrico 1/4 pastilla en ayunas', 41);
insert into tratamiento(dosis, id_cita)
values('jarabe para la tos 3ml cada 12 horas', 42);
insert into tratamiento(dosis, id_cita)
values('terapia de liquidos intravenosa', 43);
insert into tratamiento(dosis, id_cita)
values('antihistaminico 1 pastilla diaria', 44);
insert into tratamiento(dosis, id_cita)
values('crema antimicotica por 7 dias', 45);
insert into tratamiento(dosis, id_cita)
values('suplemento de calcio 1 vez al dia', 46);
insert into tratamiento(dosis, id_cita)
values('radiografia de torax de control', 47);
insert into tratamiento(dosis, id_cita)
values('ultrasonido abdominal', 48);
insert into tratamiento(dosis, id_cita)
values('examen de heces', 49);
insert into tratamiento(dosis, id_cita)
values('hemograma completo', 50);
insert into tratamiento(dosis, id_cita)
values('profilaxis dental', 51);
insert into tratamiento(dosis, id_cita)
values('extraccion de pieza dental', 52);
insert into tratamiento(dosis, id_cita)
values('curacion de herida superficial', 53);
insert into tratamiento(dosis, id_cita)
values('vendaje compresivo en pata derecha', 54);
insert into tratamiento(dosis, id_cita)
values('fisioterapia 2 sesiones por semana', 55);
insert into tratamiento(dosis, id_cita)
values('dieta hipoalergenica estricta', 56);
insert into tratamiento(dosis, id_cita)
values('corte de pelo higienico', 57);
insert into tratamiento(dosis, id_cita)
values('limpieza de glandulas anales', 58);
insert into tratamiento(dosis, id_cita)
values('tratamiento para sarna 1 ampolleta mensual', 59);
insert into tratamiento(dosis, id_cita)
values('nebulizaciones cada 8 horas', 60);
insert into tratamiento(dosis, id_cita)
values('oxigenoterapia por 2 horas', 61);
insert into tratamiento(dosis, id_cita)
values('transfusion de sangre', 62);
insert into tratamiento(dosis, id_cita)
values('control de glucosa diario', 63);
insert into tratamiento(dosis, id_cita)
values('insulina 2 unidades cada 12 horas', 64);
insert into tratamiento(dosis, id_cita)
values('pastilla para la presion 1 al dia', 65);
insert into tratamiento(dosis, id_cita)
values('suplemento hepatico', 66);
insert into tratamiento(dosis, id_cita)
values('protector renal en capsulas', 67);
insert into tratamiento(dosis, id_cita)
values('antibiotico topico en spray', 68);
insert into tratamiento(dosis, id_cita)
values('collar isabelino por 10 dias', 69);
insert into tratamiento(dosis, id_cita)
values('observacion en clinica por 24 horas', 70);
insert into tratamiento(dosis, id_cita)
values('examen de orina', 71);
insert into tratamiento(dosis, id_cita)
values('cultivo de secrecion', 72);
insert into tratamiento(dosis, id_cita)
values('biopsia de masa cutanea', 73);
insert into tratamiento(dosis, id_cita)
values('vacuna leucemia felina', 74);
insert into tratamiento(dosis, id_cita)
values('test de parvovirus', 75);
insert into tratamiento(dosis, id_cita)
values('pastilla masticable para garrapatas', 76);
insert into tratamiento(dosis, id_cita)
values('pipeta antipulgas aplicacion topica', 77);
insert into tratamiento(dosis, id_cita)
values('shampoo de avena baño quincenal', 78);
insert into tratamiento(dosis, id_cita)
values('condroprotector para articulaciones', 79);
insert into tratamiento(dosis, id_cita)
values('limpieza de sarro con ultrasonido', 80);
insert into tratamiento(dosis, id_cita)
values('masaje relajante muscular', 81);
insert into tratamiento(dosis, id_cita)
values('acupuntura veterinaria sesion 1', 82);
insert into tratamiento(dosis, id_cita)
values('ozonoterapia cutanea', 83);
insert into tratamiento(dosis, id_cita)
values('sedacion leve para examen', 84);
insert into tratamiento(dosis, id_cita)
values('anestesia general para cirugia', 85);
insert into tratamiento(dosis, id_cita)
values('castracion quirurgica', 86);
insert into tratamiento(dosis, id_cita)
values('esterilizacion de rutina', 87);
insert into tratamiento(dosis, id_cita)
values('sutura de laceracion', 88);
insert into tratamiento(dosis, id_cita)
values('retiro de puntos de sutura', 89);
insert into tratamiento(dosis, id_cita)
values('limpieza ocular con suero', 90);
insert into tratamiento(dosis, id_cita)
values('dieta control de peso', 91);
insert into tratamiento(dosis, id_cita)
values('ejercicio moderado 30 min diarios', 92);
insert into tratamiento(dosis, id_cita)
values('aislamiento por sospecha infecciosa', 93);
insert into tratamiento(dosis, id_cita)
values('suplemento vitaminico en gel', 94);
insert into tratamiento(dosis, id_cita)
values('limpieza de heridas con clorhexidina', 95);
insert into tratamiento(dosis, id_cita)
values('cambio de vendaje diario', 96);
insert into tratamiento(dosis, id_cita)
values('estimulante del apetito 1 ml diario', 97);
insert into tratamiento(dosis, id_cita)
values('laxante suave dosis unica', 98);
insert into tratamiento(dosis, id_cita)
values('enema evacuante', 99);
insert into tratamiento(dosis, id_cita)
values('medicacion anticonvulsiva c/12h', 100);
insert into tratamiento(dosis, id_cita)
values('gotas oticas 3 gotas en cada oido', 101);
insert into tratamiento(dosis, id_cita)
values('ungüento oftalmico por la noche', 102);
insert into tratamiento(dosis, id_cita)
values('purgante liquido 10 ml', 103);
insert into tratamiento(dosis, id_cita)
values('suero subcutaneo 100 ml', 104);
insert into tratamiento(dosis, id_cita)
values('alimentacion por sonda nasal', 105);
insert into tratamiento(dosis, id_cita)
values('retiro de cuerpo extraño en pata', 106);
insert into tratamiento(dosis, id_cita)
values('corte de plumas de vuelo', 107);
insert into tratamiento(dosis, id_cita)
values('limpieza de pico y garras', 108);
insert into tratamiento(dosis, id_cita)
values('baño termico para reptiles', 109);
insert into tratamiento(dosis, id_cita)
values('suplemento de vitamina d3', 110);
insert into tratamiento(dosis, id_cita)
values('desparasitante para aves en agua', 111);
insert into tratamiento(dosis, id_cita)
values('antibiotico en gotas orales', 112);
insert into tratamiento(dosis, id_cita)
values('pomada para dermatitis 3 dias', 113);
insert into tratamiento(dosis, id_cita)
values('revision de peso semanal', 114);
insert into tratamiento(dosis, id_cita)
values('cambio a alimento premium', 115);
insert into tratamiento(dosis, id_cita)
values('terapia de comportamiento', 116);
insert into tratamiento(dosis, id_cita)
values('feromonas relajantes en spray', 117);
insert into tratamiento(dosis, id_cita)
values('cepillado de pelaje diario', 118);
insert into tratamiento(dosis, id_cita)
values('enjuague bucal para mascotas', 119);
insert into tratamiento(dosis, id_cita)
values('vacuna bordetella (tos de perrera)', 120);
insert into tratamiento(dosis, id_cita)
values('analgesico en parches', 121);
insert into tratamiento(dosis, id_cita)
values('antiacido 5 ml c/8h', 122);
insert into tratamiento(dosis, id_cita)
values('complejo b inyectable', 123);
insert into tratamiento(dosis, id_cita)
values('hierro en jarabe 2 ml diarios', 124);
insert into tratamiento(dosis, id_cita)
values('antiespasmodico dosis unica', 125);
insert into tratamiento(dosis, id_cita)
values('medicamento para tiroides 1 pastilla', 126);
insert into tratamiento(dosis, id_cita)
values('tratamiento para otitis 7 dias', 127);
insert into tratamiento(dosis, id_cita)
values('terapia laser en articulacion', 128);
insert into tratamiento(dosis, id_cita)
values('ecocardiograma', 129);
insert into tratamiento(dosis, id_cita)
values('electrocardiograma', 130);
insert into tratamiento(dosis, id_cita)
values('inyeccion de corticoide', 131);
insert into tratamiento(dosis, id_cita)
values('diuretico 1/2 pastilla c/12h', 132);
insert into tratamiento(dosis, id_cita)
values('suplemento de acidos grasos', 133);
insert into tratamiento(dosis, id_cita)
values('crema hidratante para cojinetes', 134);
insert into tratamiento(dosis, id_cita)
values('limpieza de lagrimales', 135);
insert into tratamiento(dosis, id_cita)
values('control de temperatura c/4 horas', 136);
insert into tratamiento(dosis, id_cita)
values('administracion de probioticos', 137);
insert into tratamiento(dosis, id_cita)
values('formula lactea para cachorros', 138);
insert into tratamiento(dosis, id_cita)
values('masaje abdominal por 10 min', 139);
insert into tratamiento(dosis, id_cita)
values('alta medica sin medicacion', 140);

select * from tratamiento;
--fin insert tratamiento

--insert factura (120 registros)
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-20', 25.00, 0.00, 3.25, 28.25, 1, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-06-20', 40.00, 5.00, 4.55, 39.55, 2, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-21', 30.00, 0.00, 3.90, 33.90, 3, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-21', 50.00, 10.00, 5.20, 45.20, 4, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-22', 15.00, 0.00, 1.95, 16.95, 5, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-22', 20.00, 0.00, 2.60, 22.60, 6, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-23', 35.00, 0.00, 4.55, 39.55, 7, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-23', 25.00, 5.00, 2.60, 22.60, 8, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-24', 20.00, 0.00, 2.60, 22.60, 10, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-25', 60.00, 15.00, 5.85, 50.85, 11, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-25', 22.00, 0.00, 2.86, 24.86, 12, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-06-26', 18.00, 0.00, 2.34, 20.34, 13, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-26', 80.00, 20.00, 7.80, 67.80, 14, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-27', 12.00, 0.00, 1.56, 13.56, 15, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-27', 42.00, 0.00, 5.46, 47.46, 16, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-28', 33.00, 3.00, 3.90, 33.90, 17, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-28', 10.00, 0.00, 1.30, 11.30, 18, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-29', 55.00, 0.00, 7.15, 62.15, 19, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-29', 28.00, 0.00, 3.64, 31.64, 20, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-30', 90.00, 10.00, 10.40, 90.40, 21, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-06-30', 16.00, 0.00, 2.08, 18.08, 22, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-07-01', 38.00, 0.00, 4.94, 42.94, 23, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-07-01', 47.00, 5.00, 5.46, 47.46, 24, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago) 
values('2026-07-02', 20.00, 0.00, 2.60, 22.60, 25, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-03', 30.00, 0.00, 3.90, 33.90, 26, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-03', 40.00, 5.00, 4.55, 39.55, 27, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-03', 25.00, 0.00, 3.25, 28.25, 28, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-03', 50.00, 0.00, 6.50, 56.50, 29, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-03', 60.00, 10.00, 6.50, 56.50, 30, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-03', 15.00, 0.00, 1.95, 16.95, 31, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-03', 35.00, 5.00, 3.90, 33.90, 32, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-03', 45.00, 0.00, 5.85, 50.85, 33, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-03', 20.00, 0.00, 2.60, 22.60, 34, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-03', 80.00, 20.00, 7.80, 67.80, 35, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-04', 30.00, 0.00, 3.90, 33.90, 36, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-04', 40.00, 5.00, 4.55, 39.55, 37, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-04', 25.00, 0.00, 3.25, 28.25, 38, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-04', 50.00, 0.00, 6.50, 56.50, 39, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-04', 60.00, 10.00, 6.50, 56.50, 40, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-04', 15.00, 0.00, 1.95, 16.95, 41, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-04', 35.00, 5.00, 3.90, 33.90, 42, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-04', 45.00, 0.00, 5.85, 50.85, 43, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-04', 20.00, 0.00, 2.60, 22.60, 44, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-04', 80.00, 20.00, 7.80, 67.80, 45, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-05', 30.00, 0.00, 3.90, 33.90, 46, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-05', 40.00, 5.00, 4.55, 39.55, 47, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-05', 25.00, 0.00, 3.25, 28.25, 48, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-05', 50.00, 0.00, 6.50, 56.50, 49, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-05', 60.00, 10.00, 6.50, 56.50, 50, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-05', 15.00, 0.00, 1.95, 16.95, 51, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-05', 35.00, 5.00, 3.90, 33.90, 52, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-05', 45.00, 0.00, 5.85, 50.85, 53, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-05', 20.00, 0.00, 2.60, 22.60, 54, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-05', 80.00, 20.00, 7.80, 67.80, 55, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-06', 30.00, 0.00, 3.90, 33.90, 56, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-06', 40.00, 5.00, 4.55, 39.55, 57, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-06', 25.00, 0.00, 3.25, 28.25, 58, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-06', 50.00, 0.00, 6.50, 56.50, 59, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-06', 60.00, 10.00, 6.50, 56.50, 60, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-06', 15.00, 0.00, 1.95, 16.95, 61, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-06', 35.00, 5.00, 3.90, 33.90, 62, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-06', 45.00, 0.00, 5.85, 50.85, 63, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-06', 20.00, 0.00, 2.60, 22.60, 64, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-06', 80.00, 20.00, 7.80, 67.80, 65, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-07', 30.00, 0.00, 3.90, 33.90, 66, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-07', 40.00, 5.00, 4.55, 39.55, 67, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-07', 25.00, 0.00, 3.25, 28.25, 68, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-07', 50.00, 0.00, 6.50, 56.50, 69, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-07', 60.00, 10.00, 6.50, 56.50, 70, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-07', 15.00, 0.00, 1.95, 16.95, 71, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-07', 35.00, 5.00, 3.90, 33.90, 72, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-07', 45.00, 0.00, 5.85, 50.85, 73, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-07', 20.00, 0.00, 2.60, 22.60, 74, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-07', 80.00, 20.00, 7.80, 67.80, 75, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-08', 30.00, 0.00, 3.90, 33.90, 76, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-08', 40.00, 5.00, 4.55, 39.55, 77, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-08', 25.00, 0.00, 3.25, 28.25, 78, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-08', 50.00, 0.00, 6.50, 56.50, 79, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-08', 60.00, 10.00, 6.50, 56.50, 80, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-08', 15.00, 0.00, 1.95, 16.95, 81, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-08', 35.00, 5.00, 3.90, 33.90, 82, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-08', 45.00, 0.00, 5.85, 50.85, 83, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-08', 20.00, 0.00, 2.60, 22.60, 84, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-08', 80.00, 20.00, 7.80, 67.80, 85, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-09', 30.00, 0.00, 3.90, 33.90, 86, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-09', 40.00, 5.00, 4.55, 39.55, 87, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-09', 25.00, 0.00, 3.25, 28.25, 88, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-09', 50.00, 0.00, 6.50, 56.50, 89, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-09', 60.00, 10.00, 6.50, 56.50, 90, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-09', 15.00, 0.00, 1.95, 16.95, 91, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-09', 35.00, 5.00, 3.90, 33.90, 92, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-09', 45.00, 0.00, 5.85, 50.85, 93, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-09', 20.00, 0.00, 2.60, 22.60, 94, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-09', 80.00, 20.00, 7.80, 67.80, 95, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-10', 30.00, 0.00, 3.90, 33.90, 96, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-10', 40.00, 5.00, 4.55, 39.55, 97, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-10', 25.00, 0.00, 3.25, 28.25, 98, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-10', 50.00, 0.00, 6.50, 56.50, 99, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-10', 60.00, 10.00, 6.50, 56.50, 100, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-10', 15.00, 0.00, 1.95, 16.95, 101, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-10', 35.00, 5.00, 3.90, 33.90, 102, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-10', 45.00, 0.00, 5.85, 50.85, 103, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-10', 20.00, 0.00, 2.60, 22.60, 104, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-10', 80.00, 20.00, 7.80, 67.80, 105, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-11', 30.00, 0.00, 3.90, 33.90, 106, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-11', 40.00, 5.00, 4.55, 39.55, 107, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-11', 25.00, 0.00, 3.25, 28.25, 108, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-11', 50.00, 0.00, 6.50, 56.50, 109, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-11', 60.00, 10.00, 6.50, 56.50, 110, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-11', 15.00, 0.00, 1.95, 16.95, 111, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-11', 35.00, 5.00, 3.90, 33.90, 112, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-11', 45.00, 0.00, 5.85, 50.85, 113, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-11', 20.00, 0.00, 2.60, 22.60, 114, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-11', 80.00, 20.00, 7.80, 67.80, 115, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-12', 30.00, 0.00, 3.90, 33.90, 116, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-12', 40.00, 5.00, 4.55, 39.55, 117, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-12', 25.00, 0.00, 3.25, 28.25, 118, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-12', 50.00, 0.00, 6.50, 56.50, 119, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-12', 60.00, 10.00, 6.50, 56.50, 120, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-12', 15.00, 0.00, 1.95, 16.95, 121, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-12', 35.00, 5.00, 3.90, 33.90, 122, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-12', 45.00, 0.00, 5.85, 50.85, 123, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-12', 20.00, 0.00, 2.60, 22.60, 124, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-12', 80.00, 20.00, 7.80, 67.80, 125, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-13', 30.00, 0.00, 3.90, 33.90, 126, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-13', 40.00, 5.00, 4.55, 39.55, 127, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-13', 25.00, 0.00, 3.25, 28.25, 128, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-13', 50.00, 0.00, 6.50, 56.50, 129, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-13', 60.00, 10.00, 6.50, 56.50, 130, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-13', 15.00, 0.00, 1.95, 16.95, 131, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-13', 35.00, 5.00, 3.90, 33.90, 132, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-13', 45.00, 0.00, 5.85, 50.85, 133, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-13', 20.00, 0.00, 2.60, 22.60, 134, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-13', 80.00, 20.00, 7.80, 67.80, 135, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-14', 30.00, 0.00, 3.90, 33.90, 136, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-14', 40.00, 5.00, 4.55, 39.55, 137, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-14', 25.00, 0.00, 3.25, 28.25, 138, 1);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-14', 50.00, 0.00, 6.50, 56.50, 139, 2);
insert into factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
values('2026-07-14', 60.00, 10.00, 6.50, 56.50, 140, 1);

--fin insert factura

-- insert detalle_factura 
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(1, 1, 1, 0.00, 25.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(2, 2, 1, 0.00, 40.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(3, 3, 1, 0.00, 30.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(4, 4, 1, 0.00, 50.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(5, 5, 1, 0.00, 15.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(6, 6, 1, 0.00, 20.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(7, 7, 1, 0.00, 35.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(8, 8, 1, 0.00, 25.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(9, 9, 1, 0.00, 20.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(10, 10, 1, 0.00, 60.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(1, 11, 1, 0.00, 22.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(2, 12, 1, 0.00, 18.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(3, 13, 1, 0.00, 80.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(4, 14, 1, 0.00, 12.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(5, 15, 1, 0.00, 42.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(6, 16, 1, 0.00, 33.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(7, 17, 1, 0.00, 10.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(8, 18, 1, 0.00, 55.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(9, 19, 1, 0.00, 28.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(10, 20, 1, 0.00, 90.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(1, 21, 1, 0.00, 16.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(2, 22, 1, 0.00, 38.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(3, 23, 1, 0.00, 47.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(4, 24, 1, 0.00, 20.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado) 
values(5, 25, 1, 0.00, 30.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(1, 26, 1, 0.00, 40.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(2, 27, 1, 0.00, 25.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(3, 28, 1, 0.00, 50.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(4, 29, 1, 0.00, 60.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(5, 30, 1, 0.00, 15.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(6, 31, 1, 0.00, 35.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(7, 32, 1, 0.00, 45.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(8, 33, 1, 0.00, 20.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(9, 34, 1, 0.00, 80.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(10, 35, 1, 0.00, 30.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(1, 36, 1, 0.00, 40.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(2, 37, 1, 0.00, 25.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(3, 38, 1, 0.00, 50.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(4, 39, 1, 0.00, 60.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(5, 40, 1, 0.00, 15.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(6, 41, 1, 0.00, 35.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(7, 42, 1, 0.00, 45.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(8, 43, 1, 0.00, 20.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(9, 44, 1, 0.00, 80.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(10, 45, 1, 0.00, 30.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(1, 46, 1, 0.00, 40.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(2, 47, 1, 0.00, 25.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(3, 48, 1, 0.00, 50.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(4, 49, 1, 0.00, 60.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(5, 50, 1, 0.00, 15.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(6, 51, 1, 0.00, 35.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(7, 52, 1, 0.00, 45.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(8, 53, 1, 0.00, 20.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(9, 54, 1, 0.00, 80.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(10, 55, 1, 0.00, 30.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(1, 56, 1, 0.00, 40.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(2, 57, 1, 0.00, 25.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(3, 58, 1, 0.00, 50.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(4, 59, 1, 0.00, 60.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(5, 60, 1, 0.00, 15.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(6, 61, 1, 0.00, 35.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(7, 62, 1, 0.00, 45.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(8, 63, 1, 0.00, 20.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(9, 64, 1, 0.00, 80.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(10, 65, 1, 0.00, 30.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(1, 66, 1, 0.00, 40.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(2, 67, 1, 0.00, 25.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(3, 68, 1, 0.00, 50.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(4, 69, 1, 0.00, 60.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(5, 70, 1, 0.00, 15.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(6, 71, 1, 0.00, 35.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(7, 72, 1, 0.00, 45.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(8, 73, 1, 0.00, 20.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(9, 74, 1, 0.00, 80.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(10, 75, 1, 0.00, 30.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(1, 76, 1, 0.00, 40.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(2, 77, 1, 0.00, 25.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(3, 78, 1, 0.00, 50.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(4, 79, 1, 0.00, 60.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(5, 80, 1, 0.00, 15.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(6, 81, 1, 0.00, 35.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(7, 82, 1, 0.00, 45.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(8, 83, 1, 0.00, 20.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(9, 84, 1, 0.00, 80.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(10, 85, 1, 0.00, 30.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(1, 86, 1, 0.00, 40.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(2, 87, 1, 0.00, 25.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(3, 88, 1, 0.00, 50.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(4, 89, 1, 0.00, 60.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(5, 90, 1, 0.00, 15.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(6, 91, 1, 0.00, 35.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(7, 92, 1, 0.00, 45.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(8, 93, 1, 0.00, 20.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(9, 94, 1, 0.00, 80.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(10, 95, 1, 0.00, 30.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(1, 96, 1, 0.00, 40.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(2, 97, 1, 0.00, 25.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(3, 98, 1, 0.00, 50.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(4, 99, 1, 0.00, 60.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(5, 100, 1, 0.00, 15.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(6, 101, 1, 0.00, 35.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(7, 102, 1, 0.00, 45.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(8, 103, 1, 0.00, 20.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(9, 104, 1, 0.00, 80.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(10, 105, 1, 0.00, 30.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(1, 106, 1, 0.00, 40.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(2, 107, 1, 0.00, 25.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(3, 108, 1, 0.00, 50.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(4, 109, 1, 0.00, 60.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(5, 110, 1, 0.00, 15.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(6, 111, 1, 0.00, 35.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(7, 112, 1, 0.00, 45.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(8, 113, 1, 0.00, 20.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(9, 114, 1, 0.00, 80.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(10, 115, 1, 0.00, 30.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(1, 116, 1, 0.00, 40.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(2, 117, 1, 0.00, 25.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(3, 118, 1, 0.00, 50.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(4, 119, 1, 0.00, 60.00);
insert into detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
values(5, 120, 1, 0.00, 15.00);

--fin insert detalle_factura

-- Complete missing invoice coverage and its invoice detail rows.
INSERT INTO factura(fecha_emision, sub_total, descuento_total, impuestos_totales, monto_total, id_cita, id_forma_pago)
VALUES ('2026-06-24', 45.00, 0.00, 5.85, 50.85, 9, 1);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (1, 121, 1, 0.00, 35.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (2, 122, 1, 0.00, 45.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (3, 123, 1, 0.00, 20.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (4, 124, 1, 0.00, 80.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (5, 125, 1, 0.00, 30.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (6, 126, 1, 0.00, 40.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (7, 127, 1, 0.00, 25.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (8, 128, 1, 0.00, 50.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (9, 129, 1, 0.00, 60.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (10, 130, 1, 0.00, 15.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (1, 131, 1, 0.00, 35.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (2, 132, 1, 0.00, 45.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (3, 133, 1, 0.00, 20.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (4, 134, 1, 0.00, 80.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (5, 135, 1, 0.00, 30.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (6, 136, 1, 0.00, 40.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (7, 137, 1, 0.00, 25.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (8, 138, 1, 0.00, 50.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (9, 139, 1, 0.00, 60.00);
INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
VALUES (9, 140, 1, 0.00, 45.00);

-- Add the non-refundable booking charge to each seeded appointment invoice.
UPDATE factura
SET sub_total = sub_total + 2.00,
    impuestos_totales = impuestos_totales + 0.26,
    monto_total = monto_total + 2.26;

INSERT INTO detalle_factura(id_articulo, id_factura, cantidad, porcentaje_descuento, precio_unitario_cobrado)
SELECT 11, f.id_factura, 1, 0.00, 2.00
FROM factura AS f;

SELECT * FROM factura;
SELECT * FROM detalle_factura;

-- Add diagnosis records and medication-treatment relationships.
INSERT INTO diagnostico(informe, id_cita) VALUES
    ('Evaluacion preventiva sin hallazgos relevantes. Paciente: max', 1),
    ('Dermatitis leve, se recomienda seguimiento. Paciente: luna', 2),
    ('Signos compatibles con parasitosis intestinal. Paciente: copo', 3),
    ('Otitis externa leve. Paciente: relampago', 4),
    ('Gastroenteritis leve, paciente estable. Paciente: manchas', 5),
    ('Control de peso, sin signos de urgencia. Paciente: porky', 6),
    ('Irritacion ocular leve. Paciente: nube', 7),
    ('Herida superficial sin complicaciones. Paciente: paco', 8),
    ('Evaluacion respiratoria, signos vitales estables. Paciente: godzilla', 9),
    ('Revision general y esquema preventivo actualizado. Paciente: bolt', 10),
    ('Evaluacion preventiva sin hallazgos relevantes. Paciente: rocky', 11),
    ('Dermatitis leve, se recomienda seguimiento. Paciente: michi', 12),
    ('Signos compatibles con parasitosis intestinal. Paciente: tambor', 13),
    ('Otitis externa leve. Paciente: spirit', 14),
    ('Gastroenteritis leve, paciente estable. Paciente: lola', 15),
    ('Control de peso, sin signos de urgencia. Paciente: babe', 16),
    ('Irritacion ocular leve. Paciente: dolly', 17),
    ('Herida superficial sin complicaciones. Paciente: rio', 18),
    ('Evaluacion respiratoria, signos vitales estables. Paciente: reptar', 19),
    ('Revision general y esquema preventivo actualizado. Paciente: hammy', 20),
    ('Evaluacion preventiva sin hallazgos relevantes. Paciente: zeus', 21),
    ('Dermatitis leve, se recomienda seguimiento. Paciente: simba', 22),
    ('Signos compatibles con parasitosis intestinal. Paciente: orejas', 23),
    ('Otitis externa leve. Paciente: tornado', 24),
    ('Gastroenteritis leve, paciente estable. Paciente: blanca', 25),
    ('Control de peso, sin signos de urgencia. Paciente: max', 26),
    ('Irritacion ocular leve. Paciente: luna', 27),
    ('Herida superficial sin complicaciones. Paciente: copo', 28),
    ('Evaluacion respiratoria, signos vitales estables. Paciente: relampago', 29),
    ('Revision general y esquema preventivo actualizado. Paciente: manchas', 30),
    ('Evaluacion preventiva sin hallazgos relevantes. Paciente: porky', 31),
    ('Dermatitis leve, se recomienda seguimiento. Paciente: nube', 32),
    ('Signos compatibles con parasitosis intestinal. Paciente: paco', 33),
    ('Otitis externa leve. Paciente: godzilla', 34),
    ('Gastroenteritis leve, paciente estable. Paciente: bolt', 35),
    ('Control de peso, sin signos de urgencia. Paciente: rocky', 36),
    ('Irritacion ocular leve. Paciente: michi', 37),
    ('Herida superficial sin complicaciones. Paciente: tambor', 38),
    ('Evaluacion respiratoria, signos vitales estables. Paciente: spirit', 39),
    ('Revision general y esquema preventivo actualizado. Paciente: lola', 40),
    ('Evaluacion preventiva sin hallazgos relevantes. Paciente: babe', 41),
    ('Dermatitis leve, se recomienda seguimiento. Paciente: dolly', 42),
    ('Signos compatibles con parasitosis intestinal. Paciente: rio', 43),
    ('Otitis externa leve. Paciente: reptar', 44),
    ('Gastroenteritis leve, paciente estable. Paciente: hammy', 45),
    ('Control de peso, sin signos de urgencia. Paciente: zeus', 46),
    ('Irritacion ocular leve. Paciente: simba', 47),
    ('Herida superficial sin complicaciones. Paciente: orejas', 48),
    ('Evaluacion respiratoria, signos vitales estables. Paciente: tornado', 49),
    ('Revision general y esquema preventivo actualizado. Paciente: blanca', 50),
    ('Evaluacion preventiva sin hallazgos relevantes. Paciente: toby', 51),
    ('Dermatitis leve, se recomienda seguimiento. Paciente: fido', 52),
    ('Signos compatibles con parasitosis intestinal. Paciente: pelusa', 53),
    ('Otitis externa leve. Paciente: rex', 54),
    ('Gastroenteritis leve, paciente estable. Paciente: nala', 55),
    ('Control de peso, sin signos de urgencia. Paciente: kira', 56),
    ('Irritacion ocular leve. Paciente: thor', 57),
    ('Herida superficial sin complicaciones. Paciente: loki', 58),
    ('Evaluacion respiratoria, signos vitales estables. Paciente: simba', 59),
    ('Revision general y esquema preventivo actualizado. Paciente: miau', 60),
    ('Evaluacion preventiva sin hallazgos relevantes. Paciente: blanco', 61),
    ('Dermatitis leve, se recomienda seguimiento. Paciente: negro', 62),
    ('Signos compatibles con parasitosis intestinal. Paciente: pinto', 63),
    ('Otitis externa leve. Paciente: manchas', 64),
    ('Gastroenteritis leve, paciente estable. Paciente: bobby', 65),
    ('Control de peso, sin signos de urgencia. Paciente: rambo', 66),
    ('Irritacion ocular leve. Paciente: choco', 67),
    ('Herida superficial sin complicaciones. Paciente: princesa', 68),
    ('Evaluacion respiratoria, signos vitales estables. Paciente: reina', 69),
    ('Revision general y esquema preventivo actualizado. Paciente: rey', 70),
    ('Evaluacion preventiva sin hallazgos relevantes. Paciente: duque', 71),
    ('Dermatitis leve, se recomienda seguimiento. Paciente: rocky', 72),
    ('Signos compatibles con parasitosis intestinal. Paciente: zeus', 73),
    ('Otitis externa leve. Paciente: apolo', 74),
    ('Gastroenteritis leve, paciente estable. Paciente: titan', 75),
    ('Control de peso, sin signos de urgencia. Paciente: goliat', 76),
    ('Irritacion ocular leve. Paciente: paco', 77),
    ('Herida superficial sin complicaciones. Paciente: pepe', 78),
    ('Evaluacion respiratoria, signos vitales estables. Paciente: coco', 79),
    ('Revision general y esquema preventivo actualizado. Paciente: lola', 80),
    ('Evaluacion preventiva sin hallazgos relevantes. Paciente: mia', 81),
    ('Dermatitis leve, se recomienda seguimiento. Paciente: luna', 82),
    ('Signos compatibles con parasitosis intestinal. Paciente: estrella', 83),
    ('Otitis externa leve. Paciente: sol', 84),
    ('Gastroenteritis leve, paciente estable. Paciente: cometa', 85),
    ('Control de peso, sin signos de urgencia. Paciente: rayo', 86),
    ('Irritacion ocular leve. Paciente: chispa', 87),
    ('Herida superficial sin complicaciones. Paciente: bella', 88),
    ('Evaluacion respiratoria, signos vitales estables. Paciente: canela', 89),
    ('Revision general y esquema preventivo actualizado. Paciente: cafe', 90),
    ('Evaluacion preventiva sin hallazgos relevantes. Paciente: oso', 91),
    ('Dermatitis leve, se recomienda seguimiento. Paciente: lobo', 92),
    ('Signos compatibles con parasitosis intestinal. Paciente: zorro', 93),
    ('Otitis externa leve. Paciente: tigre', 94),
    ('Gastroenteritis leve, paciente estable. Paciente: leon', 95),
    ('Control de peso, sin signos de urgencia. Paciente: pecas', 96),
    ('Irritacion ocular leve. Paciente: dante', 97),
    ('Herida superficial sin complicaciones. Paciente: bruno', 98),
    ('Evaluacion respiratoria, signos vitales estables. Paciente: max', 99),
    ('Revision general y esquema preventivo actualizado. Paciente: milo', 100),
    ('Evaluacion preventiva sin hallazgos relevantes. Paciente: leo', 101),
    ('Dermatitis leve, se recomienda seguimiento. Paciente: jack', 102),
    ('Signos compatibles con parasitosis intestinal. Paciente: tomas', 103),
    ('Otitis externa leve. Paciente: felix', 104),
    ('Gastroenteritis leve, paciente estable. Paciente: silvestre', 105),
    ('Control de peso, sin signos de urgencia. Paciente: piolin', 106),
    ('Irritacion ocular leve. Paciente: lucas', 107),
    ('Herida superficial sin complicaciones. Paciente: snoop', 108),
    ('Evaluacion respiratoria, signos vitales estables. Paciente: scooby', 109),
    ('Revision general y esquema preventivo actualizado. Paciente: pluto', 110),
    ('Evaluacion preventiva sin hallazgos relevantes. Paciente: goofy', 111),
    ('Dermatitis leve, se recomienda seguimiento. Paciente: mickey', 112),
    ('Signos compatibles con parasitosis intestinal. Paciente: donald', 113),
    ('Otitis externa leve. Paciente: daisy', 114),
    ('Gastroenteritis leve, paciente estable. Paciente: minnie', 115),
    ('Control de peso, sin signos de urgencia. Paciente: chloe', 116),
    ('Irritacion ocular leve. Paciente: zoe', 117),
    ('Herida superficial sin complicaciones. Paciente: sasha', 118),
    ('Evaluacion respiratoria, signos vitales estables. Paciente: roxy', 119),
    ('Revision general y esquema preventivo actualizado. Paciente: ruby', 120),
    ('Evaluacion preventiva sin hallazgos relevantes. Paciente: perla', 121),
    ('Dermatitis leve, se recomienda seguimiento. Paciente: joya', 122),
    ('Signos compatibles con parasitosis intestinal. Paciente: bambi', 123),
    ('Otitis externa leve. Paciente: dumbo', 124),
    ('Gastroenteritis leve, paciente estable. Paciente: nemo', 125),
    ('Control de peso, sin signos de urgencia. Paciente: dory', 126),
    ('Irritacion ocular leve. Paciente: marlin', 127),
    ('Herida superficial sin complicaciones. Paciente: simon', 128),
    ('Evaluacion respiratoria, signos vitales estables. Paciente: alvin', 129),
    ('Revision general y esquema preventivo actualizado. Paciente: theodore', 130),
    ('Evaluacion preventiva sin hallazgos relevantes. Paciente: garfield', 131),
    ('Dermatitis leve, se recomienda seguimiento. Paciente: oddie', 132),
    ('Signos compatibles con parasitosis intestinal. Paciente: snoopy', 133),
    ('Otitis externa leve. Paciente: charlie', 134),
    ('Gastroenteritis leve, paciente estable. Paciente: lucy', 135),
    ('Control de peso, sin signos de urgencia. Paciente: linus', 136),
    ('Irritacion ocular leve. Paciente: sally', 137),
    ('Herida superficial sin complicaciones. Paciente: schroeder', 138),
    ('Evaluacion respiratoria, signos vitales estables. Paciente: pajarito', 139),
    ('Revision general y esquema preventivo actualizado. Paciente: lora', 140);
INSERT INTO medicamento_tratamiento(id_articulo, id_tratamiento) VALUES
    (10, 1),
    (10, 8),
    (7, 13),
    (6, 14),
    (10, 27),
    (7, 30),
    (6, 33),
    (6, 34),
    (7, 43),
    (10, 46),
    (9, 56),
    (8, 69),
    (6, 74),
    (6, 75),
    (10, 110),
    (6, 120),
    (7, 123);

COMMIT TRANSACTION;
