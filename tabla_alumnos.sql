/* DDL - Data Definition Language */
# tabla Alumnos
CREATE TABLE students (
	id INT AUTO_INCREMENT,
    userId INT,
    PRIMARY KEY(id),
    FOREIGN KEY(userId) REFERENCES users(user_id)
);

/* Data Manipulation Language */
## Carga de Alumnos
INSERT INTO students(userId)
VALUES (13),(8),(15),(12),(9),(11),(10),(17),(14),(16);

# Asignacion de alumnos por Capacitacion
INSERT INTO courses_detail(course, student) 
VALUES
	(4,10),(4,8),(4,6),(4,2),(4,1), -- BIOLOGIA Lu-Ju 14-16 	(id:4)
	(1,5),(1,7),(1,2),(1,3),(1,8),	-- MySQL Ma-Vi 10-12 		(id:1)
	(2,8),(2,1),(2,6),(2,10),(2,7), -- HTML5 Ma-Ju 20-22 		(id:2)
	(3,9),(3,1),(3,10),(3,2),(3,4); -- FISICA Mi-Vi 10-12		(id:3)

# Consulta de Nombres de cursos con dias y horarios
SELECT * FROM courses AS c, courses_assignment AS ca -- invoco 2 o mas tablas simultaneamente
WHERE c.id = ca.course; -- defino la relacion entre ambas (evitar duplicidad)

## Carga aleatoria de datos

    
# Estadisticas 
## Total de alumnos
SELECT COUNT(userId) AS total_students 
FROM students;
    
## Cantidad de Alumnos por Curso
SELECT 
	course,
	COUNT(student) AS total -- cuenta los valores de la columna
FROM courses_detail
GROUP BY course -- criterio de agrupacion
ORDER BY course
