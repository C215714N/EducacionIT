/* DDL (Data Definition Language) 
	CREAR / MODIFICAR / ELIMINAR => DB / TABLAS
*/
# creacion de DB
DROP DATABASE IF EXISTS ecommerce_it; -- eliminamos si existe
CREATE DATABASE ecommerce_it; -- creacion del esquema
USE ecommerce_it; -- seleccion de la DB

# Creacion de las TABLAS
/*
	usuario => datos_usuario => publicacion
    usuario => publicacion => compras 
    categoria => productos => publicacion
    marcas ========>
    servicios => publicacion
*/
## Tabla Usuario
CREATE TABLE users(
	user_id INT AUTO_INCREMENT, -- campo identificador numerico
    username VARCHAR(20), -- caracter de texto variable
    email VARCHAR(100) NOT NULL, -- debe almacenar algo
    password VARCHAR(50) DEFAULT 'abcd1234', -- valor si no carga algun dato
    ### Restricciones
    PRIMARY KEY(user_id), -- clave principal (campo relacional),
    UNIQUE KEY(email), -- clave unica (campo local)
    UNIQUE KEY(username)
);
DESCRIBE users;
## Tabla Datos de Usuario
CREATE TABLE users_data(
	data_id INT AUTO_INCREMENT,
    user INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    cuil INT,
    address VARCHAR(200),
    phone VARCHAR(20),
    PRIMARY KEY(data_id),
    UNIQUE KEY(cuil),
    UNIQUE KEY(first_name, last_name, birth_date, address, phone),
    FOREIGN KEY(user) REFERENCES users(user_id)
);
DESCRIBE users_data;

/*	DML - DATA MANIPULATION LANGUAGE
	INSERTAR / ACTUALIZAR / ELIMINAR / CONSULTAR => registros
*/

# Tabla Usuarios
## Carga completa (ordinal)
INSERT INTO users
VALUES (0,'c215714n','cristiandracedo@hotmail.com','root');
## Carga Selectiva
INSERT INTO users(email, username) 
VALUES ('cristiandracedo@gmail.com','Cristian');

## Consulta de Datos
SELECT * FROM users;