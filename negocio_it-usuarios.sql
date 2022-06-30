/* DCL (Data Control Language)
	Asignar / Remover Permisos
    Usuarios de conexion (SERVIDOR)
*/
USE negocio_it;

## Usuario Administrador
DROP USER IF EXISTS 'admin'@'localhost'; -- eliminamos si existe
CREATE USER 'admin'@'localhost' -- usuario en Servidor
IDENTIFIED BY 'root'; -- Contraseña
### Permisos (Control Total)
GRANT ALL PRIVILEGES -- todos los permisos
ON negocio_it.* -- database.table
TO 'admin'@'localhost'; -- usuario asignado

## Usuario Empleado
DROP USER IF EXISTS 'employee'@'localhost';
CREATE USER 'employee'@'localhost'
IDENTIFIED BY 'pass';
### Permisos (Manipulacion Total)
GRANT SELECT, INSERT, UPDATE, DELETE
ON negocio_it.*
TO 'employee'@'localhost';

## Usuario Cliente
DROP USER IF EXISTS 'employee'@'localhost';
CREATE USER 'employee'@'localhost'
IDENTIFIED BY '1234';
### Acceso a todas las tablas
GRANT SELECT
ON negocio_it.*
TO 'client'@'localhost';
### Carga de datos personales
GRANT SELECT, INSERT, UPDATE
ON negocio_it.customers
TO 'client'@'localhost';
### Carga de Facturacion
GRANT SELECT,INSERT, UPDATE
ON negocio_it.sales
TO 'client'@'localhost';
### Control total Carga de productos
GRANT SELECT,INSERT, UPDATE, DELETE
ON negocio_it.sales_detail
TO 'client'@'localhost';

## Usuario Invitado
DROP USER IF EXISTS 'invited'@'localhost';
CREATE USER 'invited'@'localhost'
IDENTIFIED BY '123';
### Permisos (Solo Lectura)
GRANT SELECT
ON negocio_it.*
TO 'invited'@'localhost';