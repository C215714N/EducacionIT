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
        -- agregamos las columnas faltantes
        ALTER TABLE profesores
			ADD fecha_nac DATE, 
			ADD telefono VARCHAR(20),
			ADD correo VARCHAR(200);
		-- modificamos y agregamos una columna de prueba
		ALTER TABLE profesores
			MODIFY correo VARCHAR(100),
			ADD shortmail VARCHAR(25);
		-- eliminamos la columna repetida
		ALTER TABLE profesores
			DROP COLUMN shortmail;
    ## cursos
		CREATE TABLE cursos (
			id_curso INT AUTO_INCREMENT,
            nombre VARCHAR(50),
            duracion TIME,
            PRIMARY KEY (id_curso)
        );
    ## clases (alumno + curso + profesor)
		CREATE TABLE clases(
			id_clase INT AUTO_INCREMENT,
            dia ENUM ('lunes', 'martes', 'miercoles', 'jueves', 'viernes','sabado'),
            horario ENUM('mañana', 'tarde', 'noche'),
            aula INT,
            id_curso INT,
            id_profesor INT,
            PRIMARY KEY(id_clase),
            UNIQUE KEY(dia, horario, aula),
            UNIQUE KEY(dia, horario, id_profesor, id_curso),
            FOREIGN KEY (id_curso) REFERENCES cursos(id_curso), -- clave foranea (permite vincular campos pk)
			FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor)
        )
	## clases_detalle
		
    ## facturacion (alumno + curso)
	
	