/* DML (Data Definition Language)

*/
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
RENAME TABLE category TO categories;

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
);

/* DML (Data Manipulation Language)
*/
## Carga de Proveedores
INSERT INTO providers(description)
VALUES 	('Bago'),('Bayer'),('Pfiser'),('Elea'),('Moderna'),
		('Sandoz'),('Biontech'),('Merryl Linch'),('J&J'),('Sanofi');
        
## Carga de Categorias
INSERT INTO categories(description)
VALUES ('medicamento'),('descartable'),('instrumental'),('otro');

## Carga de Productos
INSERT INTO products(description, price, stock)
VALUES 	('aspirina', 600, 4500),
		('te descongestivo', 200,8590),
        ('morfina',1200,2734),
        ('diazepan',599, 1729),
        ('tegretol',937,5278),
        ('metoclopramida',2499.99,5273),
        ('cloroformo',5200,12930),
        ('sildenafilo',3295.50, 19283),
        ('paracetamol',859.99,2348),
        ('acetaminofen',6000,5484),
        ('agua oxigenada',300,28302);
## Ventas
SELECT * FROM sales_detail;
INSERT INTO sales
SET	userId = (SELECT id FROM users WHERE username = 'cristian');

## Detalle de Venta
INSERT INTO sales_detail(sale, product, quantity)
VALUES 	(1, CEIL(RAND() * 11), RAND() * 10);

UPDATE sales_detail
SET price = (SELECT price FROM products WHERE id = product) -- relacion uno a varios
WHERE price IS NULL; -- el precio no debe existir

/* Consulta por Agrupacion */
SELECT * FROM sales;
## Total de facturas emitidas por usuario
SELECT 
	userId,
	COUNT(userId) AS total,
    GROUP_CONCAT(id) AS tickets
FROM sales
GROUP BY userId; -- ejecuta las funciones separando en grupos

## Total de productos vendidos
SELECT 
	sale,
    description,
    quantity,
    sd.price,
    quantity * sd.price AS total
FROM sales_detail AS sd
JOIN products AS p ON p.id = sd.product;

SELECT
	sale,
    SUM(quantity * price) AS total
FROM sales_detail
GROUP BY sale;

SELECT 
	p.userId,
    weight,
    height,
    COUNT(s.userId) AS tickets
FROM sales AS s
RIGHT JOIN patients AS p ON p.userId = s.userId
GROUP BY s.userId
ORDER BY tickets;