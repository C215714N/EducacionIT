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
-- modificacion y generacion de columnas
ALTER TABLE patients
	CHANGE COLUMN patient_surname surname VARCHAR(50),
	CHANGE COLUMN patient_name name VARCHAR(50),
	ADD COLUMN address VARCHAR(200),
	ADD COLUMN country VARCHAR(100);
-- restricciones de campos (Unicas y Multiples)
ALTER TABLE patients
	ADD CONSTRAINT UNIQUE KEY(cuit),
    ADD CONSTRAINT UNIQUE KEY(surname, name, birth_date, address, country);
/* cambios de nombre en la tabla
	RENAME TABLE pacients TO patients;
*/
DESCRIBE patients;

## Tabla Personal
CREATE TABLE personal(
	personal_id INT AUTO_INCREMENT,
    surname VARCHAR(50),
    name VARCHAR(100),
    cuit CHAR(13) NOT NULL, -- debe cargarse
    birth_date DATE,
    role ENUM('ADM', 'MED', 'ENF', 'LIM', 'SEG') DEFAULT 'MED',
    address VARCHAR(200),
    phone VARCHAR(20),
    email VARCHAR(200),
    PRIMARY KEY(personal_id),
    UNIQUE KEY(cuit),
    UNIQUE KEY(email)
);

## Tabla departamentos
CREATE TABLE departments(
	department_id INT AUTO_INCREMENT,
    department VARCHAR(35),
    PRIMARY KEY(department_id),
    UNIQUE KEY(department)
);

## Tabla Especialidades
CREATE TABLE professions(
	profession_id INT AUTO_INCREMENT,
    personal INT, -- campo relacional Personal(personal_id)
    department INT, -- campo relacional Departments(department_id)
    PRIMARY KEY(profession_id),
    UNIQUE KEY(personal, department),
    FOREIGN KEY(personal) REFERENCES Personal(personal_id), -- campo_local => tabla(campo_remoto)
    FOREIGN KEY(department) REFERENCES Departments(department_id) -- el valor debe existir en la tabla relacional
);