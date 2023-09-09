/* INNER JOIN: Solamente los elementos coincidentes de ambas tablas */
## Nombre de alumnos y capacitaciones donde se hayan rendido examenes
SELECT 
	s.id,
	CONCAT_WS(", ", lastname, firstname) AS student,
    name AS course,
    module,
    note
FROM exams AS e -- tabla base para la union
INNER JOIN courses AS c ON c.id = e.course -- solamente cursos que existan en examenes
INNER JOIN students AS s ON s.id = e.student -- solamnete alumnos que existen en examenes
INNER JOIN users_data AS u ON u.userId = s.userId; -- datos de usuario de alumnos que existen en examene

/* OUTTER JOIN: Todos los campos de una tabla y las coincidencias de otra */
## Capacitaciones que aun no fueron asignadas a un profesor
SELECT 
	name,
    day
FROM courses_assignment AS ca
RIGHT JOIN courses AS c ON c.id = ca.course
WHERE day IS NULL;

## Capacitaciones en las que aun no se rindieron examenes
SELECT 
	name,
    module,
    COUNT(note) AS exams
FROM courses AS c
LEFT JOIN exams AS e ON e.course = c.id -- Todos los cursos y solamente los examenes rendidos
WHERE module IS NULL -- donde no exista valor de modulo en examenes
GROUP BY name, module -- agrupado por capacitacion y luego por modulo
HAVING exams = 0; -- donde el valor de exams sea 0 (campo calculado)

## Usuarios que aun no cargaron sus datos personales
SELECT
	user_id,
	username,
	ud.id
FROM users AS u
LEFT JOIN users_data AS ud ON ud.userId = u.user_id
WHERE id IS NULL;

/* CROSS JOIN: Todos los campos de ambas tablas cruzados*/
## Combinaciones posibles de capacitaciones que puede realizar los alumnos
SELECT 
	CONCAT_WS(" ", lastname, firstname) AS student,
    name
FROM users_data AS ud
JOIN students AS s ON s.userId = ud.userId -- INNER JOIN (coincidencia)
JOIN courses -- CROSS JOIN (combinacion)
ORDER BY student;
