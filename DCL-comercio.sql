/*Data Control Language */
## USUARIO ADMINISTRADOR
-- creacion de usuario
	CREATE USER 'cristian'@'localhost' -- usuario en servidor
	IDENTIFIED BY 'root'; -- contraseña
-- asignacion de permisos
	GRANT ALL PRIVILEGES -- control total
    ON comercio_lj_11.* -- database.tables
    TO 'cristian'@'localhost'; -- usuario
## USUARIO INVITADO
	CREATE USER  'invitado'@'localhost'
    IDENTIFIED BY '1234';
-- permisos
	GRANT SELECT -- consultas
    ON comercio_lj_11.*
    TO'invitado'@'localhost';

FLUSH PRIVILEGES;  
