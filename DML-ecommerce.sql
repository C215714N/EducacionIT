SELECT * FROM proveedores;
 -- Insertar Registros completos
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
		
-- Insertar registros (Campos especificos)
	INSERT INTO proveedores(cuil, proveedor, direccion)
		VALUES 
			('27-12398471-4', 'Dell', 'Av. Siempreviva 2020'),
			('14-11238498-2', 'Apple', 'Californica 51'),
			('25-12934801-1', 'Samsung', 'Korea 1286');
## actualizacion de campo especifico
	UPDATE proveedores
		SET cp = 3164
		WHERE id_proveedor = 2;
			
	UPDATE proveedores
		SET telefono = '3856-1190-9182'
		WHERE proveedor = 'Apple';

-- Carga de Productos
	INSERT INTO productos(marca, modelo, precio, stock, id_proveedor)
		VALUES 
			('HP', '9460pb', 28999, 180, 1),
			('HP', '2b16nr', 16500, 80, 1),
            ('Apple', '1103', 59999, 50, 3),
            ('Samsung', 'np150',17899,100,4),
            ('Dell','v4200', 23899, 90,2);
	SELECT * from productos;

-- Productos por marca
	SELECT 
		marca,
        ROUND(AVG(precio),2) as 'Promedio $/u', -- Promedio calculado
        SUM(precio*stock) as 'Total a Recaudar' -- Total Final Calculado
    FROM productos
    GROUP BY marca;
    
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
DELETE FROM productos WHERE id_producto = 2;

SELECT * FROM clientes;
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

-- actualizar el tipo_doc
	UPDATE clientes 
    SET tipo_doc = 
		CASE
			WHEN num_doc <= 15000000 THEN 'lc'
            WHEN num_doc <= 54000000 THEN 'dni'
            WHEN num_doc <= 80000000 THEN 'pass'
            ELSE 'ci'
        END;
/*
	lc <= 15
    dni <= 54
    pass <= 80
    ci
*/
TRUNCATE proveedores;
DELETE FROM clientes WHERE telefono IS NULL;