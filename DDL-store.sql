/* creacion base de datos */
	DROP DATABASE IF EXISTS store; -- eliminar
	CREATE DATABASE store; -- crear
	USE store; -- utilizar

/*creacion de tablas*/
	## CLIENTES
    CREATE TABLE clientes(
		id_cliente INT AUTO_INCREMENT, -- clave principal autonumerica
        apellido VARCHAR(50), -- texto variable
        nombre VARCHAR(50), -- hasta 50 caracteres
        tipo_doc ENUM('dni','dni ext.','ci','lc','le','pass') NOT NULL,
        sexo ENUM('m','f'),
        num_doc INT NOT NULL,
        fecha_nac DATE,
        tel VARCHAR(20),
        email VARCHAR(200),
        direccion VARCHAR(200),
        PRIMARY KEY(id_cliente), -- campo relacional (vincula con otras tablas)
        UNIQUE KEY(tipo_doc, sexo, num_doc) -- campo/s unico/s local/es
    );
	-- modificar tablas
	ALTER TABLE clientes
		ADD observaciones varchar(200), -- agrega un campo a la tabla
		DROP observaciones, -- elimina un campo de la tabla
		MODIFY sexo ENUM("m","f","o"); -- cambia un tipo de campo si es posible
	
    ## PROVEEDORES
	CREATE TABLE proveedores(
		id_proveedor INT AUTO_INCREMENT,
        proveedor VARCHAR(100),
        cuil CHAR(13), -- 99-99999999-9
        contacto VARCHAR(50),
        tel VARCHAR(20),
        direccion VARCHAR(100),
		PRIMARY KEY(id_proveedor),
        UNIQUE KEY(cuil)
    );
    
    ## PRODUCTOS
    DROP TABLE IF EXISTS productos;
    CREATE TABLE productos(
		id_producto INT AUTO_INCREMENT,
        articulo VARCHAR(50),
        codigo VARCHAR(20),
        categoria ENUM('tecnologia', 'hogar', 'higiene', 'alimentos'),
        stock INT NOT NULL,
        precio INT NOT NULL,
        valoracion ENUM("1","2","3","4","5"),
        detalle VARCHAR(200),
        id_proveedor INT NOT NULL,
        PRIMARY KEY(id_producto),
        UNIQUE KEY(codigo),
        FOREIGN KEY(id_proveedor) REFERENCES proveedores(id_proveedor) -- relacion externa (campo_local) tabla_ext(campo_ext)
	);
    ALTER TABLE productos
		MODIFY codigo VARCHAR(20) NOT NULL;
        
    SHOW TABLES; 
    DESCRIBE clientes;