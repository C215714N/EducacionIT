## Creacion de usuarios
	
/* creacion de usuarios */
	## usuario administrador (lectura/escritura)
		DROP USER IF EXISTS 'admin'@'localhost'; -- eliminamos
		CREATE USER 'admin'@'localhost' -- usuario @ servidor
		IDENTIFIED BY 'root'; -- contraseña
	## asignacion de permisos
		GRANT ALL PRIVILEGES 
		ON tienda_online.* -- basedatos.tabla
		TO 'admin'@'localhost'; -- usuario @ servidor

	## usuario invitado (permisos de lectura)
		DROP USER IF EXISTS 'invitado'@'localhost';
		CREATE USER 'invitado'@'localhost' IDENTIFIED BY '1234';
		GRANT SELECT
		ON tienda_online.facturacion -- base_datos.tablas
		TO 'invitado'@'localhost';

-- actualizacion de permisos
    FLUSH PRIVILEGES;