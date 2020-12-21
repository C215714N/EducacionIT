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
    -- proveedores
    CREATE TABLE proveedores(
		id_proveedor INT AUTO_INCREMENT, -- restriccion exclusiva PK
        razon_social VARCHAR(50),
        cuil CHAR(13),
        telefono INT,
        correo VARCHAR(100),
        observaciones VARCHAR(200),
        PRIMARY KEY(id_proveedor),
        UNIQUE KEY(cuil)
    );
    -- productos
	CREATE TABLE productos(
		id_producto INT AUTO_INCREMENT,
        modelo VARCHAR(50),
        categoria ENUM(
			'tecnologia',
            'hogar',
            'higiene',
            'alimentos'
        ),
        Detalle VARCHAR(100),
        cantidad INT,
        precio DECIMAL,
        id_proveedor INT,
        PRIMARY KEY(id_producto),
        UNIQUE KEY(modelo, categoria, id_proveedor),
        FOREIGN KEY(id_proveedor) REFERENCES proveedores(id_proveedor)
    );