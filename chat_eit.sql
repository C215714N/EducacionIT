/*DDL*/
# Creacion de la base de datos
DROP DATABASE IF EXISTS `chat_eit`;
CREATE DATABASE `chat_eit`;
USE `chat_eit`;

# Creacion de las tablas
CREATE TABLE `users`(
	`id` INT AUTO_INCREMENT,
    `username` VARCHAR(20),
    `phone` VARCHAR(20),
    `active` BOOLEAN DEFAULT TRUE,
    PRIMARY KEY(`id`),
    UNIQUE KEY(`phone`)
);
CREATE TABLE `chats`(
	`id` INT AUTO_INCREMENT,
    `sendby` INT,
    `message` TEXT,
    `receivedby`INT,
    `sent` DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`sendby`) REFERENCES users(id),
    FOREIGN KEY(`receivedby`) REFERENCES users(id)
);


/*DML*/
INSERT INTO `users`(username, phone)
VALUES  ('Cristian Racedo','1120938740'),
		('Angel Barboza','1192347828'),
        ('Daniel Mendoza','1198723405'),
        ('Rocio Almiron','1129308434'),
        ('Sol Nocco','1127370452');

INSERT INTO `chats`(sendby, message, receivedby)
VALUES	(RAND() * 4 + 1, "Hola ¿Como estas?", RAND() * 4 + 1);

SELECT * FROM chats;
SELECT 
	s.username,
    message,
    r.username
FROM chats AS c 
JOIN users AS s ON s.id = c.sendby
JOIN users AS r ON r.id = c.receivedby
WHERE sendby = 1 OR receivedby = 1;

/*DCL*/
DROP USER IF EXISTS "appuser"@"localhost";
CREATE USER "appuser"@"localhost"
IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES
ON chat_eit.*
TO "appuser"@"localhost";

/*REPARACION TABLA CORRUPTA*/
USE Mysql;
REPAIR TABLE db;