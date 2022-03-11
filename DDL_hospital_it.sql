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
CREATE TABLE patients(
	patient_id INT AUTO_INCREMENT, -- nombre tipo_dato(numero) atributo
    patient_surname VARCHAR(50), -- cadena de texto variable
    patient_name VARCHAR(50), -- maximo 50 caracteres
    birth_date DATE, -- campo de fecha 'YYYY-MM-DD'
    blood_group ENUM('0','A','B','AB'), -- lista de valores
    blood_type ENUM('+','-') DEFAULT '+', -- valor predeterminado
    cuit CHAR(13), -- cadena de texto fija '99-99999999-9'
    PRIMARY KEY(pacient_id) -- clave primaria (campo relacional)
);
ALTER TABLE patients
	CHANGE COLUMN patient_surname surname VARCHAR(50),
	CHANGE COLUMN patient_name name VARCHAR(50),
	ADD COLUMN address VARCHAR(200),
	ADD COLUMN country VARCHAR(100);
ALTER TABLE patients
	ADD CONSTRAINT UNIQUE KEY(cuit),
    ADD CONSTRAINT UNIQUE KEY(surname, name, birth_date, address, country);
/* cambios de nombre en la tabla
	RENAME TABLE pacients TO patients;
*/
DESCRIBE patients;
