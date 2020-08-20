/*Usuarios y Permisos*/
	-- Usuario Administrador
    DROP USER IF EXISTS 'cristian'@'localhost'; ## eliminacion si existe el usuario
	CREATE USER 'cristian'@'localhost' IDENTIFIED BY 'root'; ## creacion de usuario
	GRANT ALL PRIVILEGES ON educacionit.* TO 'cristian'@'localhost'; ## asignacion total de los permisos
	FLUSH PRIVILEGES; ## refrescamos los permisos
    
    -- Usuario Invitado
    DROP USER IF EXISTS 'invitado'@'localhost';	##eliminacion de usuario
    CREATE USER 'invitado'@'localhost' IDENTIFIED BY '1234'; ## creacion de usuario
    GRANT SELECT ON educacionit.* TO 'invitado'@'localost'; ## permisos de solo lectura (SELECT)
	FLUSH PRIVILEGES; ## refrescamos los permisos
