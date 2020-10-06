## Insertar Registros completos
	INSERT INTO proveedores
		VALUES (
		'',
		'HP',
		'30-26789410-8',
		'Av. Hewllet Packard 53',
		2436,
		'11-4675-1234',
		'info@hp.com',
		'proveedor Notebooks / Impresoras'
		);
	SELECT * FROM proveedores;		
    
## Insertar registros (Campos especificos)
	INSERT INTO proveedores(cuil, proveedor, direccion)
		VALUES 
			('27-12398471-4', 'Dell', 'Av. Siempreviva 2020'),
			('14-11238498-2', 'Apple', 'Californica 51'),
			('25-12934801-1', 'Samsung', 'Korea 1286');

## Carga de Productos
	INSERT INTO productos(marca, modelo, precio, stock, id_proveedor)
		VALUES 
			('HP', '9460pb', 28999, 180, 1),
			('HP', '2b16nr', 16500, 80, 1),
            ('Apple', '1103', 59999, 50, 3),
            ('Samsung', 'np150',17899,100,4),
            ('Dell','v4200', 23899, 90,2);

-- insercion de productos
INSERT INTO productos (marca, modelo, precio, stock)
	VALUES
		('atma', 'procesadora', 13500,5000),
        ('liliana','ventilador industrial', 18959, 3500),
        ('nestle','cafetera dolce gusto',9999,8900),
        ('nike', 'campera', 5400, 3000),
        ('adidas','zapatillas',6500, 2000),
        ('kappa','buzo', 3200, 20000),
        ('liliana','licuadora',8799, 5000);

## Obtener Productos por marca
	SELECT 
		marca,
        ROUND(AVG(precio),2) as 'Promedio $/u', -- Promedio calculado
        SUM(precio*stock) as 'Total a Recaudar' -- Total Final Calculado
    FROM productos
    GROUP BY marca; -- campo de agrupacion

## campo con valor estatico
	SELECT *, 'Reponer' as Situacion 
		FROM productos
		WHERE precio >= 20000 AND stock < 100; -- condiciones
		/*Tablas de La verdad
	AND	c1F	c1V
    c2F	F	F
    c2V	F 	V
    
    OR	c1F	c1V
    c2F	F	V	
    c2V	V 	V	
*/

##eliminacion de registros
	DELETE FROM productos WHERE id_producto = 2;

## carga de clientes
	INSERT INTO clientes(apellido, nombre, num_doc)
    VALUES
		('Aesir','Alan', 35390112),
        ('Baxter','Brian', 9427391),
        ('Campos','Cristian',54321023),
        ('Draco','Damian', 24019283),
        ('Lopez','Lucia', 64109238),
        ('Perez','Pedro',23082893),
        ('Ruben','Ricardo',18840380);

## eliminar registros vacios tipo_doc
	DELETE FROM clientes WHERE tipo_doc IS NULL;

## consulta digitos por separados cuil
	SELECT 
		proveedor, 
		LEFT(cuil, 2) AS 'N° inicial',
		SUBSTRING(cuil, 4, 8) AS 'documento',
		RIGHT(cuil,1) AS 'N° final'
	FROM proveedores;

## consultas con operadores
	SELECT * FROM productos
	WHERE 
		marca IN ('HP', 'Apple') -- condicion 1
		AND precio BETWEEN 26000 AND 60000 -- condicion 2
		AND stock BETWEEN 50 AND 100; -- condicion 3
			
## actualizar los valores de los correos a minusculas
	UPDATE proveedores
		SET correo = LOWER(CONCAT('info@',proveedor,'.com'))
		WHERE correo IS NULL;
		
## Carga de datos
	INSERT INTO facturacion (tipo, categoria, id_cliente, fecha)
		VALUES 
			(2,2,1,'2020-09-22,14:00'),
			(1,4,4,'2020-09-23,15:00');
## detalle facturacion
	SELECT * FROM facturacion_detalle;
	INSERT INTO facturacion_detalle (id_factura, id_producto, cantidad)
		VALUES 
			(1,4,1),
			(1,6,2),
			(1,7,2);

## consulta de precios de los productos vendidos
		SELECT id_producto, precio 
		FROM productos 
		WHERE id_producto IN(4,6,7);
		
## actualizacion de precios
	UPDATE facturacion_detalle
	SET precio =
		CASE
			WHEN id_producto = 4 THEN 16500
			WHEN id_producto = 6 THEN 17899
			WHEN id_producto = 7 THEN 23899
		END;
			
##consulta de totales
	SELECT 
		id_factura,
		SUM(precio*cantidad) as Total
	FROM facturacion_detalle
	GROUP BY id_factura
	ORDER BY id_factura DESC, id_producto DESC;

## actualizacion registro facturacion
	UPDATE facturacion
		SET 
			monto = 100096, 
			porcentaje_iva = 21,
			iva = true
		WHERE id_factura = 1;

## filtro segun campo calculado
	SELECT 
		id_factura,
		tipo,
		categoria,
		monto,
		CONCAT(porcentaje_iva,'% +IVA') AS '% iva',
		ROUND(monto * porcentaje_iva/100, 2) AS valor_iva,
		ROUND(monto + porcentaje_iva * monto/100, 2) AS total
		FROM facturacion
		HAVING total >= 100000
		ORDER BY total;
        
## filtro segun caracter dentro de un campo
	SELECT id_cliente, apellido 
	FROM clientes 
	WHERE apellido LIKE '%c%';
    
INSERT INTO facturacion (tipo, categoria,id_cliente,fecha)
	VALUES
		(2,2,5,'2020-09-29,12:30'),
		(2,5,(
			SELECT id_cliente  -- consulta ID_CLIENTE
			FROM clientes 
			WHERE tipo_doc='pass' -- tipo PASS
			AND num_doc= 54321023 -- numero 54321023
			), '2020-09-29,10:00'),
		(2,6,7,'2020-10-01,14:00'),
		(1,7,3,'2020-10-01,15:00');