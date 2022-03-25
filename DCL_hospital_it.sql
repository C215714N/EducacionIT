/*	DCL Data Control Language
	asignacion de permisos por usuario (conexion)
*/
USE hospital_it;
## Usuario administrador
	DROP USER IF EXISTS 'admin'@'localhost';
	CREATE USER 'admin'@'localhost' -- user@server
	IDENTIFIED BY 'root'; -- password
# permisos: control total
    GRANT ALL PRIVILEGES -- total access
    ON hospital_it.* -- database.tables
    TO 'admin'@'localhost'; -- user
    
## Usuario supervisor
	DROP USER IF EXISTS 'manager'@'localhost';
	CREATE USER 'manager'@'localhost' -- user@server
	IDENTIFIED BY 'mana';
# permisos: manipulacion total
	GRANT SELECT, INSERT, UPDATE, DELETE
    ON hospital_it.*
    TO 'employee'@'localhost';
    
## Usuario empleado
	DROP USER IF EXISTS 'employee'@'localhost';
	CREATE USER 'employee'@'localhost' -- user@server
	IDENTIFIED BY 'pass';
# permisos: flujo de datos
	GRANT SELECT, INSERT, UPDATE
    ON hospital_it.*
    TO 'employee'@'localhost';
    
## Usuario invitado
	DROP USER IF EXISTS 'invited'@'localhost';
	CREATE USER 'invited'@'localhost' -- user@server
	IDENTIFIED BY '123';
# permisos: solo lectura
	GRANT SELECT
    ON hospital_it.*
    TO 'invited'@'localhost';
    
/* REPARACION: En caso de corrupcion de base de datos del servidor */
	SHOW DATABASES;
	USE mysql; -- administra las bases de datos creadas
	SHOW TABLES;
	SELECT * FROM user;
	REPAIR TABLE db; -- administra las conexiones y relaciones