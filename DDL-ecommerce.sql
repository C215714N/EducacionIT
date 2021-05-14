/* DDL (Data Definition Language) */
## creacion y acceso a DB
	DROP DATABASE IF EXISTS ecommerce; -- elimina db
	CREATE DATABASE IF NOT EXISTS ecommerce; -- crear db
	USE ecommerce; -- selecciona la db	
## Creacion de tablas
	CREATE TABLE users(
		user_id INT AUTO_INCREMENT,
		username VARCHAR(50),
		userpass VARCHAR(20),
		PRIMARY KEY(user_id),
		UNIQUE KEY(username)
    );
    
    
    