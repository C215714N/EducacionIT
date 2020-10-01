## Creacion de usuario
	DROP USER IF EXISTS 'admin'@'localhost';
	CREATE USER 'admin'@'localhost' -- usuario administrador nombre@servidor
    IDENTIFIED BY 'root'; -- password

## Otorgar permisos de administrador
    GRANT ALL PRIVILEGES ON ecommerce.*
    TO 'admin'@'localhost'; -- usuario habilitado

## Usuario Invitado
	DROP USER IF EXISTS 'admin'@'localhost';
	CREATE USER 'invitado'@'localhost' -- usuario invitado
	IDENTIFIED BY '1234'; -- contraseña
    GRANT
		SELECT ON ecommerce.* -- visualizar datos de todas las tablas
	TO 'invitado'@'localhost'; -- usuario
    
## actulizar permisos
	FLUSH PRIVILEGES;
--  reparacion de tabla corrupta;
	SHOW DATABASES;
	USE mysql;
	SHOW TABLES;
	REPAIR TABLE mysql.db; -- reparacion de tabla base_datos.tabla