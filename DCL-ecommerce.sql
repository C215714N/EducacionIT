## Creacion de usuario
	CREATE USER 'admin'@'localhost' -- usuario administrador nombre@servidor
    IDENTIFIED BY 'root'; -- password

## Otorgar permisos de administrador
    GRANT ALL PRIVILEGES ON ecommerce.* -- base de datos.tablas
    TO 'admin'@'localhost'; -- usuario habilitado

## Usuario Invitado
	CREATE USER 'invitado'@'localhost' -- usuario invitado
	IDENTIFIED BY '1234'; -- contraseña
    GRANT
		SELECT ON ecommerce.* -- visualizar datos de todas las tablas
	TO 'invitado'@'localhost'; -- usuario
    
## actulizar permisos
	FLUSH PRIVILEGES;