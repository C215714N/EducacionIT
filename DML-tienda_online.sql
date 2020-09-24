SELECT * FROM proveedores;
## Cargar Registro completo
	INSERT INTO proveedores
	VALUES (
		'',
		'HP',
		'20-36257841-8',
		'Av. Hewlett Packard 2910',
		2560,
		'11-2381-9472',
		'info@hpcom',
		'Proveedor de impresoras y notebooks'
	);
## Cargar multiples registros de manera selectiva
    INSERT INTO proveedores(cuil, proveedor, direccion) -- especificamos los campos a cargar
		VALUES 
			('25-12093489-2','Dell','cuchacucha 2020'),
			('34-12384012-9','Apple','california 56'),
			('18-12834002-1','Musimundo','cochabamba 1230'),
			('10-82374928-2','Toshiba','Bs.As. 12090');

## actualizacion de Datos
	UPDATE proveedores
    SET correo = 'info@hp.com'
    WHERE proveedor = 'HP';
    
## consulta los datos de productos
	SELECT * from productos;
## cargamos productos
    INSERT INTO productos(marca, modelo, precio, id_proveedor)
		VALUES 
			('Dell', 'np300', 25999, 2),
			('HP', 'Elitebook 8470p', 28599, 4),
            ('Apple', 'Iphone 6 Gold', 65899, 3),
            ('Toshiba', '5320', 23000, 5),
			('Samsung','np150', 12599, 4);
	
## carga de Clientes
	INSERT INTO clientes(nombre, apellido, num_doc, fecha_nac)
    VALUES
		('Luis','Lesama',35809801,'1991-04-29'),
        ('Pedro','Pedraza',24980568,'1986-09-12'),
        ('Juan','Juarez',59123492,'1989-03-24'),
        ('Beatriz','Balderrama',94578312,'1978-05-15'),
        ('Laura','Lopez',36129382,'1993-08-08');
	
    SELECT * FROM clientes;
    
		/*
			lc <= 15000000
            dni <= 5000000
            pass <= 8000000
            ci 
        */
## actualizacion condicional
	UPDATE clientes
    SET tipo_doc = 
		CASE
			WHEN num_doc <= 15000000 THEN 'lc'
            WHEN num_doc <= 50000000 THEN 'dni'
            WHEN num_doc <= 80000000 THEN 'pass'
            ELSE 'ci'
		END;
			
	SELECT * FROM productos;
## actualizacion del stock
	UPDATE productos
	SET stock =
		CASE
			WHEN marca IN ('HP', 'Samsung', 'Apple') THEN 200
            ELSE 100
		END;
	UPDATE productos SET categoria = 'tecnologia';
    
SELECT marca, precio, stock, SUM(precio*stock) AS 'Total productos'
FROM productos
WHERE stock > 150
GROUP BY marca
ORDER BY marca;