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

	CREATE TABLE users_data(
		data_id INT AUTO_INCREMENT,
        user INT, -- numero
        first_name VARCHAR(50), -- texto variable
        last_name VARCHAR(50),
        cuit CHAR(13), -- texto fijo 99-99999999-9
        birth_date DATE, -- fecha
        gender ENUM('M','F','O'), -- lista de valores
        address VARCHAR(100),
        phone VARCHAR(20),
        profession VARCHAR(50),
        education VARCHAR(50),
        PRIMARY KEY(data_id),
        UNIQUE KEY(cuit),
        UNIQUE KEY(first_name, last_name, birth_date, address),
        FOREIGN KEY(user) REFERENCES users(user_id)
    );
	DESCRIBE users_data;
    
	DROP TABLE IF EXISTS pay_methods;
	CREATE TABLE pay_methods(
		method_id INT AUTO_INCREMENT,
		description VARCHAR(20),
		PRIMARY KEY (method_id),
		UNIQUE KEY (description)
	);
    
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
    
	CREATE TABLE posts(
		post_id INT AUTO_INCREMENT,
        user INT,
        product INT,
        post_title VARCHAR(50),
        post_description VARCHAR(200),
        stock INT NOT NULL,
        price DECIMAL(11,2), -- cantidad de digitos, cuantos detras de la coma
        post_date DATETIME DEFAULT CURRENT_TIMESTAMP(), -- 
        PRIMARY KEY(post_id),
        FOREIGN KEY(user) REFERENCES users(user_id),
        FOREIGN KEY(product) REFERENCES products(product_id)
    );
    DESCRIBE posts;
    
    CREATE TABLE sales(
		sale_id INT AUTO_INCREMENT,
        user INT,
        post INT,
        quantity INT NOT NULL,
        price DECIMAL(11,2) NOT NULL,
        sale_date DATETIME DEFAULT CURRENT_TIMESTAMP(),
        PRIMARY KEY(sale_id),
        FOREIGN KEY(user) REFERENCES users(user_id),
        FOREIGN KEY(post) REFERENCES posts(post_id)
    );
    DESCRIBE sales;
    
# Control
	SHOW DATABASES;
    SHOW TABLES;