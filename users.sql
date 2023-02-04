/*  DDL: Data Definition Language
	creacion / eliminacion / modificacion
    db / tablas / usuarios
*/

# Definicion de la base de datos
DROP DATABASE IF EXISTS hospital_business; -- eliminamos si existe
CREATE DATABASE hospital_business; -- creamos la db
USE hospital_business; -- seleccionamos la db

# Definicion de Tablas
/* Personal => turno/guardia
			=> especialidad
            => servicios
   Usuarios => turno/guardia
			=> datos => historia
            => Insumos => ventas
*/

CREATE TABLE users(
	id INT AUTO_INCREMENT, -- numero automatico
    username VARCHAR(20), -- cadena de texto
    userpass VARCHAR(20), -- 20 caracteres maximo
    employee BOOLEAN, -- verdadero o falso
    # Restricciones
    PRIMARY KEY(id), -- clave principal (relacional)
    UNIQUE KEY(username) -- campo unico (local)
);
# modificacion de estructura
ALTER TABLE users
MODIFY employee BOOLEAN DEFAULT false, -- modificamos el campo
ADD COLUMN created DATETIME DEFAULT current_timestamp; -- agregamos un campo (al final)
# descripcion de la estructura
DESCRIBE users;

/* DML: Data Manipulation Language
	insertar / eliminar / actualizar / consultar
    registros (filas)
*/
# reinicio de tabla (eliminar registros)
TRUNCATE users; -- vuelve el contador a 0

# Carga selectiva de datos
INSERT INTO users(username, userpass)
VALUES ('cristian', 'root');

INSERT INTO users(username, employee, userpass)
VALUES ('c215714n', true, 'r00t');

# Carga Multiple
INSERT INTO users(username, userpass)
VALUES	('Maria', 'pass'),
		('R4m1r0','user'),
        ('Damian','access'),
        ('c215714n!#','vtodyosm'),
        ('admin','d48w58qj');


INSERT INTO users(username, userpass, employee)
VALUES	('Pepe', 'pipo', false),
		('d4c','acdc', true),
        ('rem','l0s1n6', true),
        ('opm','h3r0',false);
        
# consulta general de datos
SELECT * FROM users;

DELETE FROM users
WHERE username = 'nek';
INSERT INTO users(username, userpass)
VALUES ('nek','lauranonce');

# actualizacion de roles
## definicion de usuarios (pacientes)
UPDATE users
SET employee = 0 -- valor de actualizacion
WHERE id BETWEEN 3 AND 7; -- condicion: entre 3 y 7 inclusive

## definicion de usuarios (empleados)
UPDATE users
SET employee = 1 -- valor de actualizacion
WHERE username IN('Maria','c215714n!#','admin'); -- condicion: cuyo nombre de usuario sea igual

## Usuarios que No tengan cargados sus Datos
SELECT
	# usuarios
    u.id, u.username,
    # campo personalizado
    CASE
		WHEN employee = TRUE THEN 'empleado'
        ELSE 'paciente'
    END AS kind,
    # datos de usuario
    ud.first_name, ud.last_name, ud.uid,
    ud.email, ud.phone
FROM users AS u
LEFT JOIN users_data AS ud ON u.id = ud.userId
WHERE ud.userId IS NULL;
/*
	INNER JOIN: solamente los registros coincidentes de ambas tablas
    OUTTER JOIN: todos los registros de una tabla y los coincidentes de otra (LEFT, RIGHT)
    CROSS JOIN: los registros de ambas tablas combinados (referencias cruzadas)
*/