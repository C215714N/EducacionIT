/* DML (Data Manipulation Language)
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
