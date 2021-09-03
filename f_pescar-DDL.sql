/* DATA DEFINITION LANGUAGE */
	## base de datos (schema)
	DROP DATABASE IF EXISTS compumundo_hyper_mega_red; -- elimina db (WARNING)
	CREATE DATABASE compumundo_hyper_mega_red; -- creacion db
	USE compumundo_hyper_mega_red; -- seleccion db
	
    ## tablas
    DROP TABLE IF EXISTS users;
	CREATE TABLE users(
		user_id INT AUTO_INCREMENT, -- numero (automatico)
		user_name VARCHAR(20), -- texto variable
		user_email VARCHAR(100), -- texto variable
		user_password VARCHAR(20) NOT NULL, -- almacena datos
		PRIMARY KEY (user_id), -- campo relacional (funcional en otras tablas)
		UNIQUE KEY(user_name), -- restriccion local 
		UNIQUE KEY(user_email) -- unico en esta tabla
	);
	DESCRIBE users;
	
    DROP TABLE IF EXISTS users_data;
	CREATE TABLE users_data(
		data_id INT AUTO_INCREMENT,
        user INT,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        birth_date DATE, -- campo fecha
        gender ENUM('male', 'female', 'other'), -- lista de opciones
        phone VARCHAR(20),
        cuit CHAR(13) NOT NULL, -- cantidad fija de caracteres
		PRIMARY KEY (data_id), -- clave principal (campo relacional)
        UNIQUE KEY(cuit), -- clave unica (restriccion)
        FOREIGN KEY(user) REFERENCES users(user_id) -- clave externa (relacional)
    );
	DESCRIBE users_data;
    
    DROP TABLE IF EXISTS categories;
	CREATE TABLE categories(
		cat_id INT AUTO_INCREMENT,
        description VARCHAR(50),
        PRIMARY KEY(cat_id),
        UNIQUE KEY(description)
    );
    ALTER TABLE categories 
		MODIFY description VARCHAR(50) NOT NULL;
    DESCRIBE categories;
    
    DROP TABLE IF EXISTS products;
    CREATE TABLE products (
		product_id INT AUTO_INCREMENT,
        product VARCHAR(50) NOT NULL,
        category INT,
        PRIMARY KEY(product_id),
        UNIQUE KEY(product),
        FOREIGN KEY(category) REFERENCES categories(cat_id)
    );
    DESCRIBE products;
    
    DROP TABLE IF EXISTS posts;
    CREATE TABLE posts(
		post_id INT AUTO_INCREMENT,
        product INT,
        user INT,
        post_title VARCHAR(50),
        post_description VARCHAR(200),
        price DECIMAL(11,2) NOT NULL,
        quantity INT,
        PRIMARY KEY (post_id),
        FOREIGN KEY(product) REFERENCES products(product_id),
        FOREIGN KEY(user) REFERENCES users(user_id)
    );
    ALTER TABLE posts
		ADD COLUMN is_used BOOLEAN DEFAULT FALSE,
		ADD COLUMN delivery BOOLEAN DEFAULT FALSE,
		ADD COLUMN post_date DATE,
		ADD COLUMN post_update DATE;
    DESCRIBE posts;
   
	DROP TABLE IF EXISTS sales;
	CREATE TABLE sales(
		sale_id INT AUTO_INCREMENT,
        user INT,
        post INT,
        quantity INT,
        price DECIMAL(11,2),
        sell_date DATETIME DEFAULT (current_date()),
        state ENUM('reintegro','cancelado','en proceso', 'entregado') DEFAULT 'en proceso',
        PRIMARY KEY (sale_id),
        FOREIGN KEY (user) REFERENCES users(user_id),
        FOREIGN KEY (post) REFERENCES posts(post_id)
	);
    ALTER TABLE sales
		MODIFY sell_date DATETIME DEFAULT (current_timestamp());
	DESCRIBE sales;
    
    DROP TABLE IF EXISTS pay_methods;
    CREATE TABLE pay_methods(
		pay_id INT AUTO_INCREMENT,
		description VARCHAR(20),
		PRIMARY KEY(pay_id),
		UNIQUE KEY(description)
	);
    DROP TABLE IF EXISTS billing;
    CREATE TABLE billing(
		bill_id INT AUTO_INCREMENT,
        pay_m INT,
        user INT,
        pay_title VARCHAR(20) NOT NULL,
        pay_data VARCHAR(50) NOT NULL,
        load_date DATE DEFAULT (current_timestamp()),
        PRIMARY KEY (bill_id),
        UNIQUE KEY (pay_m, user, pay_data),
        FOREIGN KEY (pay_m) REFERENCES pay_methods(pay_id),
        FOREIGN KEY (user) REFERENCES users(user_id)
    );
	DROP TABLE IF EXISTS accounting;
    CREATE TABLE accounting(
		account_id INT,
        sale INT,
        pay_m INT,
        type INT
    );
    ALTER TABLE accounting
		MODIFY account_id INT AUTO_INCREMENT,
        MODIFY type ENUM('debe', 'haber') DEFAULT 'debe',
		ADD CONSTRAINT PRIMARY KEY(account_id),
        ADD CONSTRAINT FOREIGN KEY(sale) REFERENCES sales(sale_id),
        ADD CONSTRAINT FOREIGN KEY(pay_m) REFERENCES pay_methods(pay_id),
		ADD COLUMN pay_date DATETIME DEFAULT (current_timestamp()) AFTER account_id;
    DESCRIBE accounting;
    
	# verificacion de estructura
    SHOW DATABASES; -- lista las db del server
    SHOW TABLES; -- tablas de la db actual