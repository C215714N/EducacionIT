/* DDL - Data Definition Language */
# Tipos de Pago
CREATE TABLE payments(
	id INT AUTO_INCREMENT,
    name VARCHAR(50),
    PRIMARY KEY(id),
    UNIQUE KEY(name)
);
# Contabilidad General
CREATE TABLE accounting(
	id INT AUTO_INCREMENT,
    Ticket INT,
    debit BOOLEAN DEFAULT false,
    credit BOOLEAN DEFAULT true,
    payment_type INT,
    payment_number INT DEFAULT 1,
    user INT,
    total FLOAT(11,2),
    detail LONGTEXT,
    date DATETIME DEFAULT current_timestamp,
    PRIMARY KEY(id),
	UNIQUE KEY(Ticket, payment_type),
    FOREIGN KEY(payment_type) REFERENCES payments(id),
    FOREIGN KEY(user) REFERENCES users(user_id)
);
# Detalle Asiento Contable
CREATE TABLE accounting_details(
	id INT AUTO_INCREMENT,
    ticket INT,
    product INT,
    quantity INT,
    price FLOAT(11,2),
    PRIMARY KEY(id),
    UNIQUE KEY(ticket, product),
    FOREIGN KEY(ticket) REFERENCES accounting(ticket),
    FOREIGN KEY(product) REFERENCES books(id)
);

/* DML - Data Manipulation Language */
## Insercion de Generos
INSERT INTO payments(name)
VALUES 	("efectivo"),
		("tarjeta credito"),
        ("tarjeta debito"),
        ("credito personal"),
        ("pago virtual"),
        ("transferencia"),
        ("deposito"),
		("cheque");
## Creacion de comprobantes
INSERT INTO accounting(ticket, payment_type, user)
VALUES	(1, CEIL(RAND() * 8), FLOOR(RAND() * 9 + 10)),
		(2, CEIL(RAND() * 8), FLOOR(RAND() * 9 + 10)),
		(3, CEIL(RAND() * 8), FLOOR(RAND() * 9 + 10));
## Detalle de compra
INSERT INTO accounting_details(ticket, product, quantity)
VALUES 
-- comprobante de Elwyn.Skiles
	(1, 2, FLOOR(RAND() * 10)),
    (1, 4, FLOOR(RAND() * 10)),
    (1, 3, FLOOR(RAND() * 10)),
    (1, 1, FLOOR(RAND() * 10)),
-- comprobante de Samantha
	(2, 5, FLOOR(RAND() * 10)),
    (2, 3, FLOOR(RAND() * 10)),
    (2, 2, FLOOR(RAND() * 10));

# ACTUALIZACION DE TABLAS
## precios unitario por producto
UPDATE accounting_details
SET price = (SELECT price FROM books WHERE id = product)
WHERE price IS NULL;

## precios totales por comprobante
UPDATE accounting AS a
SET total = ( SELECT SUM(price * quantity) 
    FROM accounting_details AS ad 
	WHERE ad.ticket = a.ticket )	
WHERE total IS NULL;

# CONSULTAS GENERALES
SELECT * FROM accounting;
## Total por producto
SELECT 
	ticket,
    product,
    quantity,
    price * quantity AS total
FROM accounting_details;

SELECT 
	ticket,
    SUM(price * quantity) AS total
FROM accounting_details
GROUP BY ticket;