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
    -- facturacion
    CREATE TABLE facturacion(
		id_factura INT AUTO_INCREMENT,
        id_cliente INT,
        tipo ENUM('debe', 'haber'),
        medio ENUM('efectivo','debito','credito','cheque','deposito','transferencia', 'virtual'),
        monto DECIMAL,
        fecha DATE,
        vendedor VARCHAR(50),
        PRIMARY KEY(id_factura),
        UNIQUE KEY(id_cliente, tipo, medio, monto, fecha),
        FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente) -- id_cliente PK @ tabla clientes
    );
    CREATE TABLE facturacion_detalle(
		id_detalle INT AUTO_INCREMENT,
        id_factura INT,
        id_producto INT,
        cantidad INT,
        precio DECIMAL,
        PRIMARY KEY(id_detalle),
        UNIQUE KEY(id_factura, id_producto),
        FOREIGN KEY(id_factura) REFERENCES facturacion(id_factura), -- id_factura PK @ tabla facturacion
        FOREIGN KEY(id_producto) REFERENCES productos(id_producto) -- id_producto PK @ tabla productos
    );
    
    DROP TABLE IF EXISTS facturacion_temp;
    CREATE TABLE facturacion_temp(
		id_factura VARCHAR(10)
    );
    ALTER TABLE facturacion_temp
		ADD monto DECIMAL,
        MODIFY id_factura INT AUTO_INCREMENT PRIMARY KEY,
        DROP COLUMN id_factura,
        ADD CONSTRAINT UNIQUE KEY(id_factura);
    