/*DDL - Data Definition Language */
	## Crear Base Datos
    DROP DATABASE IF EXISTS ventapps; -- eliminar si existe db
    CREATE DATABASE ventapps; -- nombre db
    USE ventapps; -- seleccionamos db
	/*
		usuarios => publicaciones => ventas
        categorias => productos => publicaciones
        usuarios => ventas
    */
    ## Tabla Usuarios
		DROP TABLE IF EXISTS users; -- eliminamos si existe la tabla
        CREATE TABLE users(
			user_id INT AUTO_INCREMENT,
            user_name VARCHAR(20),
            user_email VARCHAR(100),
            user_pass VARCHAR(20),
            PRIMARY KEY(user_id), -- campo relacional
            UNIQUE KEY(user_name), -- restriccion local
            UNIQUE KEY(user_email) -- no debe repetirse
        );
		DESCRIBE users;
	## Tabla Datos de Usuario
		DROP TABLE IF EXISTS users_data;
        CREATE TABLE users_data(
			data_id INT AUTO_INCREMENT,
            last_name VARCHAR(50),
            first_name VARCHAR(50),
            address_street VARCHAR(100),
            address_number INT,
            birth_date DATE,
            zip_code VARCHAR(10),
            nationality VARCHAR(20),
            gender ENUM('M','F','O'),
            doc_type ENUM('DU','LC','LE','CI','PASS'),
            doc_number VARCHAR(20),
            user INT,
            PRIMARY KEY (data_id),
            UNIQUE KEY(last_name, first_name, address_street, address_number, birth_date),
            UNIQUE KEY(nationality, gender, doc_type, doc_number),
            FOREIGN KEY(user) REFERENCES users(user_id)
        );
    ## Tabla Categorias
		DROP TABLE IF EXISTS categories;
		CREATE TABLE categories(
			cat_id INT AUTO_INCREMENT,
            description VARCHAR(50) NOT NULL,
            PRIMARY KEY(cat_id),
            UNIQUE KEY(description)
        );
        ALTER TABLE categories -- tabla a modificar
			ADD COLUMN active boolean DEFAULT true,-- agrego una columna
			MODIFY description VARCHAR(100); -- edito una columna
        DESCRIBE categories;
    
    ## Tabla Productos
		DROP TABLE IF EXISTS products;
		CREATE TABLE products(
			product_id INT AUTO_INCREMENT,
            product VARCHAR(150) NOT NULL,
            category INT, -- campo relacionado
            PRIMARY KEY (product_id),
            UNIQUE KEY(product, category),
            FOREIGN KEY(category) REFERENCES categories(cat_id) -- campo externo
		);
        DESCRIBE products;
	
    ## Tabla Publicaciones
		CREATE TABLE posts(
			post_id INT AUTO_INCREMENT,
            post_title VARCHAR(50),
            post_detail VARCHAR(250),
            user INT,
            product INT,
            post_date DATETIME DEFAULT (current_timestamp()),
            price DECIMAL(11,2),
            quantity INT,
            PRIMARY KEY(post_id),
            FOREIGN KEY(user) REFERENCES users(user_id),
            FOREIGN KEY(product) REFERENCES products(product_id)
        );
        DESCRIBE posts;
        
        ## Tabla Ventas
        DROP TABLE IF EXISTS sales;
        CREATE TABLE sales(
			sale_id INT AUTO_INCREMENT,
            user INT,
            post INT,
            price DECIMAL(11,2),
            quantity INT,
            sale_date DATETIME default (current_timestamp()),
            PRIMARY KEY (sale_id),
            FOREIGN KEY(user) REFERENCES users(user_id),
            FOREIGN KEY(post) REFERENCES posts(post_id)
        );
        DESCRIBE sales;
	
		## Tabla Medios de Pago
		DROP TABLE IF EXISTS pay_methods;
        CREATE TABLE pay_methods(
			method_id INT AUTO_INCREMENT,
            description VARCHAR(50),
            PRIMARY KEY(method_id),
            UNIQUE KEY(description)
        );
        DESCRIBE pay_methods;
        ## Tabla billeteras
        DROP TABLE IF EXISTS wallets;
        CREATE TABLE wallets(
			wallet_id INT AUTO_INCREMENT,
            user INT,
            method INT,
            title VARCHAR(20),
            detail VARCHAR(50),
            PRIMARY KEY(wallet_id),
            UNIQUE KEY(user, method, detail),
            FOREIGN KEY(user) REFERENCES users(user_id),
            FOREIGN KEY(method) REFERENCES pay_methods(method_id)
        );
        