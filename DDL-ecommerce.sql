/* DDL (Data Definition Language) */
## creacion y acceso a DB
	DROP DATABASE IF EXISTS ecommerce; -- elimina db
	CREATE DATABASE IF NOT EXISTS ecommerce; -- crear db
	USE ecommerce; -- selecciona la db	
/*
	users => publish
    products => publish
    accounting => user => publish
*/
## Creacion de tablas
	DROP TABLE IF EXISTS users;
	CREATE TABLE users(
		user_id INT AUTO_INCREMENT, -- numerico "automatico"
		user_name VARCHAR(20) NOT NULL, -- caracter variable max(20)
		user_email VARCHAR(100) NOT NULL, -- almacena un valor
		user_pass VARCHAR(20),
		PRIMARY KEY(user_id), -- Clave Principal (campo relacional)
		UNIQUE KEY(user_name), -- Clave Unica (campo local)
		UNIQUE KEY(user_email)
   );
	DROP TABLE IF EXISTS users_data;
    CREATE TABLE users_data(
	data_id INT AUTO_INCREMENT,
    lastname VARCHAR(50),
    firstname VARCHAR(50),
    doctype ENUM('DNI','DNI ext.','PASS','LC','LE','CI', 'DU'),
    docnum VARCHAR(20),
    birth_date DATE,
    user INT,
    PRIMARY KEY(data_id),
    UNIQUE KEY(doctype, docnum),
    FOREIGN KEY(user) REFERENCES users(user_id)
   );
	DROP TABLE IF EXISTS categories;
    CREATE TABLE categories(
		category_id INT AUTO_INCREMENT,
		description VARCHAR(50),
		PRIMARY KEY(category_id),
		UNIQUE KEY(description)
	);
    DROP TABLE IF EXISTS products;
	CREATE TABLE products (
		product_id INT AUTO_INCREMENT,
		description VARCHAR(200) NOT NULL,
		-- category ENUM("alimentos", "higiene", "hogar", "tecnologia"),
		category INT, -- campo relacional
		PRIMARY KEY(product_id),
		FOREIGN KEY(category) REFERENCES categories(category_id) -- clave foranea - Tabla(primary_key)
	);
    DROP TABLE IF EXISTS posts;
    CREATE TABLE posts(
		post_id INT AUTO_INCREMENT,
        user INT,
        product INT,
        price FLOAT(8,2) NOT NULL, 
        quantity INT NOT NULL,
        post_description VARCHAR(1000),
        post_date DATE,
        PRIMARY KEY (post_id),
        UNIQUE KEY(user, product),
        FOREIGN KEY (user) REFERENCES users(user_id),
        FOREIGN KEY (product) REFERENCES products(product_id)
	);
    
    