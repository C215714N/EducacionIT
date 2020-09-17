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