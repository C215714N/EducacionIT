/* DCL (Data Control Language) 
	Agregar/Quitar Permisos a Usuarios
    Sobre DB/Tablas
*/

## Usuario Administrador 
DROP USER IF EXISTS 'admin'@'localhost'; -- eliminamos si existe
CREATE USER 'admin'@'localhost' -- usuario@servidor
IDENTIFIED BY 'root'; -- contraseña de acceso
### Permisos (Control Total)
GRANT ALL PRIVILEGES
ON ecommerce_it.* -- database.tables (* = todas las tablas)
TO 'admin'@'localhost'; -- asignacion de permisos

## Usuario Cliente
DROP USER IF EXISTS 'client'@'localhost';
CREATE USER 'client'@'localhost'
IDENTIFIED BY '1234';
### Permisos (Manipulacion de Datos)
GRANT SELECT, INSERT, UPDATE
ON ecommerce_it.*
TO 'client'@'localhost';

## Usuario Invitado
DROP USER IF EXISTS 'invited'@'localhost';
CREATE USER 'invited'@'localhost'
IDENTIFIED BY '1111';
### Permisos (Visualizacion de Datos)
GRANT SELECT
ON ecommerce_it.*
TO 'invited'@'localhost';