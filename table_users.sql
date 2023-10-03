/* DDL - Data Definition Language */
# Creacion DB
DROP DATABASE IF EXISTS smsapp; -- eliminamos si existe db anterior
CREATE DATABASE smsapp; -- creamos la db vacia
USE smsapp; -- seleccionamos la db

# Tabla Usuarios
CREATE TABLE users(
	id INT AUTO_INCREMENT, -- numero entero (autoincremental)
    username VARCHAR(20), -- cadena de texto variable 
    password VARCHAR(20), -- ocupa el espacio de su contenido
    active BOOLEAN, -- verdadero o falso
    # Restricciones
    PRIMARY KEY(id), -- clave principal (relacional)
    UNIQUE KEY(username) -- clave unica (local)
);
DESCRIBE users; -- muestra la estructura de la tabla