/* DDL - Data Definition Language */
# Creacion DB
DROP DATABASE IF EXISTS smsapp; -- eliminamos si existe db anterior
CREATE DATABASE smsapp; -- creamos la db vacia
USE smsapp; -- seleccionamos la db

# Tabla Usuarios
CREATE TABLE users(
	id INT AUTO_INCREMENT, -- numero entero (autoincremental)
    username VARCHAR(20), -- cadena de texto variable 
    password VARCHAR(20), -- ocupa el espacio de su contenido
    active BOOLEAN, -- verdadero o falso
    # Restricciones
    PRIMARY KEY(id), -- clave principal (relacional)
    UNIQUE KEY(username) -- clave unica (local)
);
DESCRIBE users; -- muestra la estructura de la tabla

## Modificacion de Estructura
ALTER TABLE users -- tabla afectada
MODIFY active BOOLEAN DEFAULT true, -- definimos un valor predeterminado
ADD COLUMN email VARCHAR(100) AFTER username; -- agregamos una nueva columna

## Restriccion Clave Unica
ALTER TABLE users
ADD CONSTRAINT UNIQUE KEY(email); -- el correo no se debe repetir

/* DML - Data Manipulation Language */
# Insercion de Datos
## Carga Completa de registro
INSERT INTO users VALUES (
	0, 			-- id (0 no es una valor aplicable)
    'c215714n', -- nombre de usuario (cadena de texto)
    "r00t", 	-- contraseña (admite comillas dobles o simples)
    true 		-- estado (activo/inactivo)
);

## Carga Selectiva de Registro
INSERT INTO users(active, username, password) -- determinamos el orden
VALUES (true, 'Cristian','1234'); -- debemos respetar la cantidad de datos

## Carga Multiple de Registros
INSERT INTO users(username, password)
VALUES 	('lucia','p1mp1'),
		('joaquin','n3l4'),
        ('leandro','alber38'),
        ('joaquin1','g4l4n');

# Consulta de los usuarios
SELECT * FROM users;