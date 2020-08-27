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