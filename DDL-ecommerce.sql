/* DDL (Data Definition Language) */
## creacion y acceso a DB
	DROP DATABASE IF EXISTS ecommerce; -- elimina db
	CREATE DATABASE IF NOT EXISTS ecommerce; -- crear db
	USE ecommerce; -- selecciona la db	
/*
	users => publish
    products => buy
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
   CREATE TABLE categories(
		cat_id INT AUTO_INCREMENT,
        description VARCHAR(50),
        PRIMARY KEY(cat_id),
        UNIQUE KEY(description)
   );
   CREATE TABLE products (
		product_id INT AUTO_INCREMENT,
        description VARCHAR(200) NOT NULL,
        -- category ENUM("alimentos", "higiene", "hogar", "tecnologia"),
        category INT,
        PRIMARY KEY(product_id),
        FOREIGN KEY (category) REFERENCES categories(cat_id)
   ); 