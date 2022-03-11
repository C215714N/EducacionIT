/*	DML Data Manipulation Language
	INSERT: agregar registros en tablas
*/
USE hospital_it;

# tabla pacientes
-- carga completa (ordinal)
INSERT INTO patients VALUES(
	0,				-- patient_id (AUTOMATICO)
    "Racedo",  		-- patient_surname
	"Cristian",		-- patient_name
	"1991-04-18",	-- birth_date
	1,				-- bood_group (1:0, 2:A, 3:B, 4:AB)
	1,				-- blood_type (1:+, 2:-)
	"20-35335446-5"	-- cuit
);
-- carga selectiva (orden personalizado)
INSERT INTO patients(name, surname, cuit, birth_date)
VALUES ('Juan','Perez','25-08912342-4','1950-07-04');

#Tabla Personal
-- carga multiple
INSERT INTO personal(surname, name, cuit, email)
VALUES	('Gomez','Gonzalo','20-18236728-2','g.gomez@gmail.com'),
		('Lopez','Leandro','25-91892327-1','leandro_lopez@hotmail.com'),
		('Perez','Matias','28-18923479-4','mati_perez@gmail.com'),
		('Diaz','Nicolas','20-19283462-2','info@doctordiaz.com'),
		('Ramirez','Juan','21-18923402-1','ramirez_jc@hotmail.com');
-- carga por asignacion
INSERT INTO personal 
SET	surname = "Storm",
    name = "Susan",
    cuit = "27-12893470-3",
    email = "s.storm@fantastic_four.com";

## Tabla Departamentos
INSERT INTO departments(department)
VALUES	('TRAUMATOLOGIA'),
		('RADIOLOGIA'),
		('REUMATOLOGIA'),
		('ORTODONCIA'),
		('CLINICAS'),
		('NUTRICION'),
		('PSICOLOGIA'),
		('CARDIOLOGIA'),
		('FONOAUDIOLOGIA'),
		('ONCOLOGIA'),
		('NEUROLOGIA');
# Tabla especialidades
INSERT INTO professions(personal, department)
VALUES 	(11,11),(11,8),(11,6), -- Susan Storm
		(1,10),(1,7),(1,1); -- Gomez Gonzalo
        
-- consulta general
SELECT * FROM patients;
SELECT * FROM personal;
SELECT * FROM departments;
SELECT * FROM professions;