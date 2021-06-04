/* DCL (Data Control Language)*/
	## crear usuario
    CREATE USER 'admin'@'localhost' -- usuario@servidor
    IDENTIFIED BY 'root'; -- contraseña
    ## otorgar permisos
    GRANT ALL PRIVILEGES -- control total
    ON ecommerce.* -- db.tablas
    TO 'admin'@'localhost'; -- usuario@servidor
    ## empleado
    CREATE USER 'employee'@'localhost'
    IDENTIFIED BY 'user';
    GRANT 
		INSERT, -- agregar registros
        SELECT -- consultar datos 
	ON ecommerce.*
    TO 'employee'@'localhost';
	## invitado
    CREATE USER 'invited'@'localhost'
    IDENTIFIED BY '1234';
    GRANT SELECT ON ecommerce.*
    TO 'admin'@'localhost';
    ## actualizacion de permisos
    FLUSH PRIVILEGES;
    
## comandos de verificacion
	SHOW DATABASES; -- muestra todas las DB
	USE mysql; -- seleccionamos las DB
	SHOW TABLES; -- muestra las tablas de la DB
	SELECT * FROM user; -- verificamos la tabla mysql.user (usuarios creados)
	SELECT * FROM db; -- verificamos la tabla mysql.db (informacion db)
    REPAIR TABLE mysql.db; -- repara la tabla en caso de incongruencias