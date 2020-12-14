/*VERIFICACION ESTRUCTURA*/
	SHOW DATABASES; -- muestra db
	SHOW TABLES; -- muesta las tablas de la db
	DESCRIBE clientes; -- estructura de la tabla

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
		INSERT INTO clientes(tipo_doc, num_doc, apellido, nombre) -- campos y orden elegido
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