/* DDL - Data Definition Language */
CREATE TABLE pay_methods(
	method_id INT AUTO_INCREMENT,
    description VARCHAR(20),
    PRIMARY KEY(method_id),
    UNIQUE KEY(description)
);
CREATE TABLE wallets(
    user INT,
    wallet_name VARCHAR(50)
);
DESCRIBE wallets;
ALTER TABLE wallets
ADD COLUMN wallet_id INT AUTO_INCREMENT FIRST, -- agrega el campo al principio de la tabla
ADD COLUMN wallet_data VARCHAR(30), -- agrega el campo al final de la tabla
ADD COLUMN method INT AFTER user, -- agrega el campo despues del campo indicado
ADD CONSTRAINT PRIMARY KEY(wallet_id), -- campo relacional
ADD CONSTRAINT UNIQUE KEY(user, wallet_data), -- restriccion local
ADD CONSTRAINT FOREIGN KEY(method) REFERENCES pay_methods(method_id), -- tablas relacionadas
ADD CONSTRAINT FOREIGN KEY(user) REFERENCES users(user_id); -- clave externa
INSERT INTO pay_methods(description)
VALUES 
	('efectivo'),
    ('debito'),
    ('credito'),
    ('transferencia');
    
INSERT INTO wallets(user, method, wallet_name, wallet_data)
VALUES 
	(1, 2, 'VISA BBVA', '1235-1238-1283-2980'), -- debito de C215714n
	(4, 3, 'AMEX Platinum', '0335-1938-8332-1580'), -- credito de Batman
	(4, 2, 'ICBC Black', '1235-1548-1233-5280'), -- debito de Batman
	(6, 4, 'MP', '6413412035123812832980'), -- CVU de Wonder
	(5, 4, 'Provicia', '1235123812832980893201'), -- CBU de Wolvie
	(6, 3, 'VISA HSBC', '4215-1282-9483-2980'); -- Credito de Wonder
    
SELECt * FROM users;