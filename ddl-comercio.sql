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
		id_cliente INT
    );