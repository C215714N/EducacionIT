/* DDL - Data Definition Language */
CREATE TABLE posts(
	id INT AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    description LONGTEXT NOT NULL,
    user INT,
    product INT,
    post_date datetime DEFAULT CURRENT_TIMESTAMP, -- por defecto fecha y hora actual
	price DECIMAL(16,4), -- (digitos totales, decimales)
    stock INT,
    PRIMARY KEY(id),
    FOREIGN KEY(user) REFERENCES users(id),
    FOREIGN KEY(product) REFERENCES products(id)
);