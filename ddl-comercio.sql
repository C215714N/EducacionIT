/*Creacion de Schema*/
	DROP DATABASE comercio; -- eliminacion db
	CREATE DATABASE comercio; -- creacion db
	USE comercio; -- utilizacion db
/*
	Planificacion
		clientes <= productos
        proveedores => productos
        ingresos => (cliente + producto) 
		egresos => (proveedor + producto)
*/
/*Creacion de Tablas*/
	-- clientes
	CREATE TABLE clientes(
		id_cliente INT AUTO_INCREMENT,
        apellido VARCHAR(50),
        nombre VARCHAR(50),
        tipo_doc ENUM('dni','dni ex','lc','le','ci','pass'),
        num_doc INT UNSIGNED,
        fecha_nac DATE,
        telefono INT,
        correo VARCHAR(100),
        observaciones VARCHAR(200),
        PRIMARY KEY(id_cliente),
        UNIQUE KEY(tipo_doc,num_doc)
    );