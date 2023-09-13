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