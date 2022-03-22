USE hospital_it;
/*	DML Data Manipulation Language
	DELETE: eliminar registros de tablas
*/
## Tabla coberturas por pacientes
	-- eliminacion total
	DELETE FROM patients_coverage; 
	-- reinicio de tabla
    TRUNCATE patients_coverage; 
	-- eliminacion segura
    DELETE FROM patients_coverage
    WHERE patient IN(2,7) AND plan >= 20;
    
/*	DML Data Manipulation Language
	UPDATE: actualizar registros de tablas
*/
## Pacientes
-- actualizacion por casos
    UPDATE patients
    SET blood_group = 
    CASE -- condiciones para definir el valor
		WHEN surname LIKE "%ez" AND name LIKE "%o" THEN "0"  	-- si A entonces 1
		WHEN name LIKE "m%" OR name LIKE "l%" THEN "AB"			-- si no A y si B entonces 2
        WHEN surname LIKE "%ar%" OR name LIKE "%ab%" THEN "A" 	-- si no AB y si C entonces 3
        ELSE "B" -- si no abc
	END -- fin de la condicion
    WHERE blood_group IS NULL; -- condicion para la actualizacion
    
## Tabla Planes de cobertura
	-- actualizacion condicional
    UPDATE coverage_plans 
    SET 	medicament = 1, translate = 1, treatment = 1, urgency = 1, guard = 1, 
			home_attention = 1, surgical_procedure = 1,	hospitalizations = 1
	WHERE plan_name = "Plan 360";
    