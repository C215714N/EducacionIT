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
ALTER TABLE sales
ADD COLUMN state ENUM('aprobado', 'en proceso', 'cancelado' ,'rechazado');

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

# Tabla Ventas
INSERT INTO sales(customer, sale_number, pay_method)
VALUES 	(1, 'A1386', 3), -- cristian racedo
		(4, 'B612', 2), -- clark kent
        (6, 'A1387', 1); -- peter parker

INSERT INTO sales(customer, sale_number)
VALUES (8, 'C320'); -- bruce wayne

# Tabla Detalle de Ventas
INSERT INTO sales_detail(sale, product, quantity)
VALUES 	(4,2,2),(4,7,1),
		(5,16,4),(5,2,3),(5,6,5),(5,1,2),
		(6,2,4),(6,8,2),(6,1,4);

INSERT INTO sales_detail
SET sale = 6,
	product = 15,
    quantity = 3,
    price = (SELECT price FROM products WHERE product_id = 15 );
    
## Consulta de Totales por Producto
SELECT *, quantity * price AS total FROM sales_detail;

# Eliminamos producto cargado por error (notebook de A1387)
DELETE FROM sales_detail 
WHERE sale = 6 AND product = 1;

# Actualizacion de precios de venta
UPDATE sales_detail
	SET price = (SELECT price FROM products WHERE product_id = product)
WHERE sale = 6;

# Estadistica de precios en detalle
SELECT
	min(price) AS cheapest,
    max(price) AS most_expensive,
    ROUND(AVG(price), 2) AS average -- round(valor, decimales)
FROM sales_detail;

# Total de ventas 
SELECT 
	sale,
    GROUP_CONCAT(product) AS product_list,
    SUM(price * quantity) AS total
FROM sales_detail
GROUP BY sale; -- pertecen a la misma venta

SELECT * FROM sales;
UPDATE sales
SET sale_total = ( SELECT SUM(price * quantity) FROM sales_detail WHERE sale = sale_id )
WHERE sale_total IS NULL OR sale_total = 0;

## Actualizacion masiva del stock
UPDATE products
SET stock = 
	CASE 
		WHEN (SELECT SUM(quantity) FROM sales_detail WHERE product = product_id) IS NULL THEN stock
        ELSE stock - (SELECT SUM(quantity) FROM sales_detail WHERE product = product_id)
	END;
    
## Actualizacion de stock por factura emitida
UPDATE products, sales_detail
SET stock = stock - (
	SELECT quantity FROM sales_detail -- valor a obtener de la tabla detalle de ventas
    WHERE sale = 6 AND product = product_id -- condicion para obtener la cantidad correcta
)	
WHERE product_id = product AND sale = 6; -- condicion para actualizar el stock de los productos vendidos
