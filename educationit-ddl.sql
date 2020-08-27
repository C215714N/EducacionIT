/* Base de datos educacionit */
    DROP DATABASE IF EXISTS educacionit; ## eliminamos si existe
	CREATE DATABASE educacionit; ## creacion de Esquema
	USE educacionit; ## seleccion de Esquema
/* Tabla alumnos */
	DROP TABLE IF EXISTS alumnos; ## eliminamos si existe
	CREATE TABLE alumnos(
		id_alumno INT AUTO_INCREMENT, ## campo numerico / incrementacion automatica PK
		apellido VARCHAR(100), ## campo de texto variable
		nombre VARCHAR(100),
		tipo_doc ENUM(
			'dni',
			'ci',
			'le',
			'lc',
			'pass'
		), ## campo de lista de valores (Tipo_doc)
		num_doc INT UNSIGNED,
		direccion VARCHAR(200),
		telefono INT, 
		correo VARCHAR(200),
		PRIMARY KEY (id_alumno), ## clave principal (Relacional)
		UNIQUE KEY (tipo_doc, num_doc) ## Clave Unica (Interno)
	);
	ALTER TABLE alumnos 
	    ADD estado BOOLEAN DEFAULT TRUE; ## agregamos un campo a la tabla
/* Tabla Profesores */
	DROP TABLE IF EXISTS profesores;
	CREATE TABLE profesores(
		id_profesor INT AUTO_INCREMENT,
		apellido VARCHAR(100),
		nombre VARCHAR(100),
		tipo_doc ENUM(
			'dni',
			'ci',
			'le',
			'lc',
			'pass'
		),
		num_doc INT UNSIGNED,
		direccion VARCHAR(200),
		telefono INT,
		correo VARCHAR(200),
	    estado BOOLEAN,
		PRIMARY KEY (id_profesor),
		UNIQUE KEY (tipo_doc, num_doc)
	);
	ALTER TABLE profesores
		MODIFY estado BOOLEAN DEFAULT TRUE; ## modificamos un campo existente
/* Tabla Cursos */
	DROP TABLE IF EXISTS cursos;
	CREATE TABLE cursos(
		id_curso INT AUTO_INCREMENT,
	    nombre VARCHAR(200) NOT NULL, ## campo obligatorio
	    carga_horaria INT UNSIGNED, ##campo de valor positivo
	    PRIMARY KEY (id_curso),
        UNIQUE KEY (nombre, carga_horaria)
	);
/* Tabla Clases */
	DROP TABLE IF EXISTS clases;
	CREATE TABLE clases(
		id_clase INT AUTO_INCREMENT,
	    id_profesor INT, ## campo relacional (debe ser igual al de la tabla relacionada)
	    id_curso INT,
	    dia ENUM(
			'lunes',
	        'martes',
	        'miercoles',
	        'jueves',
	        'viernes',
	        'sabado'
	    ), ## campo de lista de valores (dias)
	    hora TIME, ## campo de hora
	    PRIMARY KEY (id_clase),
	    UNIQUE KEY (id_profesor, id_curso, dia, hora), ## Restricciones para el completado
		FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor) ## relacionamos el campo id_profesor con el que se encuentra en la tabla profesores
	);
	ALTER TABLE clases
		ADD CONSTRAINT FOREIGN KEY (id_curso) REFERENCES cursos(id_curso); ## agregamos una Clave Foranea a la tabla

/* Tabla Clases_Detalle */
	DROP TABLE IF EXISTS clases_detalle;
	CREATE TABLE clases_detalle (
		id_detalle INT AUTO_INCREMENT,
	    id_clase INT,
	    id_alumno INT,
	    observaciones VARCHAR(200),
	    PRIMARY KEY (id_detalle),
	    FOREIGN KEY (id_clase) REFERENCES clases(id_clase), ## clave FORANEA
	    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno), 
	    UNIQUE KEY (id_clase, id_alumno) ## clave UNICA
	);
    
/*Tabla Facturacion*/
	DROP TABLE IF EXISTS facturacion;
    CREATE TABLE facturacion (
		id_factura INT AUTO_INCREMENT,
        id_alnum_facturaumno INT,
        total INT,
        fecha DATE,
        tipo ENUM ('debe', 'haber'),
        num_factura INT,
        PRIMARY KEY (id_factura),
        UNIQUE KEY (Tipo, num_factura),
        FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno)
    );

/*Tabla Facturacion_Detalle*/
	DROP TABLE IF EXISTS facturacion_detalle;
    CREATE TABLE facturacion_detalle(
		id_detalle INT AUTO_INCREMENT,
        id_factura INT,
        id_curso INT,
        cantidad INT,
        precio INT,
        PRIMARY KEY(id_detalle),
        UNIQUE KEY(id_factura, descripcion, cantidad, precio),
        FOREIGN KEY(id_factura) REFERENCES facturacion(id_factura)
    );