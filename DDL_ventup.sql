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

CREATE TABLE users_data(
	data_id INT AUTO_INCREMENT,
    user INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    cuit CHAR(13),
    address VARCHAR(100),
    zip_code VARCHAR(10),
    nationality VARCHAR(50),
    PRIMARY KEY(data_id),
    UNIQUE KEY(cuit),
    UNIQUE KEY(first_name, last_name, birth_date, address),
    FOREIGN KEY(user) REFERENCES users(user_id)
);
ALTER TABLE users_data 
	ADD COLUMN phone VARCHAR(18) AFTER cuit,
	MODIFY COLUMN cuit CHAR(13);

CREATE TABLE categories(
	cat_id INT AUTO_INCREMENT,
    description VARCHAR(50) NOT NULL,
    PRIMARY KEY(cat_id),
    UNIQUE KEY(description)
);
DESCRIBE categories;

CREATE TABLE products(
	product_id INT AUTO_INCREMENT,
    description VARCHAR(100),
    category INT,
    PRIMARY KEY(product_id),
    UNIQUE KEY(description),
    FOREIGN KEY(category) REFERENCES categories(cat_id) -- clave externa OTRA_TABLA(PRIMARY KEY)
);
DESCRIBE products;