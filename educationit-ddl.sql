-- Creacion y uso de la Base de datos
CREATE DATABASE educacionit;
USE educacionit;
-- Eliminacion de Tabla si existe y creacion de la misma
DROP TABLE IF EXISTS alumnos;
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
-- Agregamos el campo faltante
ALTER TABLE alumnos 
    ADD estado BOOLEAN DEFAULT TRUE;

DROP TABLE IF EXISTS profesores;

CREATE TABLE profesores(
	id_profesor INT AUTO_INCREMENT,
	apellido VARCHAR(100),
	nombre VARCHAR(100),
	tipo_doc ENUM('dni','ci','le','lc','pass'),
	num_doc INT,
	direccion VARCHAR(200),
	telefono INT,
	correo VARCHAR(200),
    estado BOOLEAN DEFAULT TRUE,
	PRIMARY KEY (id_profesor),
	UNIQUE KEY (tipo_doc, num_doc)
);
-- modificamos el campo asignado erroneamente
ALTER TABLE profesores
	MODIFY estado BOOLEAN DEFAULT TRUE;
    
DROP TABLE IF EXISTS cursos;
DROP TABLE IF EXISTS clases;
DROP TABLE IF EXISTS clases_detalle;
CREATE TABLE cursos(
	id_curso INT AUTO_INCREMENT,
    nombre VARCHAR(200) NOT NULL,
    hora INT UNSIGNED,
    PRIMARY KEY (id_curso)
);

CREATE TABLE clases(
	id_clase INT AUTO_INCREMENT,
    id_profesor INT,
    id_curso INT,
    dia ENUM(
		'lunes',
        'martes',
        'miercoles',
        'jueves',
        'viernes',
        'sabado'
    ),
    hora TIME,
    PRIMARY KEY (id_clase),
    UNIQUE KEY (id_profesor, id_curso, dia, hora),
	FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);
	ALTER TABLE clases
		ADD CONSTRAINT FOREIGN KEY (id_curso) REFERENCES cursos(id_curso);

CREATE TABLE clases_detalle (
	id_detalle INT AUTO_INCREMENT,
    id_clase INT,
    id_alumno INT,
    observaciones VARCHAR(200),
    PRIMARY KEY (id_detalle),
    FOREIGN KEY (id_clase) REFERENCES clases(id_clase),
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
    UNIQUE KEY (id_clase, id_alumno)
);