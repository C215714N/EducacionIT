## Creacion de usuarios
	
## usuario administrador (lectura/escritura)
DROP USER IF EXISTS 'admin'@'localhost'; -- eliminamos
	CREATE USER 'admin'@'localhost' -- usuario @ servidor
    IDENTIFIED BY 'root'; -- contraseña
## asignacion de permisos
	GRANT ALL PRIVILEGES 
    ON tienda_online.* 
    TO 'admin'@'localhost';

## usuario invitado (permisos de lectura)
    DROP USER IF EXISTS 'invitado'@'localhost';
	CREATE USER 'invitado'@'localhost' IDENTIFIED BY '1234';
    GRANT SELECT
    ON tienda_online.facturacion -- base_datos.tablas
    TO 'invitado'@'localhost';
    
    FLUSH PRIVILEGES;