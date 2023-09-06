/* DDL - Data Definition Language */
# tabla Alumnos
CREATE TABLE students (
	id INT AUTO_INCREMENT,
    userId INT,
    PRIMARY KEY(id),
    FOREIGN KEY(userId) REFERENCES users(user_id)
);
# Tabla Calificaciones
CREATE TABLE exams (
	id INT AUTO_INCREMENT,
    student INT,
    course INT,
    note DECIMAL(4,2), -- (n,d) n cantidad total de digitos | d cantidad de decimales
    module INT,
    PRIMARY KEY(id),
    FOREIGN KEY(student) REFERENCES students(id),
    FOREIGN KEY(course) REFERENCES courses(id)    
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
INSERT INTO exams
SET student = CEIL(RAND() * 10), -- redondear para arriba
    course = FLOOR(RAND() * 4 + 1), -- redondear para abajo
    note = RAND() * 7 + 3, -- numero aleatorio entre 3 y 10
    module = ROUND(RAND() * 5); -- redondear segun corresponda
    
SELECT * FROM exams;
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
ORDER BY course;
# ESTADISTICAS
SELECT * FROM exams;
## Rendimiento General
SELECT 
	COUNT(note) AS exams, -- cantidad de evaluaciones
    ROUND(AVG(note), 2) AS average, -- promedio de la columna notas
	MIN(note) AS lowest, -- valor mas bajo de notas
    MAX(note) AS highest -- valor mas alto de notas
FROM exams;
## Rendimiento por capacitacion
SELECT 
	course, module,
	COUNT(note) AS exams, 
	ROUND(AVG(note), 2) AS average,
	MIN(note) AS lowest, 
    MAX(note) AS highest
FROM exams
GROUP BY course; -- agrupado por curso
## Rendimiento general por alumno
SELECT * FROM exams;
SELECT 
	student,
    COUNT(course) AS courses,
    ROUND(AVG(note), 2) AS average,
    GROUP_CONCAT("  ", course,".",module,": ", note) AS notes
FROM exams
GROUP BY student;