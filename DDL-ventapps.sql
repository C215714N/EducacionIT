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
    ## Tabla Categorias
		DROP TABLE IF EXISTS categories;
		CREATE TABLE categories(
			cat_id INT AUTO_INCREMENT,
            description VARCHAR(50) NOT NULL,
            PRIMARY KEY(cat_id),
            UNIQUE KEY(description)
        );
        DESCRIBE categories;
    ## Tabla Productos
    
    