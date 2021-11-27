/*Data Manipulation Language
	insertar/eliminar/modificar/consultar
    registros de tablas
*/
USE ventup;
-- carga completa
INSERT INTO users 
VALUES(
	0, 	-- user_id
    "c215714n", -- user_name
    "cristiandracedo@hotmail.com", -- user_email
    "root" -- user_pass
);
-- carga selectiva
INSERT INTO users(user_email, user_name)
VALUES("cristiandracedo@gmail.com", "cristian");

SELECT * FROM users;