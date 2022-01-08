/* Data Control Language
	Otorgar/Quitar permisos a usuarios
    Sobre las bases de datos y tablas
*/
/*administrador - control total*/
	DROP USER IF EXISTS 'admin'@'localhost'; -- elimino en caso que exista
    CREATE USER 'admin'@'localhost'  -- usuario en servidor
    IDENTIFIED BY 'root'; -- contraseña
    GRANT ALL PRIVILEGES -- DDL / DML
    ON ventup.* -- db y tablas
    TO 'admin'@'localhost'; -- usuario
    
/*supervisor - manipular registros*/
	DROP USER IF EXISTS 'manager'@'localhost';
    CREATE USER 'manager'@'localhost'
    IDENTIFIED BY 'man1';
    GRANT INSERT, SELECT, UPDATE, DELETE -- DML
    ON ventup.*
    TO 'manager'@'localhost';
    
/*empleado - ingresar registros*/
	DROP USER IF EXISTS 'employee'@'localhost';
    CREATE USER 'employee'@'localhost'
    IDENTIFIED BY 'pass';
    GRANT INSERT, SELECT
    ON ventup.*
    TO 'employee'@'localhost';
    
/*invitado - consultar registros*/
	DROP USER IF EXISTS 'invited'@'localhost';
    CREATE USER 'invited'@'localhost'
    IDENTIFIED BY '123';
    GRANT SELECT
    ON ventup.*
    TO 'invited'@'localhost';

USE mysql;
SHOW tables;
REPAIR TABLE db;