## tabla de usuarios
	USE mysql; -- base de datos
	SELECT * FROM user; -- usuarios del servidor

/* creacion de usuarios*/
	## administrador
		DROP USER IF EXISTS 'cristian'@'localhost'; -- eliminacion de usuario
		CREATE USER 'cristian'@'localhost' -- usuario @ servidor
		IDENTIFIED BY 'root'; -- contraseña
	-- asignacion de permisos
		GRANT ALL PRIVILEGES -- permisos (control total)
        ON comercio.* -- database.table (todas las tablas)
        TO 'cristian'@'localhost'; -- usuario @ servidor
	-- remover permisos
		REVOKE PRIVILEGES -- permisos (ninguno)
        ON comercio.* -- database.table (opcional)
        FROM 'cristian'@'localhost'; -- usuario @ servidor
	
    ## empleado
		DROP USER IF EXISTS 'user'@'localhost';
        CREATE USER 'user'@'localhost'
        IDENTIFIED BY 'store';
	-- permisos
		GRANT 
			INSERT, -- insertar datos
			SELECT, -- consultar datos
            UPDATE, -- actualizar datos
            DELETE -- eliminar datos
		ON comercio.* -- database.table
        TO 'user'@'localhost'; -- usuario
	## invitado
		DROP USER IF EXISTS 'invitado'@'localhost';
		CREATE USER 'invitado'@'localhost'
        IDENTIFIED BY '1234';
	-- permisos de solo lectura
		GRANT SELECT -- consulta de datos
        ON comercio.* -- database.table
        TO 'invitado'@'localhost'; -- usuario @ servidor

-- actualizacion de Permisos
		FLUSH PRIVILEGES;