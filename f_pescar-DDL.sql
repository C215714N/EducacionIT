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
    /*
		users 	=> users_data
				=> posts
        caterigories => products => posts
        users 	=> sells => post
    
    */
	# verificacion de estructura
    SHOW DATABASES; -- lista las db del server
    SHOW TABLES; -- tablas de la db actual