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
    username VARCHAR(20), -- texto variable
    userpass VARCHAR(20), -- entre 0 y 20
    # Restricciones
    PRIMARY KEY(id), -- campo relacional(clave principal - unico)
    UNIQUE KEY(username) -- campo unico (local)
);

# detalle de tabla
DESCRIBE users;