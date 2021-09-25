/* DCL - Data Control Language */
## creacion de usuario Administrador
	DROP USER IF EXISTS 'admin'@'localhost'; -- eliminamos si existe
	CREATE USER 'admin'@'localhost' -- usuario@servidor
	IDENTIFIED BY 'root'; -- contraseña
	-- permisos: control total
    GRANT ALL PRIVILEGES -- permisos
    ON ventapps.* -- BD.tablas
    TO 'admin'@'localhost'; -- usuario
    
## creacion de usuario Supervisor
	DROP USER IF EXISTS 'manager'@'localhost';
    CREATE USER 'manager'@'localhost'
    IDENTIFIED BY '1man';
    -- Permisos: Manipulacion de Datos
    GRANT SELECT, INSERT, UPDATE, DELETE
    ON ventapps.*
    TO 'manager'@'localhost';
    
## creacion de usuario Empleado
	DROP USER IF EXISTS 'employee'@'localhost';
    CREATE USER 'employee'@'localhost'
    IDENTIFIED BY '1234';
    -- Permisos: Manipulacion Parcial de datos
    GRANT SELECT, INSERT
    ON ventapps.*
    TO 'employee'@'localhost';

## Creacion de usuario Invitado
	DROP USER IF EXISTS 'invited'@'localhost';
	CREATE USER 'invited'@'localhost'
    IDENTIFIED BY '123';
    -- Permisos: Solo Lectura
    GRANT SELECT
    ON ventapps.*
    TO 'invited'@'localhost';
    
FLUSH PRIVILEGES;
