/*consulta de datos*/
	SELECT * FROM alumnos;

/* insercion de datos */
	## completa
		INSERT INTO alumnos 
        VALUES (
			0,
            'racedo',
            'cristian',
            4,
            12345678,
            '1991-04-18',
            '(11)0303-4567',
            'cristiandracedo@hotmail.com',
            'Debemos escribir algo y por lo tanto 
				vamos a rellenar con un comentario'
        );
	## opcional 
		INSERT INTO alumnos(nombre,apellido, tipo_doc, num_doc)
        VALUES ('ricardo', 'ruben', 2, 46123738);
	## multiples
		INSERT INTO alumnos(apellido, tipo_doc, num_doc)
        VALUES
			('ramirez',2,61478923),
            ('perez',3,15427881),
            ('lopez',4,1234567),
            ('perez',2,17236453),
            ('diaz',1,63212903);

/*consultas*/
	## alumnos con lc > 2 millones | alumnos con dni < 60 millones
	SELECT apellido, nombre,tipo_doc, num_doc -- campos seleccionados
    FROM alumnos -- tabla de origen
    WHERE (tipo_doc = 4 AND num_doc >= 2000000)
	OR (tipo_doc = 1 AND num_doc < 60000000); -- condicion
    /*	TABLAS DE LA VERDAD
        AND| C1f| C1v	OR | C1f | C1v
        C2f| F	| F		C2f| F	 | V
        C2v| F	| V 	C2v| V	 | V
    */