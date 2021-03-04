USE comercio_lj_11;
/* ---------------------------------------
		Insercion de registros 
---------------------------------------- */
	-- carga completa (clientes)
    INSERT INTO clientes -- tabla seleccionada
    VALUES (
		0, 			-- id_cliente
        'Racedo', 	-- apellido
        'Cristian', -- nombre
        1,			-- tipo doc (dni: 1, dni_ex: 2)
        1,			-- sexo (m:1, f:2, o:3)
        35353535	-- num_doc
    );
	-- carga selectiva (proveedores)
    INSERT INTO proveedores(cuil, proveedor) -- tabla elegida(campos)
    VALUES ('30-71148154-7','LG');
	-- carga multiple (proveedores)
	INSERT INTO proveedores(cuil, proveedor)
    VALUES 
		('30-54203455-2', "HP"),
        ('30-63033748-4',"SAMSUNG"),
        ('30-70834210-2',"MOTOROLA"),
        ('27-27854149-0',"CANNON"),
        ('30-71473138-2',"LENOVO");
        
	-- carga multiple (productos)
    INSERT INTO productos(producto, cantidad, precio)
    VALUES 
		("impresora smartank 510", 5000, 25599.99), -- 1
        ("notebook elitebook 8470p", 15000, 65730.00), -- 2
        ("pendrive 32gb", 9000, 600), -- 3
        ("carry disk 2.5 usb3.0", 1200, 1059.99); -- 4
	-- Carga multiple ingreso_productos
    INSERT INTO ingreso_productos(id_producto, cantidad, precio, id_proveedor)
    VALUES
		(1,	2500,	20000,	2),
        (2,	15000,	57000,	2),
        (1,	2500,	21000,	6),
        (3,	6000,	450,	4),
        (4,	1200,	800,	5),
        (3,	3000,	420,	3);
	INSERT INTO clientes (apellido, nombre, num_doc)
	VALUES
		('Sanchez','Roberto',20542054),
		('Miguel','Luis', 25114173),
		('Sabina','Joaquin',13132071),
		('Funes','Romi Ramiro',17234281);
	-- ingreso por consulta
	INSERT INTO facturacion(id_cliente, tipo, tipo_pago)
    VALUES
		((SELECT id_cliente FROM clientes WHERE tipo_doc = 1 AND num_doc = '35353535'),2,2),
        ((SELECT id_cliente FROM clientes WHERE apellido = "sanchez"),2,1),
		((SELECT id_cliente FROM clientes WHERE nombre LIKE "Romi%"),2,3),
		((SELECT id_cliente FROM clientes WHERE sexo = 1 AND apellido LIKE "%do"),2,5),
        ((SELECT id_cliente FROM clientes WHERE num_doc = 13132071),2,2),
		((SELECT id_cliente FROM clientes WHERE apellido = "Miguel" AND num_doc = 25114173),1,1);
	
    INSERT INTO facturacion_detalle(id_factura, id_producto)
	VALUES
		(1,1),
        (1,2),
        (1,3),
        (1,4);
/* ---------------------------------------
		Consulta de registros 
---------------------------------------- */
	-- general
    SELECT * FROM clientes;
    SELECT * FROM proveedores;
    SELECT * FROM productos;
    SELECT * FROM ingreso_productos;
    SELECT * FROM facturacion;
    SELECT * FROM facturacion_detalle;
    -- campos especificos
    SELECT producto, precio  -- campos seleccionados
		FROM productos 		 -- tabla consultada
		ORDER BY precio DESC -- orden elegido
		LIMIT 2 			 -- cantidad de resultados X
		OFFSET 2; 			 -- a partir de la posicion X
	## consulta condicional
    	/*	TABLAS DE LA VERDAD
			AND	|c1F|c1V	OR	|c1V|c1F
			c2F	| F	| F		c2V	| V	| V		
			c2V	| F	| V		c2F	| V	| F
		*/
    -- productos con stock mayor o igual a 9000 y precio menor o igual a 1000
    SELECT * 
		FROM productos
        WHERE cantidad >= 9000
        AND precio <= 1000;
	-- productos que empiecen "pen" y la cantidad sea 9000 aprox.
    SELECT *
		FROM productos
        WHERE cantidad LIKE '90__'	-- _: caracter cualquiera
        AND producto LIKE 'pen%'; 	-- %: conjunto de caracteres
	-- productos cuya cantidad se encuentra en (1200, 1500, 5000)
    /* WHERE cantidad = 1200 OR cantidad = 15000 OR cantidad = 5000 OR cantidad = 9000 */
    SELECT * 
		FROM productos
        WHERE cantidad IN(1200, 15000, 5000); -- solo los valores indicados
	-- todos los productos cuyo precio ronde entre 10000 y 100000
    /*	WHERE precio >= 10000 AND precio <= 100000 */
    SELECT * 
		FROM productos
        WHERE precio BETWEEN 10000 AND 100000; -- todos los valores intermedios
