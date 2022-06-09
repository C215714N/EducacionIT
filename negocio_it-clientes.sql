/* DDL (Data Definition Language)
	Crear/Modificar/Eliminar Estructuras
    Base de datos / tablas / usuarios
*/

# Creacion Base de datos
DROP DATABASE IF EXISTS negocio_it; -- eliminamos si existe
CREATE DATABASE negocio_it;
USE negocio_it; -- seleccionamos la base de datos

/* Planificacion
	clientes => ventas => cliente / producto
    
    categoria   => 	productos => ventas/compras
    marca		=>  productos => ventas/compras 
    
    proveedores => compras => proveedor / producto
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
# Carga selectiva de Datos (opcional)
INSERT INTO customers(cuit, last_name)
VALUES ('27-34983422-3','Prince');

# Carga Multiple de Datos (selectiva)
INSERT INTO customers(last_name,first_name,cuit)
VALUES  ('Kent','Clark','23-28327389-4'),
		('Howlett','James','21-12938472-5'),
		('Parker','Peter','20-46912848-5'),
        ('Kyle','Selina','26-47382913-8');
# Consulta de datos
SELECT * FROM customers;
SELECT last_name, first_name FROM customers
WHERE last_name LIKE 'p%' OR first_name LIKE 'p%';