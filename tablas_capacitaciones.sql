/* DDL - Data Definition Language */
## Materias o Capacitaciones
CREATE TABLE courses (
	`id` INT AUTO_INCREMENT,
    `name` VARCHAR(50),
    `description` LONG,
    PRIMARY KEY (id),
    UNIQUE KEY (name)
);
## Instructores, Maestros y Profesores
CREATE TABLE teachers (
	`id` INT AUTO_INCREMENT,
    `user` INT,
    `signed` DATETIME DEFAULT CURRENT_TIMESTAMP(),
    `active` BOOLEAN DEFAULT TRUE,
    PRIMARY KEY(id),
    UNIQUE KEY(user),
    FOREIGN KEY(user) REFERENCES users(user_id)
);
## Asignacion de Cursos
CREATE TABLE courses_assignment(
	id INT AUTO_INCREMENT,
    course INT, -- id de curso
    teacher INT, -- id de instructor
    start_date DATE, -- fecha de inicio
    end_date DATE, -- fecha de fin
    day SET('L','M','X','J','V','S'), -- seleccion multiple
    start_time TIME, -- hora de inicio
    end_time TIME, -- hora de fin
    PRIMARY KEY(id),
    FOREIGN KEY(course) REFERENCES courses(id), -- tabla cursos
    FOREIGN KEY(teacher) REFERENCES teachers(id) -- tabla maestros
);
## Detalle de Cursos (Alumnos)
CREATE TABLE courses_detail(
	id INT AUTO_INCREMENT,
    student INT, -- futuro foreign key
    course INT, -- tabla cursos
    PRIMARY KEY(id),
    UNIQUE KEY(student, course),
    FOREIGN KEY(course) REFERENCES courses_assignment(id)
);

/* DML - Data Manipulation Language */
## Carga de Multiples Capacitaciones
INSERT INTO courses(name, description)
VALUES 
	('MySQL','Introduccion a Bases de Datos Relaciones'), -- 1
    ('MATEMATICAS','Operaciones artimeticologicas'), -- 2
    ('NTICs','Nuevas Tecnologias de la Informatica y la Comunicacion'), -- 3
	('FISICA','velocidad, aceleracion, gravedad, mru y mruv'), -- 4
    ('QUIMICA','formulas soluciones, acidos, anion, cation'), -- 5
    ('BIOLOGIA',''), -- 6
	('HTML5','Fundamentos Web con HTML y CSS'), -- 7
    ('SOCIALES',''), -- 8
    ('GEOGRAFIA',''), -- 9
    ('CCNA1','Fundamentos de Redes'), -- 10
    ('CCNA2','Enrutamiento y Conmutacion'), -- 11
    ('CCNA3','Redes Empresariales'); -- 12

# Carga por asignacion (Simple)
## Profesor Messi
INSERT INTO teachers SET 
user = (SELECT user_id FROM users WHERE username = 'Messi');

## Profesor Cristian
INSERT INTO teachers 
SET user = (SELECT user_id FROM users WHERE username = "Cristian"), -- subconsulta (id de usuario)
	signed = "2018-11-08 7:35:59"; -- "YYYY-MM-DD,HH:mm:ss"

# Asignacion de Cursos por Profesor
INSERT INTO courses_assignment(teacher, course, day)
VALUES
-- Cristian
	( teacher,
     (SELECT id FROM courses WHERE name ), -- MySQL
     "M,V"
    ),
-- Messi
	(
    
    );

## Consulta de Profesores
SELECT * FROM teachers;

## Profesores que ingresaron despues del 1/1/20
SELECT * FROM teachers
WHERE signed >= "2020-01-01";

## Cursos cuyo nombre empieza con M
SELECT * FROM courses WHERE name LIKE "M%"; -- % ninguno, uno o cualquier cantidad de caracteres
## Cursos que terminan en IA
SELECT * FROM courses WHERE name LIKE "%IA"; -- % cualquier cantidad de caracteres al princip
## Cursos que contengan las siglas SQL
SELECT * FROM courses WHERE name LIKE "%SQL%"; -- % cualquier cantidad al principio o al final
## Cursos cuya segunda letra sea I
SELECT * FROM courses WHERE name LIKE "_I%"; -- _ Un caracter cualquiera al inicio
## Cursos cuya penultima letra sea C
SELECT * FROM courses WHERE name LIKE "%C_" -- _ Un caracter cualquier al final