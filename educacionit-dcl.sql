/*Usuarios y Permisos*/
	DROP USER IF EXISTS 'cristian'@'localhost'; ## eliminamos si existe
	CREATE USER 'cristian'@'localhost' IDENTIFIED BY 'root'; ## creamos el usuario
	GRANT ALL PRIVILEGES ON educacionit.* TO 'cristian'@'localhost'; ## asignamos los permisos
	FLUSH PRIVILEGES; ## refrescamos los permisos
