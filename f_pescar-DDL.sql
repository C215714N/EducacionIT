/* DATA DEFINITION LANGUAGE */
	## base de datos (schema)
		DROP DATABASE IF EXISTS compumundo_hyper_mega_red; -- elimina db (WARNING)
		CREATE DATABASE compumundo_hyper_mega_red; -- creacion db
		USE compumundo_hyper_mega_red; -- seleccion db
	
    ## tablas
		CREATE TABLE IF NOT EXISTS users(
			user_id INT AUTO_INCREMENT, -- numero (automatico)
            user_name VARCHAR(20), -- texto variable
            user_email VARCHAR(100), -- texto variable
            user_password VARCHAR(20) NOT NULL, -- almacena datos
            PRIMARY KEY (user_id), -- campo relacional (funcional en otras tablas)
            UNIQUE KEY(user_name), -- restriccion local 
            UNIQUE KEY(user_email) -- unico en esta tabla
        );
        DESCRIBE users;
