CREATE DATABASE mysql_msn;
USE mysql_msn;

CREATE TABLE users(
	user_id INT AUTO_INCREMENT,
    user_name VARCHAR(20),
    user_phone VARCHAR(20),
    PRIMARY KEY (user_id),
    UNIQUE KEY(user_name),
    UNIQUE KEY(user_phone)
);

INSERT INTO users (user_name, user_phone)
VALUES 
	('c215714n','1103034567'),
    ('cristian','1145679432'),
    ('josejose','1174893202'),
    ('jcesar','1195804304'),
    ('edward','1190283930');
    
CREATE TABLE chats(
	chat_id INT AUTO_INCREMENT,
    sender INT,
    message VARCHAR(200),
	receiver INT,
    sent DATETIME DEFAULT current_timestamp(),
    PRIMARY KEY(chat_id),
    FOREIGN KEY(sender) REFERENCES users(user_id),
    FOREIGN KEY(receiver) REFERENCES users(user_id)
);

INSERT INTO chats (sender, message, receiver)
VALUES 
	(1, 'hola ¿que tal?', 3),
    (3,'todo en orden y vos?',1),
    (2, 'que ondaaaaaaa', 5),
    (5,'whatsapp',2),
    (1,'¿a donde vamos con esto?',5),
    (5,'no tengo idea',1);

SELECT * FROM chats;
SELECT 
	send.user_name AS user_send, 
    message, 
    rec.user_name AS user_receive, 
    sent
FROM chats
JOIN users AS send ON send.user_id = sender
JOIN users AS rec ON rec.user_id = receiver
WHERE 
	sender IN(
		(SELECT user_id FROM users WHERE user_name = 'c215714n'), 
        (SELECT user_id FROM users WHERE user_name = 'edward'))
    AND
    receiver IN(
		(SELECT user_id FROM users WHERE user_name = 'edward'),
        (SELECT user_id FROM users WHERE user_name = 'c215714n'));