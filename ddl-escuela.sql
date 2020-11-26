/* Creacion Base de Datos */
	SHOW DATABASES; -- muestra las bd del servidor
    DROP DATABASE IF EXISTS escuela; -- eliminamos la bd
	CREATE DATABASE escuela; -- creamos la bd
    USE escuela; ## especificamos la bd a utilizar
    
/* Creacion de Tablas */
	## alumnos
		CREATE TABLE alumnos(
			id_alumno INT AUTO_INCREMENT, -- autonumerico
            apellido VARCHAR(50),
			nombre VARCHAR(50), -- hasta 50 caracteres
            tipo_doc ENUM(
				'dni', 
				'dni ext.', 
				'ci', 
				'lc', 
				'le', 
				'pass'
			), -- lista de opciones
            num_doc INT UNSIGNED, -- numeros positivos
			fecha_nac DATE, -- formato fecha "yyyy-mm-dd"
            telefono VARCHAR(20),
            correo VARCHAR(200),
            observaciones BLOB, -- distincion de mayusculas y minusculas
			PRIMARY KEY(id_alumno), -- campo relacional (clave principal)
			UNIQUE KEY(tipo_doc, num_doc) -- campo unico (local e irrepetible)
        );
    
    ## profesores
        DROP TABLE IF EXISTS profesores;
		CREATE TABLE profesores(
			id_profesor INT AUTO_INCREMENT,
            apellido VARCHAR(50),
            nombre VARCHAR(50),
            tipo_doc ENUM(
				'dni',
                'dni ext.', 
                'ci', 
                'lc', 
                'le', 
                'pass'),
			num_doc INT,
            PRIMARY KEY(id_profesor),
            UNIQUE KEY(tipo_doc, num_doc)
        );
        ALTER TABLE profesores
			ADD fecha_nac DATE, 
			ADD telefono VARCHAR(20),
			ADD correo VARCHAR(200);
		ALTER TABLE profesores
			MODIFY correo VARCHAR(100);
    ## cursos
    
    ## clases (alumno + curso + profesor)
    ## facturacion (alumno + curso)
	
	