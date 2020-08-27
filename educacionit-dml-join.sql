/*Consulta Multitablas*/
	-- clases, profesores, cursos
	SELECT 
		id_clase,
		p.apellido,
		p.nombre,
		c.nombre,
		dia,
		hora
	FROM clases
	JOIN profesores AS p
	ON clases.id_profesor = p.id_profesor
	INNER JOIN cursos AS c
	ON clases.id_curso = c.id_curso
	LIMIT 20;
    
	-- Clases_Detalle
    SELECT 
		cd.id_detalle,
        a.apellido AS "Alumno - Apellido",
        a.nombre AS "Alumno - Nombre",
        p.apellido AS "Profesor - Apellido",
        p.nombre AS "Profesor - Nombre",
        cur.nombre AS "Curso",
        cla.dia,
        cla.hora,
        cd.observaciones,
        count(cd.id_detalle) AS total
    FROM clases_detalle AS cd
    JOIN alumnos AS a
		ON cd.id_alumno = a.id_alumno
    JOIN clases AS cla
		ON cd.id_clase = cla.id_clase
    JOIN profesores AS p
		ON cla.id_profesor = p.id_profesor
    JOIN cursos AS cur
		ON cla.id_curso = cur.id_curso
    GROUP BY curso, dia, hora
    HAVING total >= 10;