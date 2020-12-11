USE escuela;
SELECT * FROM alumnos;
SELECT * FROM clases_detalle;
SELECT * FROM clases;
SELECT * FROM cursos; 
SELECT * FROM profesores;
/* insercion de registros */
## CLASES con Consulta
	INSERT INTO clases (dia, horario, id_curso, id_profesor)
	VALUES (
		1,
		1,
		(SELECT id_curso FROM cursos WHERE nombre LIKE '%react%'),
		(SELECT id_profesor FROM profesores WHERE apellido LIKE'%sans%')
		);
## CLASES_DETALLE con Consulta
	INSERT INTO clases_detalle(id_clase, id_alumno)
		VALUES 
			(3, (SELECT id_alumno FROM alumnos WHERE num_doc = 154278881 )),
			(3, (SELECT id_alumno FROM alumnos WHERE num_doc = 4627838 )),
			(3, (SELECT id_alumno FROM alumnos WHERE num_doc = 12367881 )),
			(3, (SELECT id_alumno FROM alumnos WHERE num_doc = 46123738 ));
/*JOIN - Tabla temporal con la informacion solicitada */
	SELECT 
		id_detalle, id_clase, c.id_alumno, 
		apellido, nombre, tipo_doc, num_doc 
	FROM alumnos AS a -- left JOIN
	LEFT JOIN clases_detalle AS c -- right JOIN
	ON c.id_alumno = a.id_alumno;

SELECT * FROM facturacion;
/* Busqueda de alumnos duplicados */
	SELECT GROUP_CONCAT(id_alumno) AS id, apellido, nombre, tipo_doc, num_doc 
	FROM alumnos
	GROUP BY apellido, nombre;
	-- Verificacion de Datos
	SELECT * FROM alumnos WHERE id_alumno IN(1,3);
    -- Corroboracion de Relaciones
		SELECT * FROM clases_detalle WHERE id_alumno IN(1,3);
		SELECT * FROM facturacion WHERE id_alumno IN(1,3);
	-- Eliminacion del valor Desvinculado
    DELETE FROM alumnos WHERE id_alumno = 1;
    
SELECT * FROM facturacion;
## campo numero de Factura
	ALTER TABLE facturacion
		ADD COLUMN num_factura INT AFTER factura;
	UPDATE facturacion
		SET num_factura = id_factura;
	
    INSERT INTO facturacion_temp(id_alumno, tipo, factura, num_factura)
		VALUES
			((SELECT id_alumno FROM alumnos WHERE apellido = 'gomez'),
			2,
            2,
            (SELECT COUNT(factura) + 1 FROM facturacion WHERE factura = 2));
	
    CREATE TABLE facturacion_temp (
        id_alumno INT,
        tipo INT,
        factura INT,
        num_factura INT
    );
    SELECT * FROM facturacion_temp;
    DELETE FROM facturacion_temp;
    
    UPDATE alumnos
		SET apellido = 'gutierrez'
        WHERE apellido IN('sanchez', 'lopez', 'racedo');