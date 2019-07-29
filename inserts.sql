INSERT INTO provincia (cod_provincia, nombre)
VALUES (1,'Buenos Aires'),
(2,'Capital Federal'),
(3,'Cordoba');

INSERT INTO localidad (cod_localidad, nombre, cod_provincia)
VALUES (1,'Moron',1),
(2,'Ramos Mejia',1),
(3,'San justo',1),
(4,'C.A.B.A',2),
(5,'Parana',3),
(6,'Concordia',3),
(7,'Colon',3);

INSERT INTO cliente (cuit, razon_social, domicilio, cod_localidad)
VALUES (1111111,'ARazon social AS','Av rivadavia 13400',2),
(1111112,'ARazon social B','Sargento Cabral 512',2),
(1111113,'Razon social CS','Av rivadavia 18352',1),
(1111114,'Razon social D','Los faunos 123',6),
(1111115,'Razon social F','Ocampo 56',5),
(1111116,'Razon social GS','Luis Maria Campos 339',4),
(1111117,'ARazon social HS','Honduras 3434',4);


INSERT INTO factura (cod_factura, fecha, cliente_cuit)
VALUES (1,'2019-01-01 00:30:00',1111111),
(2,'2018-06-12 18:30:00',1111111),
(3,'2019-12-12 15:30:00',1111112),
(4,'2017-02-28 10:45:00',1111114),
(5,'2006-10-10 15:00:00',1111114),
(6,'2017-02-28 10:45:00',1111114),
(7,'2019-03-11 11:01:00',1111115),
(8,'2014-05-02 12:01:00',1111115),
(9,'2018-11-03 12:55:00',1111117),
(10,'2005-09-16 13:05:00',1111117),
(11,'2002-11-03 15:17:00',1111117),
(12,'2017-06-25 16:43:00',1111111),
(13,'1994-03-17 18:45:00',1111113),
(14,'2014-01-15 20:35:00',1111113),
(15,'2016-01-10 21:30:00',1111113),
(16,'2017-01-01 00:00:00',1111114),
(17,'2017-01-02 00:00:00',1111115);




INSERT INTO mayorista (cliente_cuit, fecha_inicio)
VALUES (1111111,'2019-04-05'),
(1111112,'2017-06-03'),
(1111113,'2018-10-14');


INSERT INTO minorista (cliente_cuit, telefono, nombre_contacto)
VALUES (1111114,'46546421','Juan Perez'),
(1111115,'1164327785','Rodrigo Bas'),
(1111116,'1163659685','Juan Antunez'),
(1111117,'44664452','Ignacio Roma');

INSERT INTO categoria (cod_categoria, nombre)
VALUES (1, 'Monopatín'),
(2, 'Moto'),
(3, 'Triciclo'),
(4, 'Auto');

INSERT INTO vehiculo (cod_vehiculo, descripcion, precio, stock, cod_categoria)
VALUES (1,'Triciclo 1',125000,0,3),
(2,'Triciclo 2',180000,10,3),
(3,'Triciclo 3',135000,16,3),
(4,'Moto 1',270000,16,2),
(5,'Moto 2',450000,4,2),
(6,'Auto 1',900000,3,4),
(7,'Auto 2',774000,4,4),
(8,'Monopatin 1',1500000,4,1),
(9,'Monopatin 2',2500000,23,1);


INSERT INTO renglon (numero, cod_factura, precio, cantidad, cod_vehiculo)
VALUES (1,1,125000,2,1),
(1,2,1500000,16,8),
(1,3,200000,1,3),
(1,4,1000000,9,8),
(1,5,125000,5,1),
(1,6,1000000,2,6),
(1,7,860000,3,7),
(1,8,1500000,11,8),
(1,9,2500000,12,9),
(1,16,1000,1,1),
(1,17,1000,1,1),
(2,1,225000,1,3),
(2,2,125000,1,1),
(2,5,150000,2,2),
(2,6,2500000,3,9),
(2,16,1000,1,2),
(2,17,1000,1,2),
(3,1,500000,3,5),
(3,5,760000,4,7),
(3,16,1000,1,3),
(3,17,1000,1,3),
(4,16,1000,1,4),
(4,17,1000,1,4),
(5,16,1000,1,5),
(5,17,1000,1,5),
(6,16,1000,1,6),
(6,17,1000,1,6),
(7,16,1000,1,7),
(7,17,1000,1,7),
(8,16,1000,1,8),
(8,17,1000,1,8),
(9,16,1000,1,9),
(9,17,1000,1,9);


INSERT INTO reparacion (cod_reparacion, costo, descripcion_problema, descripcion_solucion, fecha_ingreso, fecha_devolucion, cod_vehiculo)
VALUES (1,0,'DESC PROBLEMA','DESC SOLUCION','2019-05-01 00:30:00',NULL,1),
(2,1000,'DESC PROBLEMA','DESC SOLUCION','2018-11-04 20:30:00','2018-11-05 20:30:00',1),
(3,2500,'DESC PROBLEMA','DESC SOLUCION','2017-12-05 22:30:00','2017-12-08 20:30:00',2),
(4,0,'DESC PROBLEMA','DESC SOLUCION','2019-01-06 21:30:00',NULL,3),
(5,5600,'DESC PROBLEMA','DESC SOLUCION','2019-08-01 20:30:00',NULL,4),
(6,0,'DESC PROBLEMA','DESC SOLUCION','2016-05-09 16:30:00','2016-05-15 20:30:00',1),
(7,3000,'DESC PROBLEMA','DESC SOLUCION','2000-01-05 15:30:00','2000-01-05 15:45:00',6);

INSERT INTO similar (vehiculo_1, vehiculo_2)
VALUES (1,2),(1,3);

