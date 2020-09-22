## Crea la  base de datos
    CREATE DATABASE ecommerce;
	USE ecommerce; -- seleccionamos el esquema

## Creacion tablas
	-- proveedores
    CREATE TABLE proveedores(
		id_proveedor INT AUTO_INCREMENT,
        proveedor VARCHAR(50),
        cuil CHAR(13),
        direccion VARCHAR(100),
        cp INT UNSIGNED,
        telefono VARCHAR(20),
        correo VARCHAR(150),
        observaciones VARCHAR(250),
        -- Restricciones
        PRIMARY KEY(id_proveedor), -- Clave Primaria / relacional
        UNIQUE KEY(cuil) -- Clave Unica / Local
    );
-- visualizar elementos
	SHOW DATABASES;
	SHOW TABLES;

## Productos
	CREATE TABLE productos (
		id_producto INT AUTO_INCREMENT,
        marca VARCHAR(50),
        modelo VARCHAR(50),
        categoria VARCHAR(100),
        precio INT,
        stock INT,
        id_proveedor INT,
        -- Restricciones
        PRIMARY KEY (id_producto), -- clave principal (Relacional)
		UNIQUE KEY (marca, modelo, precio), -- clave unica (Local)
        FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor) -- Clave Foranea (Relaciones tabla / campo)
    );
    
    CREATE TABLE clientes (
		id_cliente INT AUTO_INCREMENT,
        nombre VARCHAR(50),
        apellido VARCHAR(50),
        tipo_doc ENUM(
			'dni',
            'ci',
            'lc',
            'le',
            'pass'
        ),
        num_doc INT UNSIGNED,
        telefono VARCHAR(20),
        correo VARCHAR(200),
        observaciones VARCHAR(200),
        PRIMARY KEY (id_cliente),
        UNIQUE KEY (tipo_doc, num_doc)
    );
    
    ALTER TABLE clientes
		ADD fecha_nac DATE;

