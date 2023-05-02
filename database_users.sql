/* DCL (Data Control Language) 
	crear/eliminar/modificar permisos usuarios
*/
# Usuario administrador
DROP USER IF EXISTS 'admin'@'localhost';
CREATE USER "admin"@'localhost' -- usuario en servidor
IDENTIFIED BY 'admin';
# permisos (control Total)
GRANT ALL PRIVILEGES -- todos los comandos DML y DDL
ON escuelait.* -- database.tables (* todas las tablas)
TO 'admin'@'localhost'; -- usuario autorizado

# Usuario Invitado
DROP USER IF EXISTS 'guest'@'localhost';
CREATE USER 'guest'@'localhost' -- usuario en servidor
IDENTIFIED BY '1234';
# permisos (lectura)
GRANT SELECT -- DML(acceder a las tablas)
ON escuelait.* -- database.tables (* todas las tablas)
TO 'guest'@'localhost'; -- usuario autorizado