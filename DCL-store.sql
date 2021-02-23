/*Creacion de usuarios*/
	-- administrador
	DROP USER IF EXISTS 'cristian'@'localhost';
	CREATE USER 'cristian'@'localhost' -- usuario en servidor
	IDENTIFIED BY 'root'; -- contraseña
	## permisos
	GRANT ALL PRIVILEGES ON store.clientes -- control total (database.tables)
    TO 'cristian'@'localhost'; -- asignado a usuario
    
	-- estandar
    DROP USER IF EXISTS 'employee'@'localhost';
    CREATE USER 'employee'@'localhost' 
    IDENTIFIED BY '1234';
    ## permisos
    GRANT INSERT, SELECT, UPDATE ON store.* -- manipulacion de datos
    TO 'employee'@'localhost';
    
    -- invitado
    DROP USER IF EXISTS 'test'@'localhost';
    CREATE USER 'test'@'localhost'
    IDENTIFIED BY '0000';
    ## permisos
    GRANT SELECT ON store.* TO 'test'@'localhost';
    
    FLUSH PRIVILEGES;
    
REPAIR TABLE db;