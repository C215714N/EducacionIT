/*Creacion del esquema*/
	DROP DATABASE IF EXISTS comercio_lj_11; -- elimina si existe
	CREATE DATABASE IF NOT EXISTS comercio_lj_11; -- crea si no existe
    USE comercio_lj_11; -- selecciona base datos
    
/* Definicion de tablas
	proveedores (id, nombre, cuil, direccion, datos)
    productos (id, nombre, codigo, precio, stock)
	clientes (id, nombre, tipo, doc, sexo, datos)
    ingreso (proveedor => productos)
    ventas (productos => clientes)
*/

-- proveedores
	CREATE TABLE proveedores (
		id_proveedor INT AUTO_INCREMENT, -- campo numerico
		proveedor VARCHAR(50), -- campo de texto
		cuil CHAR(13), -- campo texto fijo (99-99999999-9)
		correo VARCHAR(100), 
		direccion VARCHAR(150),
		telefono VARCHAR(20),
		PRIMARY KEY(id_proveedor), -- campo relacional
		UNIQUE KEY(cuil) -- restriccion local (nn-nnnnnnnn-n)
	);
-- clientes
	CREATE TABLE clientes (
		id_cliente INT AUTO_INCREMENT,
        apellido VARCHAR(50) NOT NULL,
        nombre VARCHAR(50) NOT NULL, -- campo obligatorio (NOT NULL)
        tipo_doc ENUM('dni','dni_ex','ci','lc','le','pass') DEFAULT 'dni', -- lista de valores
        sexo ENUM('m', 'f', 'o'), -- campo opcional
        num_doc INT UNSIGNED NOT NULL, -- numero entero positivo
        PRIMARY KEY(id_cliente),
        UNIQUE KEY(tipo_doc, sexo, num_doc)
    );
-- productos 
	CREATE TABLE productos (
		id_producto INT AUTO_INCREMENT,
        producto VARCHAR(50),
        cantidad INT UNSIGNED,
        precio DECIMAL(10,2), -- (cantidad total digitos, numeros detras de la coma)
        valoracion INT,
        PRIMARY KEY (id_producto)
    );
    
SHOW DATABASES;
SHOW TABLES;
DESCRIBE productos;
	