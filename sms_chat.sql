/* DDL */
DROP DATABASE IF EXISTS sms_chat;
CREATE DATABASE sms_chat;
USE sms_chat;

CREATE TABLE users(
	id INT AUTO_INCREMENT,
    username VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(50) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE KEY(username)
);

CREATE TABLE chats(
	id INT AUTO_INCREMENT,
    sender INT,
    message LONGTEXT NOT NULL,
    receiver INT,
    date DATETIME DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY(id),
    FOREIGN KEY(sender) REFERENCES users(id),
    FOREIGN KEY(receiver) REFERENCES users(id)
);

/* DML */
INSERT INTO users(username, email, password) -- valores requeridos
SELECT username, email, password -- campos a utilizar
FROM smsapp.users; -- migracion de datos (DB.TABLE)

INSERT INTO chats(sender, message, receiver)
VALUES
	(1,"Hola ¿como estas?",5),
    (5,"Bien ¿y vos?",1),
    (1,"Buenaas, quetalanda",4),
    (1,"Tranqui, dando clases",5),
    (4,"NO ESTOY DISPONIBLE",1);

/* DCL */
DROP USER IF EXISTS "sms"@"localhost";
CREATE USER "sms"@"localhost"
IDENTIFIED BY "password";
GRANT SELECT, INSERT, UPDATE
ON sms_chat.*
TO "sms"@"localhost";

SELECT 
	s.username,
    message,
    r.username
FROM chats AS c
JOIN users AS s ON s.id = c.sender
JOIN users AS r ON r.id = c.receiver;