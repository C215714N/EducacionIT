/*Usuarios y Permisos*/
	-- Usuario Administrador
    DROP USER IF EXISTS 'cristian'@'localhost'; ## eliminacion si existe el usuario
	CREATE USER 'cristian'@'localhost' IDENTIFIED BY 'root'; ## creacion de usuario
	GRANT ALL PRIVILEGES ON educacionit.* TO 'cristian'@'localhost'; ## asignacion total de los permisos

    -- Usuario Mantenimiento
    DROP USER IF EXISTS 'supervisor'@'localhost'; ## eliminacion si existe el usuario
	CREATE USER 'supervisor'@'localhost' IDENTIFIED BY 'security'; ## creacion del usuario
	GRANT
		CREATE,
		ALTER,
		DROP
	ON educacionit.* TO 'supervisor'@'localhost'; ## asignacion de permisos DDL (CREATE, ALTER, DROP)

	-- Usuario Supervisor
	DROP USER IF EXISTS 'supervisor'@'localhost'; ## eliminacion si existe el usuario
	CREATE USER 'supervisor'@'localhost' IDENTIFIED BY 'security'; ## creacion del usuario
	GRANT 
		SELECT, 
		UPDATE, 
		DELETE 
	ON educacionit.* TO 'supervisor'@'localhost'; ## asignacion de permisos DML (SELECT, UPDATE, DELETE)

    -- Usuario Invitado
    DROP USER IF EXISTS 'invitado'@'localhost';	##eliminacion de usuario
    CREATE USER 'invitado'@'localhost' IDENTIFIED BY '1234'; ## creacion de usuario
    GRANT SELECT ON educacionit.* TO 'invitado'@'localost'; ## permisos de solo lectura (SELECT)

	-- Usuario sin acceso
    DROP USER IF EXISTS 'denied'@'localhost';	##eliminacion de usuario
    CREATE USER 'denied'@'localhost' IDENTIFIED BY '1234'; ## creacion de usuario
    REVOKE ALL, GRANT OPTION FROM 'denied'@'localost'; ## permisos de solo lectura (SELECT)

FLUSH PRIVILEGES; ## refrescamos todos los permisos
