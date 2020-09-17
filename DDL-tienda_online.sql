## Elimina si existe el esquema (CUIDADO)
	DROP DATABASE IF EXISTS tienda_online;

## Crea la Base de Datos
	CREATE DATABASE tienda_online;
	USE tienda_online; -- uso el esquema

## Crea la tabla
	CREATE TABLE proveedores(
		id_proveedor INT AUTO_INCREMENT,
        proveedor VARCHAR(20) NOT NULL,
        cuil CHAR(13),
        direccion VARCHAR(100) NOT NULL,
        cp INT UNSIGNED,
        telefono VARCHAR(20) NOT NULL,
        correo VARCHAR(200),
        observaciones VARCHAR(200),
        ## Constraint / Restricciones
			PRIMARY KEY (id_proveedor), -- Clave Principal /Relacional
			UNIQUE KEY (cuil) -- Clave Unica / Local
    );
/*
	Tipos de Datos
		INT			ENTERO (- o +)	18
        DECIMAL		NUMERO CON COMA	1.3	
        DATE		FECHA CORTA		'yyyy-mm-dd'
        TIME		HORA CORA		'hh:mm:ss'
        DATETIME 	FECHA/HORA		'yyy-mm-dd,hh:mm:ss'
        CHAR		TEXTO FIJO		'11-01234567-8'
        VARCHAR		TEXTO VARIABLE	'cristian'
        ENUM		LISTA OPCIONES	('mañana','tarde','noche')
        
*/

