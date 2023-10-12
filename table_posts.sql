/* DDL - Data Definition Language */
# Tabla publicaciones de usuario
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
# Tabla ventas por pulicacion
CREATE TABLE sales(
	id INT AUTO_INCREMENT,
    post INT,
    price DECIMAL(16,4),
    quantity INT,
    user INT,
    sale_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(post) REFERENCES posts(id),
    FOREIGN KEY(user) REFERENCES users(id)
);