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