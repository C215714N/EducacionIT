/*DML - Data Manipulation Language - INSERT */
	USE ventapps;
	## Tabla usuarios
		-- carga completa de datos
        INSERT INTO users 
        VALUES (0,'c215714n','cristiandracedo@hotmail.com','root');
        -- carga selectiva de datos
        INSERT INTO users(user_email,user_name)
        VALUES ('cristiandacedo@gmail.com','d477714n');

/*DML - Data Manipulation Language - SELECT*/
	SELECT * FROM users;