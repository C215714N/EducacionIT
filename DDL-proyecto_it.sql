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
    pay_methods => wallets
    users => posts => sales
    user => wallets
    users => sales
*/
# Creacion de Tablas
/* Tabla Usuarios */
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

/* Tabla Datos de Usuario */
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
    
/* Tabla Metodos de Pago */
	DROP TABLE IF EXISTS pay_methods;
	CREATE TABLE pay_methods(
		method_id INT AUTO_INCREMENT,
		description VARCHAR(20),
		PRIMARY KEY (method_id),
		UNIQUE KEY (description)
	);
    
/* Tabla Billeteras */    
    CREATE TABLE wallets(
		wallet_id INT AUTO_INCREMENT,
        user INT,
        wallet_title VARCHAR(20),
        wallet_data VARCHAR(25),
        PRIMARY KEY(wallet_id),
        UNIQUE KEY(user, wallet_data),
        FOREIGN KEY(user) REFERENCES users(user_id)
    );
    ALTER TABLE wallets
    ADD COLUMN method INT,
    ADD CONSTRAINT FOREIGN KEY (method) REFERENCES pay_methods(method_id);
    DESCRIBE wallets;

/* Tabla Categorias */
	CREATE TABLE categories(
		cat_id INT AUTO_INCREMENT,
        description VARCHAR(20),
        PRIMARY KEY (cat_id), -- clave principal (relacional)
        UNIQUE KEY (description) -- clave unica (local)
    );
    DESCRIBE categories;

/* Tabla Productos */
    CREATE TABLE products(
		product_id INT AUTO_INCREMENT,
        category INT,
        product VARCHAR(50) NOT NULL, -- no puede ser indefinido
        PRIMARY KEY(product_id),
        UNIQUE KEY(product),
        FOREIGN KEY(category) REFERENCES categories(cat_id) -- clave foranea (externa)
    );
    DESCRIBE products;

/* Tabla Publicaciones */
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

/* Tabla Ventas */
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
    ALTER TABLE sales
    ADD COLUMN wallet INT AFTER price,
	ADD CONSTRAINT FOREIGN KEY (wallet) REFERENCES wallets(wallet_id);
    DESCRIBE sales;

# Control
	SHOW DATABASES;
    SHOW TABLES;