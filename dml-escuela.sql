USE escuela;
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
    
## profesores
	INSERT INTO profesores(correo, apellido, nombre, tipo_doc, num_doc)
    VALUES 
		('cristiandracedo@hotmail.com', 'racedo', 'cristian', 1, 12345678),
        ('habia_una_vez@fantasia.com', 'gutierrez', 'luis', 2, 48123498),
        ('erase_una_vez_en_mexico@balada.com', 'sans', 'alejandro', 1 ,8973912);
SELECT * FROM profesores;

	SELECT * FROM alumnos;
	DELETE FROM alumnos WHERE id_alumno = 3; -- elimina los registros que cumplan la condicion
	UPDATE alumnos SET correo = NULL WHERE id_alumno = 3; -- actualiza los registros en donde se cumpla la condicion
	DELETE FROM profesores; -- elimina todos los registros (no reinicia los contadores)
	TRUNCATE profesores; -- reinicia la tabla (elimina los registros)
    
/*Tabla Cursos*/
	INSERT INTO cursos (duracion,nombre)
    VALUES('12:00','introduccion base datos'),
			('12:00', 'fundamentos web'),
            ('36:00', 'fundamentos redes');
	
    UPDATE cursos -- tabla
		SET duracion = '12:00' -- valor actualizado
        WHERE duracion = '12'; -- condicion: valor original
    
    UPDATE cursos
		SET duracion =
			CASE
				WHEN duracion = '12' then '12:00'
                WHEN duracion = '36' then '36:00'
                ELSE '24:00'
            END;
/*Tabla clases*/
	INSERT INTO clases (dia,horario, id_curso,id_profesor)
		VALUES (4,3,1,1);
SELECT * FROM cursos;