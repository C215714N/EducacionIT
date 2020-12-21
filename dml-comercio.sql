/*VERIFICACION ESTRUCTURA*/
	SHOW DATABASES; -- muestra db
	SHOW TABLES; -- muesta las tablas de la db
	DESCRIBE clientes; -- estructura de la tabla

##clientes	
	/*INSERCION DE DATOS*/
		-- metodo carga completa
			INSERT INTO clientes -- tabla seleccionada
			VALUES(
			0,
			'Racedo',
			'Cristian',
			1,
			35353535,
			'1991-04-18',
			1103034567,
			'cristiandracedo@hotmail.com',
			'creo que es instructor'
		); -- datos a cargar
		-- metodo carga selectiva
			INSERT INTO clientes(tipo_doc, num_doc, apellido, nombre) -- campos y orden
			VALUES (1,38383838, 'Racedo', 'Abel'); -- carga valores especificos
		-- metodo carga multiple
			INSERT INTO clientes(num_doc, apellido, nombre)
			VALUES 	(38373783,'Merlo','Ayelen'),
					(43567281,'Gomez','Ezequiel'),
					(9751234,'Lopez','Pablo'),
					(12357402,'Gimenez','Lucia');
	/*CONSULTA DE DATOS*/
		SELECT * -- todos los campos
		FROM clientes; -- tabla de origen
    
## proveedores
	/*CARGA MULTIPLE DE DATOS*/
		INSERT INTO proveedores(cuil, razon_social)
        VALUES 	('30-54203455-2', 'HP'),
				('30-63033748-4','SAMSUNG'),
                ('30-71210290-6','COMFORT'),
                ('27-92648148-2','VIVERE'),
                ('30-71200672-9','NESTLE'),
                ('30-68590417-5','COCA COLA'),
                ('30-71130359-2','MAROLIO'),
                ('23-25000046-4','LILIANA');
	/*CONSULTA DE DATOS*/
		SELECT * FROM proveedores;
	
## productos
	/*INSERCION DE DATOS*/
		INSERT INTO productos(modelo, categoria, id_proveedor)
        VALUES	('NOTEBOOK NP150',1 ,2 ),
				('NOTEBOOK 8470P',1 ,1 ),
				('LIMPIADOR 500ML',3 ,4 ),
				('SPLIT 3000FG',2 ,2 ),
				('LIMPIADOR 750ML',4 ,5 ),
                ('SMARTPHONE A10',1 ,2 ),
				('CONCENTRADO 1L',3 ,3 ),
				('VENTILADOR TURBO',2 ,8 ),
				('BOTELLA 3L',4 ,6 ),
                ('IMPRESORA ST5150',1 ,1 ),
				('INTERIOR 2L',3 ,4 ),
				('TOSTADORA 2P',2 ,8 ),
				('ACEITE 500ML',4 ,7 );
	/*CONSULTA DE DATOS*/
		SELECT * FROM productos;

/*CLAUSULAS*/
	-- productos "tecnologia"
		SELECT * FROM productos
		WHERE categoria = 1; -- condicion de la consulta
	-- productos "samsung"
		SELECT * FROM productos
        WHERE id_proveedor = 2;
	-- productos "tecnologia" && "samsung"
		SELECT * FROM productos
        WHERE
			id_proveedor = 2 OR
            categoria = 2;
    /*
		TABLAS DE LA VERDAD
        AND	|C2F|C2V	OR	|C2F|C2V
		C1F	| F	| F		C1F	| F	| V
		C1V	| F	| V		C1V	| V	| V
    */