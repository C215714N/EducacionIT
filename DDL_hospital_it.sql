/*	DDL Data Definition Language
	creacion eliminacion edicion db/tablas
*/
# creacion schema
DROP DATABASE IF EXISTS hospital_it; -- elimina si existe
CREATE DATABASE hospital_it; -- creamos la db
USE hospital_it; -- seleccionamos la db

/*
	personal (medicos) => 
		especialidades (areas)
    pacientes => 
		citas (consulta / estudios / tratamiento / cirugia)
        emergencias (guargia / cirugia)
	consultorios => 
    cobertura => pacientes
	paciente => cita <= profesional => (especialidad)
*/

## tabla pacientes
CREATE TABLE pacients(
	pacient_id INT AUTO_INCREMENT, -- nombre tipo_dato(numero) atributo
    pacient_surname VARCHAR(50), -- cadena de texto variable
    pacient_name VARCHAR(50), -- maximo 50 caracteres
    birth_date DATE, -- campo de fecha 'YYYY-MM-DD'
    blood_group ENUM('0','A','B','AB'), -- lista de valores
    blood_type ENUM('+','-') DEFAULT '+', -- valor predeterminado
    cuit CHAR(13), -- cadena de texto fija '99-99999999-9'
    PRIMARY KEY(pacient_id) -- clave primaria (campo relacional)
);
DESCRIBE pacients;