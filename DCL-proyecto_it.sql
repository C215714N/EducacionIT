/*	DCL(Data Control Language)
    Otorgar y Quitar permisos
    Usuarios
*/

/* Usuario administrador */
	DROP USER IF EXISTS 'admin'@'localhost'; -- eliminamos si existe
    CREATE USER 'admin'@'localhost' -- usuario en servidor
    IDENTIFIED BY 'root'; -- contraseña
    # permisos (control total)
    GRANT ALL PRIVILEGES -- todos los permisos (database)
    ON proyecto_it.* -- schema.table (todas las tablas)
    TO 'admin'@'localhost'; -- usuario
    
/* Usuario Cliente */    
	DROP USER IF EXISTS 'customer'@'localhost';
    CREATE USER 'customer'@'localhost'
    IDENTIFIED BY 'pass';
    GRANT INSERT, UPDATE, SELECT
    ON proyecto_it.* 
    TO 'customer'@'localhost';
    
/* Usuario invitado */
	DROP USER IF EXISTS 'invited'@'localhost';
    CREATE USER 'invited'@'localhost'
    IDENTIFIED BY '123';
    #permisos (solo lectura)
    GRANT SELECT -- permisos de consulta
    ON proyecto_it.users
    TO 'invited'@'localhost';
    
/*Actualizacion de permisos*/
	FLUSH PRIVILEGES;
    
/*Solucion de Conflictos*/
	SHOW DATABASES;
    USE mysql;
    SHOW TABLES;
    SELECT * FROM db;
    REPAIR TABLE db;