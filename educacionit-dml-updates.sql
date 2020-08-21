SELECT * from profesores;

UPDATE profesores
SET estado = 
		CASE
			WHEN tipo_doc ='dni' AND MOD(num_doc, 2) = 0 THEN true
			WHEN tipo_doc <> 'dni' THEN false
            ELSE false
        END;

SELECT 
	COUNT(apellido) as cantidad,
	estado
FROM profesores
GROUP BY estado;
-- identificacion de duplicados
SELECT 
	GROUP_CONCAT(id_alumno) AS repeticiones, 
    apellido,
    nombre 
FROM alumnos
GROUP BY apellido, nombre
ORDER BY repeticiones DESC;

-- verificacion de duplicados
SELECT * FROM alumnos
WHERE id_alumno IN(176,177,186,187);

-- eliminacion de duplicados
DELETE FROM alumnos 
WHERE id_alumno IN(177, 187); 

UPDATE alumnos
	SET estado = false
	WHERE apellido IS NULL OR apellido LIKE '';

SELECT
	AVG(num_doc) AS cantidad,
    apellido,
    nombre,
    'Educacion IT' AS "Lugar de Estudios"
FROM alumnos
GROUP BY estado
HAVING cantidad > 100;

SELECT id_profesor, apellido, nombre FROM profesores
WHERE apellido LIKE 'M%' OR nombre LIKE '%A';

INSERT INTO clases(id_profesor,id_curso,dia,hora)
	VALUES 	(1,3,4,'19:00'),
			(5,2,2,'15:00');
SELECT * from clases;
SELECT id_alumno, apellido, nombre 
FROM alumnos 
WHERE apellido LIKE '%YAGAMI%' AND nombre LIKE '%IORI%';