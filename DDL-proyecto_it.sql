/*	DDL(Data Definition Language)
    Crear/Modificar/Eliminar estructuras
    DB/Tablas/Usuarios
*/
# Creacion DB
	DROP DATABASE IF EXISTS proyecto_it; -- eliminacion (advertencia)
	CREATE DATABASE proyecto_it; -- nombre
    USE proyecto_it; -- selecciono DB
    
# Creacion de Tablas
	CREATE TABLE users(
		user_id INT AUTO_INCREMENT, -- numero entero
        user_name VARCHAR(20), -- cadena de texto variable
        user_pass VARCHAR(20),
        PRIMARY KEY(user_id), -- clave principal (relacional)
        UNIQUE KEY(user_name) -- clave unica (local)
    );