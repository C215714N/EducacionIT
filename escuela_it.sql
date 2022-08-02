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