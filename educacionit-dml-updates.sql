/*Tabla Profesores*/
	SELECT * from profesores;
	-- Actualizacion de Estado
		UPDATE profesores
		SET estado = 
			CASE 										## INICIO del Condicional
				WHEN tipo_doc ='dni' 					## Activo: si tiene DNI && es PAR
					AND MOD(num_doc, 2) = 0 THEN true	## Evalua el resto de dividir num_doc entre 2
				WHEN tipo_doc <> 'dni' THEN false		## Inactivo: si no es DNI 
	            ELSE false								## Inactivo: para el resto de los Casos
	        END;										## FIN del Condicional
	-- Consulta de Cantidad
		SELECT 
			COUNT(apellido) as cantidad, ## Funcion Contar con alias: Cantidad
			estado 
		FROM profesores
		GROUP BY estado; ## Agrupado para diferenciar Estados
	-- identificacion de duplicados
		SELECT 
			GROUP_CONCAT(id_alumno) AS repeticiones, ## Agrupa los ID para distinguir duplicados
		    apellido,
		    nombre 
		FROM alumnos
		GROUP BY apellido, nombre ## Agrupa por Apellido y luego Por Nombre, para separar duplicados
		ORDER BY repeticiones DESC; ## Ordenado por Repeticiones de manera Descendente
	-- verificacion de duplicados
		SELECT * FROM alumnos
		WHERE id_alumno IN(176,177,186,187); ## Consulta los Registros identificados como Duplicados
	-- eliminacion de duplicados
		DELETE FROM alumnos ## Elimina los registros
		WHERE id_alumno IN(177, 187); ## cuyos valores estan entre los parentesis 
	-- consulta de Id
		SELECT id_profesor, apellido, nombre FROM profesores ## consulta los Id, Apellidos y Nombres
		WHERE apellido LIKE 'M%' OR nombre LIKE '%A'; ## Apellidos que empiecen con M || Nombres que terminen con A

/*Tabla Alumnos*/
	SELECT * FROM alumnos;
	-- Actualizacion de estado
		UPDATE alumnos
		SET estado = false	## Inactiva el estado del alumno
		WHERE apellido IS NULL OR apellido LIKE ''; ## si esta vacio o no tiene un valor
	-- Consulta de Promedios
		SELECT
			AVG(num_doc) AS Promedio, ## num_doc con alias Promedio
		    apellido,
		    nombre,
		    'Educacion IT' AS "Lugar de Estudios" ## Agregamos el campo "Lugar de Estudios" con valor 'Educacion IT'
		FROM alumnos
		GROUP BY estado ## Agrupa por estado para diferenciar
		HAVING Promedio > 100; ## Muestra los promedios Mayores a 100 (Campos Creados)
	-- Consulta de Alumno
		SELECT id_alumno, apellido, nombre FROM alumnos 
		WHERE apellido LIKE '%YAGAMI%' AND nombre LIKE '%IORI%'; ## Nombre contiene Yagami && Apellido contiene Iori