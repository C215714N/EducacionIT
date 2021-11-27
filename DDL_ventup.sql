/* Data Definition Language
	Crear/eliminar/editar 
    las bases de datos,
    las tablas y usuarios.
*/
-- creacion de DB
DROP DATABASE IF EXISTS ventup;
CREATE DATABASE ventup;
USE ventup;
SET CHARSET utf8;

-- creacion de tablas
/*
	users => userData
	users => posts => sells
	categories => products
    products => posts
*/
CREATE TABLE users(
	user_id INT AUTO_INCREMENT, -- numero entero
	user_name VARCHAR(20), -- cadena de texto variable
    user_email VARCHAR(100) NOT NULL, -- almacena un dato vacio
    user_pass VARCHAR(20) NOT NULL, -- almacena dato vacio
    # restricciones (CLAUSULAS)
    PRIMARY KEY(user_id), -- clave principal (campo relacional)
    UNIQUE KEY(user_name), -- clave unica (campo local)
    UNIQUE KEY(user_email)
);
DESCRIBE users;