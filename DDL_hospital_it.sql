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
    PRIMARY KEY(patient_id) -- clave primaria (campo relacional)
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

## Tabla coberturas Medicas
CREATE TABLE medical_coverages(
	coverage_id INT AUTO_INCREMENT,
	coverage_name VARCHAR(150) NOT NULL,
    description VARCHAR(200),
    phone VARCHAR(20),
    email VARCHAR(200),
    address VARCHAR(100),
    PRIMARY KEY(coverage_id),
    UNIQUE KEY(coverage_name)
);

## Tabla Planes de Cobertura
CREATE TABLE coverage_plans(
	plan_id INT AUTO_INCREMENT,
    plan_name VARCHAR(50),
    coverage INT,
    medicament ENUM("si","no","parcial") DEFAULT "no",
    translate ENUM("si", "no", "parcial") DEFAULT "no",
    treatment ENUM("si","no","parcial") DEFAULT "no",
    urgency ENUM("si", "no", "parcial") DEFAULT "no",
    guard ENUM("si","no","parcial") DEFAULT "no",
    home_attention ENUM("si", "no", "parcial") DEFAULT "no",
    surgical_procedure ENUM("si","no","parcial") DEFAULT "no",
    hospitalizations ENUM("si", "no", "parcial") DEFAULT "no",
    PRIMARY KEY(plan_id),
    UNIQUE KEY(plan_name, coverage),
    FOREIGN KEY(coverage) REFERENCES medical_coverages(coverage_id)
);

## Tabla Coberturas por paciente
CREATE TABLE patients_coverage(
	id INT AUTO_INCREMENT,
    patient INT,
    plan INT,
    type ENUM("PREPAGA","OBRA SOCIAL") DEFAULT "PREPAGA",
	PRIMARY KEY(id),
    UNIQUE KEY(patient, plan),
    FOREIGN KEY(patient) REFERENCES patients(patient_id),
    FOREIGN KEY(plan) REFERENCES coverage_plans(plan_id)
);

## Tabla de Turnos
CREATE TABLE turns(
	turn_id INT,
    patient INT,
    turn DATETIME,
    professional INT
);
ALTER TABLE turns
MODIFY turn_id INT AUTO_INCREMENT, -- modifica el tipo de dato
ADD CONSTRAINT PRIMARY KEY(turn_id), -- agrega un PK (campo relacional)
CHANGE professional area INT, -- cambia el nombre y tipo de dato
ADD CONSTRAINT FOREIGN KEY(patient) REFERENCES patients(patient_id), -- agrega un FK (relacion externa)
ADD CONSTRAINT FOREIGN KEY(area) REFERENCES professions(profession_id), 
ADD CONSTRAINT UNIQUE KEY(turn, area), -- agrega una restriccion local
ADD CONSTRAINT UNIQUE KEY(patient, turn);