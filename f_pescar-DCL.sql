/*DATA CONTROL LANGUAGE */
## Usuario Administrador
	DROP USER IF EXISTS 'admin'@'localhost';
    CREATE USER 'admin'@'localhost' -- user@server
    IDENTIFIED BY 'root'; -- password
    -- permisos
	GRANT ALL PRIVILEGES -- Control Total
    ON compumundo_hyper_mega_red.*
    TO 'admin'@'localhost';
    
## Usuario Supervisor
	DROP USER IF EXISTS 'manager'@'localhost';
    CREATE USER 'manager'@'localhost' -- user@server
    IDENTIFIED BY 'man'; -- password
    -- permisos
	GRANT INSERT, SELECT, UPDATE, DELETE -- control de datos
    ON compumundo_hyper_mega_red.*
    TO 'manager'@'localhost';
    
## Usuario Estandar
	DROP USER IF EXISTS 'user'@'localhost';
    CREATE USER 'user'@'localhost' -- user@server
    IDENTIFIED BY 'pass'; -- password
    -- permisos
	GRANT INSERT, SELECT, UPDATE -- Control parcial de datos
    ON compumundo_hyper_mega_red.*
    TO 'user'@'localhost';    
    
## Usuario Invitado
	DROP USER IF EXISTS 'test'@'localhost';
    CREATE USER 'test'@'localhost' -- user@server
    IDENTIFIED BY '123'; -- password
    -- permisos
	GRANT SELECT -- acceso limitado
    ON compumundo_hyper_mega_red.*
    TO 'test'@'localhost';
    
## actualizacion de Permisos
	FLUSH PRIVILEGES;