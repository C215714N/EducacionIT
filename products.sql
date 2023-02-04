CREATE TABLE providers(
	id INT AUTO_INCREMENT,
    description VARCHAR(50),
    PRIMARY KEY(id),
    UNIQUE KEY(description)
);

CREATE TABLE category(
	id INT AUTO_INCREMENT,
    description VARCHAR(50),
    PRIMARY KEY(id),
    UNIQUE KEY(description)
);

CREATE TABLE products(
	id INT AUTO_INCREMENT,
	description VARCHAR(50),
    category INT,
    provider INT,
    price FLOAT(11,2),
    stock INT,
    unit ENUM('u','g','ml','cm3','mm', 'cm', 'm') DEFAULT 'u',
    packaging ENUM('frasco','caja','blister','bolsa', 'botella', 'jeringa') DEFAULT 'caja',
    PRIMARY KEY(id),
    UNIQUE KEY(description, provider, packaging),
    FOREIGN KEY(provider) REFERENCES providers(id)
);

CREATE TABLE sales(
	id INT AUTO_INCREMENT,
    userId INT,
    paymentId INT,
    discount INT DEFAULT 0,
    cuotes INT DEFAULT 1,
    total FLOAT(20,2),
    sale_date DATETIME DEFAULT current_timestamp(),
    PRIMARY KEY(id),
    FOREIGN KEY(userId) REFERENCES users(id)
);

CREATE TABLE sales_detail(
	id INT AUTO_INCREMENT,
    sale INT,
    product INT,
    quantity INT,
    price FLOAT(11,2),
    PRIMARY KEY(id),
    FOREIGN KEY(product) REFERENCES products(id),
    FOREIGN KEY (sale) REFERENCES sales(id)
)