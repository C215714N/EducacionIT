/* 	DDL (Data Definition Language) 
	Crear Base de datos / Tablas
    Estructura con la que vamos a trabajar
*/

# Crear La Base de datos
DROP DATABASE IF EXISTS escuelait; -- eliminacion condicional
CREATE DATABASE escuelait; -- creacion
USE escuelait; -- seleccion

# Creacion Tabla Usuarios
CREATE TABLE users(
	id INT AUTO_INCREMENT, -- numero entero (4.294.967.296)
    username VARCHAR(20), -- texto variable - admite cualquier valor
    userpass VARCHAR(20), -- entre 0 y 20 caracteres
    # Restricciones
    PRIMARY KEY(id), -- campo relacional(clave principal - unico)
    UNIQUE KEY(username) -- campo unico (local)
);

# detalle de tabla
DESCRIBE users;

/* DML (Data Manipulation Language)
	Insertar / Editar / Eliminar / Consultar Registros
    Manipulacion de datos
*/

# Carga Completa de Usuario
INSERT INTO users
VALUES (
	0, 			-- campo id
    "c215714n", -- campo username
    "admin"		-- campo userpass
);
# Carga Selectiva de datos Usuario
INSERT INTO users(username, userpass)
VALUES ("cristian","1234");

# Carga Multiple de Usuario
INSERT INTO users(userpass, username)
VALUES	("4lph4","alejandra"),
		("b3t4","brian"),
        ("g4mm4","carlos");

# Consulta Completa de usuarios
SELECT * FROM users;
# Consulta especifica de USUARIOS
SELECT * FROM users
WHERE id IN(1,4,6);