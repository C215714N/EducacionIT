/* DDL (Data Definition Language)
	Crear/Modificar/Eliminar Estructuras
    Base de datos / tablAS / usuarios
*/

# Creacion Base de datos
DROP DATABASE IF EXISTS negocio_it; -- eliminamos si existe
CREATE DATABASE negocio_it;
USE negocio_it; -- seleccionamos la base de datos

/* Planificacion
	clientes => ventAS => cliente / producto
    
    categoria   => 	productos => ventas/compras
    marca		=>  productos => ventas/comprAS 
    
    proveedores => comprAS => proveedor / producto
*/

# Tabla Clientes
CREATE TABLE customers (
	customer_id INT AUTO_INCREMENT, -- nombre tipo extra
    last_name VARCHAR(50), -- cadena de texto variable
    first_name VARCHAR(50), -- hasta n caracteres
    cuit CHAR(13), -- cadena de texto fija
    ## restricciones
    PRIMARY KEY(customer_id), -- campo relacional (unico)
    UNIQUE KEY(cuit) -- campo local (unico)
);
-- modificacion de la estructura
ALTER TABLE customers
	-- nuevAS columnas
	ADD COLUMN birth_date DATE,
	ADD COLUMN description VARCHAR(50) AFTER cuit,
	ADD COLUMN address VARCHAR(100) NOT NULL,
    ADD COLUMN email VARCHAR(100) NOT NULL,
    -- nueva restriccion
    ADD CONSTRAINT UNIQUE KEY(last_name, first_name, birth_date, address, email);
-- modificacion de campos existentes
ALTER TABLE customers
	MODIFY COLUMN birth_date DATE NOT NULL, -- cambiamos tipo de dato
    CHANGE COLUMN description notes VARCHAR(200); -- cambiamos el nombre y tipo de dato
DESCRIBE customers;

/* DML (Data Manipulation Language)
	Crear/Modificar/Eliminar Registros
*/

# Carga Completa de Datos (ordinal)
INSERT INTO customers -- tabla
VALUES (
	0, 				-- customer_id
    'Racedo', 		-- last_name
    'Cristian', 	-- first_name
    '20-35336446-5' -- cuit
);
# Carga SELECTiva de Datos (opcional)
INSERT INTO customers(cuit, last_name)
VALUES ('27-34983422-3','Prince');

# Carga Multiple de Datos (SELECTiva)
INSERT INTO customers(last_name,first_name,cuit)
VALUES  ('Kent','Clark','23-28327389-4'),
		('Howlett','James','21-12938472-5'),
		('Parker','Peter','20-46912848-5'),
        ('Kyle','Selina','26-47382913-8');
# Consulta de datos
SELECT * FROM customers;

# Consulta por iniciales P.P
SELECT last_name, first_name FROM customers
WHERE last_name LIKE 'p%' OR first_name LIKE 'p%';

# Actualizacion segura Nombre Mujer Maravilla (Wonder Woman)
UPDATE customers -- tabla a manipulacion
SET first_name = 'Diana' -- valor de actualizacion
WHERE customer_id = 2; -- registro unico

# Funcion de agrupar (Segun casos)
UPDATE customers 
SET email = 
	CASE
		WHEN customer_id IN(2,4,7) THEN CONCAT(first_name,'_', last_name, '@dc.net')
		WHEN customer_id BETWEEN 3 AND 8 THEN CONCAT(first_name,'_', last_name, '@marvel.com')
		ELSE CONCAT(first_name, last_name, '@gmail.com')
	END
WHERE email IS NULL OR email = '';

## extraccion de valores
SELECT
	LEFT(cuit,2) AS identify_id,
    RIGHT(cuit,1) AS validator_digit,
    SUBSTRING(cuit,4,8) AS document
FROM customers;

## calcular edades
SELECT 
	CONCAT_WS(' ',first_name,last_name,email) AS customer_data, -- concatenacion de caracteres
	DATEDIFF(CURRENT_DATE(),birth_date) / 365 AS edad, -- diferencia en dias, convertido a años
    YEAR(CURRENT_DATE()) - YEAR(birth_date) AS age -- diferencia de edades en años
FROM customers
HAVING age BETWEEN 20 AND 50;

# verificar bases de datos y tablas
SHOW DATABASES;
USE negocio_it;
SHOW TABLES;
SHOW CREATE TABLE customers;
