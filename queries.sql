#a)
#Indicar el monto total facturado durante el año 2018.
SELECT SUM(R.cantidad * R.precio) MontoTotal
FROM renglon R
INNER JOIN factura F ON (R.cod_factura = F.cod_factura)
WHERE F.fecha >= '2018-01-01 00:00:00' AND F.fecha <= '2019-01-01 23:59:59';

#b)
# Listar la razón social de aquellos clientes que hayan comprado más de 10 vehículos de la categoría “Monopatín” en el año 2018.
SELECT C.razon_social
FROM cliente C
INNER JOIN factura F ON F.cliente_cuit = C.cuit
INNER JOIN renglon R ON F.cod_factura = R.cod_factura
INNER JOIN vehiculo V ON R.cod_vehiculo= V.cod_vehiculo
INNER JOIN categoria CAT ON V.cod_categoria = CAT.cod_categoria
WHERE CAT.nombre = 'Monopatín' AND
F.fecha > '2018-01-01 00:00:00' AND F.fecha <= '2019-01-01 23:59:59'
GROUP BY C.razon_social
HAVING SUM(R.cantidad) > 10;

#c)
# Mostrar el CUIT y razón social, de aquellos clientes que comienzan con la letra A y terminan con la letra S. Si el cliente es mayorista, indicar además la fecha de inicio de actividades
SELECT C.cuit, C.razon_social, M.fecha_inicio
FROM cliente C LEFT JOIN mayorista M ON M.cliente_cuit = C.cuit
WHERE C.razon_social LIKE 'A%S';


#d)
#Indicar el nombre de aquellos vehículos cuyo precio esté por encima del promedio
SELECT descripcion
FROM vehiculo
WHERE precio > ( SELECT AVG(precio) 
					FROM vehiculo );

#e)
# Mostrar la cantidad de unidades vendidas y facturación por cada categoría.
SELECT C.nombre, SUM(R.cantidad) as cantidad, SUM(R.precio) as facturacion
FROM categoria C
INNER JOIN vehiculo V ON V.cod_categoria =  C.cod_categoria
INNER JOIN renglon R ON R.cod_vehiculo = V.cod_vehiculo
GROUP BY C.cod_categoria, C.nombre;

#f)
#Para incentivar las ventas, todos aquellos vehículos que no hayan sido vendidos en todo el 2018, se verán reducidos un 10% en su precio.
UPDATE vehiculo V
SET V.precio = V.precio * 0.9 
WHERE V.cod_vehiculo NOT IN (
	SELECT DISTINCT R.cod_vehiculo as codigo
	FROM renglon R 
	INNER JOIN factura F ON R.cod_factura = F.cod_factura
	WHERE F.fecha > '2018-01-01 00:00:00' AND F.fecha < '2018-12-31 23:59:59');


#g)
#Indicar el nombre y teléfono de clientes que hayan adquirido todos los vehículos (inclusive en diferentes compras)
SELECT C.razon_social, M.telefono 
FROM cliente C LEFT JOIN minorista M ON M.cliente_cuit = C.cuit
WHERE C.cuit IN (
			SELECT T.cliente_cuit FROM ( 
										SELECT DISTINCT F.cliente_cuit as cliente_cuit, R.cod_vehiculo as codigo 
                                        FROM factura F INNER JOIN renglon R ON R.cod_factura = F.cod_factura ) as T
										GROUP BY T.cliente_cuit
										HAVING count(*) = (SELECT count(*) FROM vehiculo)
);



#h)
SELECT V.descripcion as faltante, V2.descripcion as reemplazo FROM vehiculo V 
INNER JOIN similar S ON S.vehiculo_1 = V.cod_vehiculo
INNER JOIN vehiculo V2 ON S.vehiculo_2 = V2.cod_vehiculo
WHERE V.stock = 0 AND V2.stock > 0;

#i)
#Listar nombre, descripción de categoría y precio de los vehículos vendidos el 28/02/2017 a clientes de la provincia de Córdoba
SELECT V.descripcion as vehiculo, C.nombre as categoria, R.precio
FROM vehiculo V
INNER JOIN categoria C ON C.cod_categoria = V.cod_categoria
INNER JOIN renglon R ON R.cod_vehiculo = V.cod_vehiculo
INNER JOIN factura F ON F.cod_factura = R.cod_factura
INNER JOIN cliente CLI ON CLI.cuit = F.cliente_cuit
INNER JOIN localidad L ON L.cod_localidad = CLI.cod_localidad
INNER JOIN provincia P on P.cod_provincia = L.cod_provincia
WHERE P.nombre = 'Cordoba' AND F.fecha > '2017-02-28 00:00:00' AND F.fecha <'2017-02-28 23:59:59';

#j)
#Listar la cantidad de reparaciones por categoría ordenados de mayor a menor.
SELECT * FROM (
	SELECT C.nombre, count(*) as cantidad FROM categoria C 
		INNER JOIN vehiculo V ON V.cod_categoria = C.cod_categoria
		INNER JOIN reparacion R ON R.cod_vehiculo = V.cod_vehiculo
		GROUP BY C.nombre ) AS T 
ORDER BY T.cantidad DESC;
