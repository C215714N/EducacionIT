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
		VALUES ('HP', '2b16nr', 16999, 1);
	TRUNCATE proveedores;