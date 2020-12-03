select * from clases;
select * from clases_detalle;
select * from alumnos;

SELECT COUNT(apellido) 
FROM alumnos;
INSERT INTO clases_detalle(id_clase, id_alumno)
VALUES 
	(2,3), 
    (2,4), 
    (2,6), 
    (2,8), 
    (2,20);

INSERT INTO cursos(nombre, duracion)
	VALUES 
		('maquetacion web','18'),
		('maquetado avanzado', '15'),
		('reactjs', '12'),
		('switching & routing', '30'),
		('full office','48');
        
SELECT * FROM cursos;
/*actualizaciones*/
	## actualizacion condicional
	UPDATE cursos -- tabla a actualizar
	SET duracion = '12:00' -- valor de actualizacion
	WHERE id_curso IN(1, 2, 6); -- valores de referencia
    
    ## actualizacion con casos
	UPDATE cursos
		SET monto = 
			CASE
				WHEN duracion <= '12:00' THEN 2400 -- condicion A
				WHEN duracion <= '18:00' THEN 3600 -- condicion B | si A no se cumple
				WHEN duracion <= '24:00' THEN 4800 -- condicion C | si AB no se cumple
				ELSE 7200 -- valor | si ABC no se cumple 
			END;
			
	UPDATE cursos 
		SET duracion = 
			CASE
				WHEN duracion = '12' THEN '12:00'
				WHEN duracion = '18' THEN '18:00'
				WHEN duracion = '30' THEN '36:00'
				WHEN duracion = '48' THEN '48:00'
					ELSE '15:00'
			END;