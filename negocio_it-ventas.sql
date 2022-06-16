/*	DDL Data Definition Language*/

# Tabla Ventas
CREATE TABLE sales(
	sale_id INT AUTO_INCREMENT,
    customer INT,
    sale_number VARCHAR(11),
    sale_type ENUM('debe','haber') DEFAULT 'haber',
    pay_method ENUM(
		'debito',
        'credito',
        'efectivo',
        'cbu',
        'cvu',
        'cheque',
        'criptomoneda', 
        'virtual'
	),
    sale_total DOUBLE,
    sale_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(sale_id),
    FOREIGN KEY(customer) REFERENCES customers(customer_id)
);

# Tabla detalle de ventas
CREATE TABLE sales_detail(
	detail_id INT AUTO_INCREMENT,
    sale INT,
    product INT,
    quantity INT,
    price DOUBLE,
    PRIMARY KEY(detail_id),
    UNIQUE KEY(sale, product),
    FOREIGN KEY(sale) REFERENCES sales(sale_id),
    FOREIGN KEY(product) REFERENCES products(product_id)
);

INSERT INTO sales(customer, sale_number, pay_method)
VALUES 	(1, 'A1386', 3), -- cristian racedo
		(4, 'B612', 2), -- clark kent
        (6, 'A1387', 1); -- peter parker

INSERT INTO sales_detail(sale, product, quantity)
VALUES 	(4,2,2),(4,7,1),
		(5,16,4),(5,2,3),(5,6,5),(5,1,2),
		(6,2,4),(6,8,2),(6,1,4);

SELECT *, quantity * price AS total FROM sales_detail;
# Eliminamos producto cargado por error (notebook de A1387)
DELETE FROM sales_detail 
WHERE sale = 6 AND product = 1;

# Actualizacion de precios de venta
UPDATE sales_detail
	SET price = (SELECT price FROM products WHERE product_id = product)
WHERE price IS NULL;