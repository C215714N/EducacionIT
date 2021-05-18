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
		user_name VARCHAR(20), -- caracter variable max(20)
        user_email VARCHAR(100),
		user_pass VARCHAR(20),
		PRIMARY KEY(user_id), -- Clave Principal (campo relacional)
		UNIQUE KEY(user_name), -- Clave Unica (campo local)
		UNIQUE KEY(user_email)
   );
    
    DESCRIBE users;