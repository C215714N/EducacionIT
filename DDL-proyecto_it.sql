/*	DDL(Data Definition Language)
    Crear/Modificar/Eliminar estructuras
    DB/Tablas/Usuarios
*/
# Creacion DB
	DROP DATABASE IF EXISTS proyecto_it; -- eliminacion (advertencia)
	CREATE DATABASE proyecto_it; -- nombre
	SET CHARACTER SET 'utf8'; -- codificacion que admite caracteres del español/portugues/frances/ingles
    USE proyecto_it; -- selecciono DB
/*
	users => users_data
    categories => products => posts
    users => posts => sales
    users => sales
*/
# Creacion de Tablas
	CREATE TABLE users(
		user_id INT AUTO_INCREMENT, -- numero entero
        user_name VARCHAR(20), -- cadena de texto variable
        user_pass VARCHAR(20),
        PRIMARY KEY(user_id), -- clave principal (relacional)
        UNIQUE KEY(user_name) -- clave unica (local)
    );
    ALTER TABLE users -- modifica una tabla existente
    ADD COLUMN user_email VARCHAR(100) NOT NULL AFTER user_name, -- indico el orden
    MODIFY COLUMN user_name VARCHAR(20) NOT NULL; -- almacena un dato de forma obligatoria

    DESCRIBE users;

	CREATE TABLE categories(
		cat_id INT AUTO_INCREMENT,
        description VARCHAR(20),
        PRIMARY KEY (cat_id), -- clave principal (relacional)
        UNIQUE KEY (description) -- clave unica (local)
    );
    DESCRIBE categories;
    
    CREATE TABLE products(
		product_id INT AUTO_INCREMENT,
        category INT,
        product VARCHAR(50) NOT NULL, -- no puede ser indefinido
        PRIMARY KEY(product_id),
        UNIQUE KEY(product),
        FOREIGN KEY(category) REFERENCES categories(cat_id) -- clave foranea (externa)
    );
    DESCRIBE products;
    
# Control
	SHOW DATABASES;
    SHOW TABLES;