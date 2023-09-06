USE escuelait;
SHOW TABLES;

/* DML DATA MANIPULATION LANGUAGE */
## Consulta de usuarios
SELECT * FROM users;

## Carga de Usuario
INSERT INTO users(username, userpass)
VALUES ('d477714n','root4ccess');

## Generacion aleatoria de contraseña
UPDATE users
SET userpass = CONCAT(
	SUBSTRING(
		username, 
		CEIL(RAND() * LENGTH(username) / 2), 
		CEIL(RAND() * LENGTH(username) / 2)
	),
    ROUND(RAND() * 8999 + 1000)
);

## Eliminacion Ultimo Usuario
DELETE FROM users
WHERE user_id = (SELECT MAX(user_id) FROM users);

/* DDL - DATA DEFINITION LANGUAGE*/
## Tablas contactos
CREATE TABLE contacts(
	id INT AUTO_INCREMENT,
    user INT,
    contact_name VARCHAR(50),
    phone VARCHAR(20),
    description TEXT,
    PRIMARY KEY(id),
    FOREIGN KEY(user) REFERENCES users(user_id)
);

## Modificacion estructura tabla Alumnos
ALTER TABLE students
ADD COLUMN active boolean DEFAULT true; -- agrega campo active

/* DCL - DATA CONTROL LANGUAGE */
## Eliminacion del usuario
DROP USER IF EXISTS 'c215714n'@'localhost';
## Creacion del nuevo usuario
CREATE USER 'c215714n'@'localhost'
IDENTIFIED BY 'vtodyosmd48w58qh';
## Asignacion de permisos
GRANT ALL PRIVILEGES 
ON escuelait.*
TO 'c215714n'@'localhost';