/*  DATA DEFINITION LANGUAGE
	lenguaje de definicion de datos
    se utiliza para crear la estructura de la base de datos
    modificarla e incluso eliminar la misma */
## Creacion de DB
DROP DATABASE IF EXISTS pepe_y_los_globos_store;
CREATE DATABASE pepe_y_los_globos_store;
USE pepe_y_los_globos_store;

## Creacion de TABLAS
/*	ESTRUCTURA 
	cliente => datos_cliente
    proveedores => productos
    facturacion => detalle => cliente + productos(1 o +)
*/
-- clientes
CREATE TABLE customers(
	customer_id INT AUTO_INCREMENT, -- numero entero (INTEGER)
	customer_name VARCHAR(20), -- texto variable (CANT MAX CARACTERES)
	customer_email VARCHAR(100) NOT NULL, -- almacena datos
	customer_pass VARCHAR(20) NOT NULL,
	PRIMARY KEY(customer_id), -- campo relacional (UNICO)
	UNIQUE KEY(customer_email), -- restriccion local
	UNIQUE KEY(customer_name) -- campo unico
);
DESCRIBE customers;
    
CREATE TABLE customers_data(
	data_id INT AUTO_INCREMENT,
	customer INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	birth DATE,
	cuit CHAR(13) NOT NULL,
	address VARCHAR(100),
	phone VARCHAR(20),
	PRIMARY KEY (data_id),
	UNIQUE KEY(cuit), -- clave unica
	UNIQUE KEY(first_name, last_name, birth, address), -- clave unica combinada
	FOREIGN KEY (customer) REFERENCES customers(customer_id) -- (campo_local) => tabla(campo_externo)
);
DESCRIBE customers_data;

-- productos
CREATE TABLE products(
	product_id INT AUTO_INCREMENT,
	description VARCHAR(50),
	PRIMARY KEY(product_id),
	UNIQUE KEY(description)
);
ALTER TABLE products
ADD COLUMN stock INT DEFAULT 0,
ADD COLUMN price DECIMAL(11,2) DEFAULT 0;
DESCRIBE products;

-- proveedores
CREATE TABLE providers(
	provider_id INT AUTO_INCREMENT,
	description VARCHAR(100), -- cadena de texto variable
	cuit CHAR(13), -- cadena de texto fija
	address VARCHAR(150),
	PRIMARY KEY(provider_id),
	UNIQUE KEY(cuit)
);
ALTER TABLE providers
MODIFY COLUMN cuit CHAR(13) NOT NULL;
DESCRIBE providers;

CREATE TABLE transactions(
	transaction_id INT AUTO_INCREMENT,
    provider INT,
    product INT,
    quantity INT,
    price DECIMAL(11,2),
	transaction_date DATETIME DEFAULT current_timestamp(),
    PRIMARY KEY (transaction_id),
    FOREIGN KEY(provider) REFERENCES providers(provider_id),
    FOREIGN KEY(product) REFERENCES products(product_id)
);
DESCRIBE transactions;

-- ventas
CREATE TABLE sales(
	sale_id INT AUTO_INCREMENT,
    customer INT,
    pay_method ENUM('credito','debito','efectivo','transferencia','virtual','cheque','desposito') DEFAULT 'efectivo',
    sale_date DATETIME DEFAULT current_timestamp(),
    total DECIMAL(11,2),
    PRIMARY KEY(sale_id),
    FOREIGN KEY(customer) REFERENCES customers(customer_id)
);
CREATE TABLE sales_detail(
	detail_id INT AUTO_INCREMENT,
    sale INT,
    product INT,
    quantity INT,
    price DECIMAL(11,2),
    PRIMARY KEY(detail_id),
    UNIQUE KEY(sale, product),
    FOREIGN KEY(sale) REFERENCES sales(sale_id),
    FOREIGN KEY(product) REFERENCES products(product_id)
);

