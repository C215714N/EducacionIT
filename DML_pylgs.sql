/*DATA MANIPULATION LANGUAGE 
	lenguaje de manipulacion de datos
    se utiliza para la carga de registros en las tablas
    para consulta, actualizacion y eliminacion de los mismos
*/
USE pepe_y_los_globos_store;
## Carga de Datos
-- clientes
INSERT INTO customers -- carga completa (ORDINAL)
VALUES (0, 'c215714n', 'cristiandracedo@hotmail.com', 'root');

INSERT INTO customers 
SET
	customer_name = 'oracle',
    customer_email = 'mysql@oracle.com',
    customer_pass = 'sql_pass';

INSERT INTO customers(customer_email, customer_pass) -- carga selectiva
VALUES ('cristiandracedo@gmail.com', 'root');
    
INSERT INTO customers_data(customer, first_name, last_name, birth, cuit)
VALUES (1, 'Cristian Damian', 'Racedo', '1991-04-18', '20-35336446-5');

INSERT INTO customers_data(customer, first_name, last_name, birth, cuit)
VALUES (3, 'Cristian', 'Racedo', '1991-04-18', '27-35336446-6');

-- productos
INSERT INTO products(description)
VALUES
	('Notebook Elitebook 8470p'),
    ('Netbook NP150'),
    ('Notebook Vivobook x512'),
    ('Multifuncion XP1150'),
    ('Pack 6u. Gaseosa 3L'),
    ('iPhone 4s A1387'),
    ('Galaxy Core I8260');

-- providers
INSERT INTO providers(description, cuit)
VALUES -- carga multiple
	('hp','30-71480937-3'),
    ('samsung','30-68412579-2'),
    ('cannon','30-61697108-1'),
    ('coca cola','30-52539008-6'),
    ('asus','20-21918948-7'),
    ('apple','30-70722404-1');

INSERT INTO transactions(provider, product, quantity, price)
VALUES 
	(1,1,50,55999.99), (1,4,100,15300), (1,2,30,36599.99), (1,3,90,69999.99), -- hp
    (5,3,200,59600.30), (5,2,60,36299.99), -- asus
    (3,1,50,67999), (3,4,40,20530), (3,7,30,5400), -- cannon
	(2,7,30,5000), (2,6,30, 6500), (2,2,150,32459.99), -- samsung
	(6,6,100,6000), (6,4,10,16000); -- apple

-- ventas
INSERT INTO sales(customer, pay_method)
VALUES 
	(1,2),(3,5),(2,3),
	(1,4),(2,2),(1,1),
	(3,3),(3,5),(1,1),
	(1,4),(2,3),(3,3),
	(2,5),(2,4),
	((SELECT customer_id FROM customers WHERE customer_name = 'c215714n'),'credito'); -- consulta anidada

INSERT INTO sales(customer)
VALUES ((SELECT customer FROM customers_data WHERE cuit LIKE '%35336446%'));
/*
	LIKE 
	% cualquier cantidad de caracteres
    _ un caracter cualquiera
*/

INSERT INTO sales_detail(sale, product, quantity)
VALUES
	(1,3,20),(1,2,20),(1,1,10),(1,4,25),
    (2,4,2),(2,6,4),(2,7,10),
    (3,5,5),(3,7,2),
    (4,3,5),(4,1,5),(4,4,5),
    (5,4,1),
    (6,5,10),
    (7,1,2),(7,2,1),(7,3,2);

## Consulta de Datos
-- clientes
SELECT * FROM customers; -- consulta total
SELECT * FROM customers_data;

-- productos
SELECT * FROM products;

-- proveedores
SELECT * FROM providers;
SELECT * FROM transactions;

-- ventas
SELECT * FROM sales;
SELECT * FROM sales_detail;
