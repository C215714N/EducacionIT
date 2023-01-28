/* DCL: Data Control Language 
	otorgar/remover
    permisos de usuario
*/

/* Usuario Administrador */
DROP USER IF EXISTS 'administrator'@'localhost'; -- eliminar permisos previos
CREATE USER 'administrator'@'localhost' -- creacion del usuario
IDENTIFIED BY 'root'; -- contraseña asignada
## Permisos (Control Total)
GRANT ALL PRIVILEGES
ON hospital_business.* -- todas las tablas de la db
TO 'administrator'@'localhost'; -- usuario asignado

/* Usuario Empleado */
DROP USER IF EXISTS 'employee'@'localhost';
CREATE USER 'employee'@'localhost'
IDENTIFIED BY 'pass';
## Permisos (Solo Lectura)
GRANT SELECT, INSERT, UPDATE 
ON hospital_business.*
TO 'employee'@'localhost';

/* Usuario Invitado */
DROP USER IF EXISTS 'invited'@'localhost';
CREATE USER 'invited'@'localhost'
IDENTIFIED BY '1234';
## Permisos (Solo Lectura)
GRANT SELECT 
ON hospital_business.*
TO 'invited'@'localhost';
