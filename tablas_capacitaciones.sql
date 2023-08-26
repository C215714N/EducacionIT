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
-- Cursos asignados a Cristian
	( (SELECT id FROM teachers WHERE user = (SELECT user_id FROM users WHERE username = "cristian") ), -- subconsulta anidada
	( SELECT id FROM courses WHERE name LIKE "%SQL%" ),	"M,V"), -- MySQL
    ( 1, (SELECT id FROM courses WHERE name LIKE "%HTM%"), "M,J"),-- HTML5
-- Cursos asignados a Messi
	( (SELECT id FROM teachers WHERE user = (SELECT user_id FROM users WHERE username = "Messi") ), -- subconsulta anidada
	( SELECT id FROM courses WHERE name LIKE "FIS%"),"X,V"), -- FISICA
    ( 2, (SELECT id FROM courses WHERE name LIKE "BIO%"), "L,J"); -- BIOLOGIA

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
SELECT * FROM courses WHERE name LIKE "%C_"; -- _ Un caracter cualquier al final

# Consulta de Cursos Asignados
SELECT * FROM courses_assignment;

## Actualizacion de Horarios Segun el dia
UPDATE courses_assignment -- Tabla a actualizar
SET start_time = -- actualizacion condicional
	CASE -- inicio de la actualizacion por casos
		WHEN day LIKE "%V%" THEN "10:00" -- si contiene V entonces: 10hs
		WHEN day LIKE "%L%" THEN "14:00" -- si NO contiene V y contiene L entonces: 14hs
		ELSE "20:00" -- Si no contiene V ni L entonces para todos los demas casos: 20hs
	END, -- fin del analisis por casos
	end_time = ADDTIME(start_time, "02:00") -- el valor de la hora + 2HS
WHERE start_time IS NULL; -- Actualiza el registro si el horario de inicio no existe

## Actualizacion de Fechas de Inicio y fin para Cristian
UPDATE courses_assignment
SET start_date = "2023-07-18", -- asignacion de valor
	end_date =  -- actualizacion condicional
    CASE -- inicio de actualizacion por casos 
		WHEN day LIKE "%V%" THEN "2023-09-01" -- si contiene V entonces: 1/9/23
        ELSE "2023-08-22" -- si no es V, para los demas casos: 22/8/23
    END -- fin de la actualizacion por casos
WHERE teacher = 1 AND start_date IS NULL; -- profesor Cristian y que no posea fecha de inicio

## Actualizacion de Fechas para Messi (por descarte)
UPDATE courses_assignment
SET start_date = -- Actualizacion condicional
	CASE
		WHEN day LIKE "%X%" THEN "2023-07-12"
        ELSE "2023-07-27"
	END,
    end_date = ADDDATE(start_date, INTERVAL 28 DAY) -- agrega un intervalo de 28 a la fecha de inicio
WHERE start_date IS NULL; -- solamente actualiza si NO EXISTE la fecha de inicio

## Consulta calculada
SELECT 
	id, 
    teacher, 
    course, 
    DATEDIFF(end_date, start_date) AS days, -- ALIAS (apodo para referirnos al campo calculado)
    TIMEDIFF(end_time, start_time) AS time, -- ALIAS (campo que NO EXISTE en la tabla original)
    day
FROM courses_assignment
WHERE start_time >= "10:00" AND start_time <= "18:00" -- entre las 10hs y las 18hs
HAVING days >= 30; -- Condicion para Campos Calculados (ALIAS)