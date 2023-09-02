/* DDL (Data Definition Language)
	Crear / Eliminar / Modificar
    DB / Tablas
*/

# Creacion del esquema
DROP DATABASE IF EXISTS escuelait; -- elimino si existe
CREATE DATABASE escuelait; -- creo la base de datos
USE escuelait; -- selecciono la base de datos

# Creacion de Tablas
## Usuarios
CREATE TABLE users(
	user_id INT AUTO_INCREMENT, -- entero automatico
    username VARCHAR(20), -- cadena de texto variable
    userpass VARCHAR(20), -- almacena los caracteres ingresados
	# Restricciones
    PRIMARY KEY(user_id), -- Clave Primaria (Relacional)
    UNIQUE KEY(username) -- Clave Unica (Local)
);

/* DML (Data Manipulation Language) */
# Consulta de Usuarios
SELECT * FROM users;

# consulta ordenada con limites
SELECT * FROM users -- consulta regular 
ORDER BY username -- criterio ordinal (ASC por defecto | DESC valor opcional)
LIMIT  5 -- cantidad de resultados a mostrar
OFFSET 5; -- a partir del numero de resultado especificado

## Carga Completa de Datos (Ordinal)
INSERT INTO users 
VALUES(0,'c215714n','root');

## Carga Parcial de Datos (selectiva)
INSERT INTO users(username, userpass)
VALUES ("cristian","pass");

## Carga de multiples registros
INSERT INTO users(username)
VALUES ('Messi'),('Waldo'),('Roman'),('Bob');