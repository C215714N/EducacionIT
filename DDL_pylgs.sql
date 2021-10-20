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