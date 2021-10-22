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

INSERT INTO customers(customer_email, customer_pass) -- carga selectiva
VALUES ('cristiandracedo@gmail.com', 'root');

INSERT INTO customers 
SET
	customer_name = 'oracle',
    customer_email = 'mysql@oracle.com',
    customer_pass = 'sql_pass';
    
INSERT INTO customers_data(customer, first_name, last_name, birth, cuit)
VALUES (1, 'Cristian Damian', 'Racedo', '1991-04-18', '20-35336446-5');

INSERT INTO customers_data(customer, first_name, last_name, birth, cuit)
VALUES (3, 'Cristian', 'Racedo', '1991-04-18', '27-35336446-6');

-- providers
INSERT INTO providers(description, cuit)
VALUES -- carga multiple
	('hp','30-71480937-3'),
    ('samsung','30-68412579-2'),
    ('cannon','30-61697108-1'),
    ('coca cola','30-52539008-6'),
    ('asus','20-21918948-7'),
    ('apple','30-70722404-1');

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

## Consulta de Datos
-- clientes
SELECT * FROM customers; -- consulta total
SELECT * FROM customers_data;
-- proveedores
SELECT * FROM providers;
-- productos
SELECT * FROM products;