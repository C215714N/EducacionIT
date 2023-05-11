/* DDL */
DROP DATABASE IF EXISTS `chat_it`;
CREATE DATABASE `chat_it`;
USE `chat_it`;

CREATE TABLE users(
	id INT AUTO_INCREMENT,
    username VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE KEY(email)
);
ALTER TABLE users
ADD COLUMN birth_date DATE DEFAULT '1900-01-01';

CREATE TABLE messages(
	id INT AUTO_INCREMENT,
    send INT,
    message LONGTEXT,
    receive INT,
    sent_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    received_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(send) REFERENCES users(id),
    FOREIGN KEY(receive) REFERENCES users(id)
);

/* DML */
INSERT INTO users(username, email)
VALUES 	("Cristian","cristiandracedo@hotmail.com"),
		("Lain","serialexperimentslain@gmail.com"),
        ("Joaquin","Joaquito2013@hotmail.com.ar"),
        ("MarcoPolo","pochoclo@gmail.com"),
        ("Random", "jalksdfjaklsdj@mail.com");

INSERT INTO messages
SET send = (SELECT id FROM users WHERE email = "cristiandracedo@hotmail.com"),
	message = "Buenas tardes, ¿como estas?",
    receive = ROUND(RAND() * 3 + 2);

INSERT INTO messages(send, message, receive)
VALUES	(3,"Buenas tardes, viste lo que paso el otro dia",4),
		(5,"¿Que vas a hacer el 25?",2),
		(4,"Si, un robo!! encima le volvieron a robar el fin de semana",3),
		(5,"¿Que vas a hacer el 25?",1),
		(2,"No se que voy a hacer hoy y me preguntas por el 25?",5);

SELECT 
	s.username AS sender,
    message,
    r.username AS receptor
FROM messages AS m
JOIN users AS s ON s.id = send 
JOIN users AS r ON r.id = receive
WHERE (s.id = 5 AND r.id = 2 ) OR (r.id = 5 AND s.id = 2);
    
/* DCL */
CREATE USER 'appuser'@'localhost'
IDENTIFIED BY 'password';
GRANT INSERT, SELECT, DELETE, UPDATE
ON chat_it.*
TO 'appuser'@'localhost';