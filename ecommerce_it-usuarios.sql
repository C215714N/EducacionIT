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
DROP TABLE IF EXISTS users_data;
CREATE TABLE users_data(
	data_id INT AUTO_INCREMENT,
    user INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    cuil CHAR(13),
    address VARCHAR(200),
    phone VARCHAR(20),
    PRIMARY KEY(data_id),
    UNIQUE KEY(cuil),
    UNIQUE KEY(first_name, last_name, birth_date, address, phone),
    FOREIGN KEY(user) REFERENCES users(user_id)
);
ALTER TABLE users_data
MODIFY cuil CHAR(13), -- modifica el tipo de dato
CHANGE birth_date birth DATE, -- cambiar nombre "original" "nuevo" "tipo"
ADD COLUMN city CHAR(2) AFTER cuil; -- agregamos una columna 

DESCRIBE users_data;

/*	DML - DATA MANIPULATION LANGUAGE
	INSERTAR / ACTUALIZAR / ELIMINAR / CONSULTAR => registros
*/

# Tabla Usuarios
## Carga completa (ordinal)
INSERT INTO users
VALUES (0,'c215714n','cristiandracedo@hotmail.com','root');
## Carga parcial (Selectiva)
INSERT INTO users(email, username) 
VALUES ('cristiandracedo@gmail.com','Cristian');
# Carga multiple
INSERT INTO users(email, username, password)
VALUES 	('bruce@waynetech.com','Batman', 'I4mB4tm4n'),
		('loga@x-men.com','Wolvie','berserker'),
        ('prince.diana@amazons.com','wonder','athenea'),
        ('ororo.monro@x-men.com', 'storn', 'thunders');

# Tabla Datos de Usuario
INSERT INTO users_data(user, last_name, first_name, cuil)
VALUES 	(1, 'Racedo', 'Cristian', 20353364465), -- c215714n
		(3, 'Perez', 'juan', 20472893281); -- Cristian
# Carga dinamica de datos de usuarios (subconsulta)
INSERT INTO users_data(user, last_name, first_name, cuil, birth)
VALUES -- debe retornar un unico valor de campo	
	( (SELECT user_id FROM users WHERE username = "Batman"), 
		'Wayne', 'Bruce', '20-27649128-4', '1970-08-18'),
	( (SELECT user_id FROM users WHERE username = "Wolvie"),
		'Howlett', 'James', '20-02817239-1', '1810-05-25'),
	( (SELECT user_id FROM users WHERE username = "wonder"), 
		'Prince', 'Diana', '27-37644126-4', '1990-06-12');

# Consulta de Datos
## Tabla Usuarios
SELECT * FROM users;

## Consulta de los ultimos 10 usuarios
SELECT * FROM users -- consulta de tabla
ORDER BY user_id DESC -- criterio ordinal
LIMIT 10 -- cantidad de registros
OFFSET 0; -- a partir de tal registro

## Usuario cuyo nombre sea "Wolvie"
SELECT * FROM users 
WHERE username = 'wolvie';

# Tabla Datos de Usuario
SELECT * FROM users_data;
## Usuarios que no cargaron fecha de nacimiento
SELECT * FROM users_data
WHERE birth IS NULL;