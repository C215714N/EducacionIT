/*	DML Data Manipulation Language
	INSERT: agregar registros en tablas
*/
USE hospital_it;

# tabla pacientes
-- carga completa (ordinal)
INSERT INTO pacients VALUES(
	0,				-- pacient_id (AUTOMATICO)
    "Racedo",  		-- pacient_surname
	"Cristian",		-- pacient_name
	"1991-04-18",	-- birth_date
	1,				-- bood_group (1:0, 2:A, 3:B, 4:AB)
	1,				-- blood_type (1:+, 2:-)
	"20-35335446-5"	-- cuit
);
-- carga selectiva (orden personalizado)
INSERT INTO pacients(pacient_name, pacient_surname, cuit, birth_date)
VALUES ('Juan','Perez','25-08912342-4','1950-07-04');
-- consulta general
SELECT * FROM pacients;