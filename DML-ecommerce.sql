/* DML (Data Manipulation Language) */
## Insercion de datos
-- completa
	INSERT INTO users 
    VALUES (0,"cristian_racedo","cristiandracedo@hotmail.com","root");
-- selectiva
    INSERT INTO users(user_email, user_name, user_pass)
    VALUES ("cristiandracedo@gmail.com", "c215714n", "root");
-- multiple
    INSERT INTO users(user_name, user_email)
    VALUES 
		("a_santagada","a_santagada@gmail.com"),
        ("f_cichon","f_cichon"),
        ("f_varela","f_varela"),
        ("c_fernandez","c_fernandez");
    
## Consulta de Datos
	SELECT * FROM users;
    
## Actualizacion 
	UPDATE users SET user_pass = "root" 	-- valor asignado
    WHERE user_name = "cristian_racedo"; 	-- clausula restrictiva
    
## Eliminacion de registros
    DELETE FROM users; -- elimina todos los registros
    TRUNCATE users; -- elimina registros y reinicia los contadores