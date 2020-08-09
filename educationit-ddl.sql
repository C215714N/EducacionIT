-- Creacion y uso de la Base de datos
CREATE DATABASE educacionit;
USE educacionit;

DROP TABLE IF EXISTS alumnos ;

CREATE TABLE alumnos(
	id_alumno INT AUTO_INCREMENT,
	apellido VARCHAR(100),
	nombre VARCHAR(100),
	tipo_doc ENUM('dni','ci','le','lc','pass'),
	num_doc INT,
	direccion VARCHAR(200),
	telefono INT,
	correo VARCHAR(200),
	PRIMARY KEY (id_alumno),
	UNIQUE KEY (tipo_doc, num_doc)
);
ALTER TABLE alumnos 
	ADD estado BOOLEAN;