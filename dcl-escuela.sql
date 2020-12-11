/* DATA CONTROL LANGUAGE */
## creacion de usuarios
	DROP USER IF EXISTS 'cristian'@'localhost'; -- por si acaso
    CREATE USER 'c215714n'@'localhost' -- usuario @ servidor
    IDENTIFIED BY 'root'; -- contraseña
## permisos totales sobre ALUMNOS
    GRANT ALL PRIVILEGES -- lectura / escritura
    ON escuela.* -- base de datos.tablas
    TO 'c215714n'@'localhost'; -- usuario

## usuario INVITADO
	DROP USER IF EXISTS 'invitado'@'localhost';
    CREATE USER 'invitado'@'localhost'
    IDENTIFIED BY '1234';
    GRANT SELECT -- lectura 
    ON escuela.* -- base de datos.tablas
    TO 'invitado'@'localhost'; -- usuario
    
## Actualizacion de Permisos
	FLUSH PRIVILEGES;