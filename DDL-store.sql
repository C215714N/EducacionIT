/* creacion base de datos */
	DROP DATABASE IF EXISTS store; -- eliminar
	CREATE DATABASE store; -- crear
	USE store; -- utilizar

/*creacion de tablas*/
	## clientes
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
    
    SHOW TABLES; 
    DESCRIBE clientes;
    SELECT * FROM clientes;