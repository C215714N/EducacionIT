/*	DML Data Manipulation Language
	SELECT: solicitar registros de tablas
*/
USE hospital_it;
## consultas generales
    SELECT * FROM patients;
    SELECT * FROM personal;
    SELECT * FROM departments;
    SELECT * FROM medical_coverages;
    SELECT * FROM patients_coverage;
    SELECT * FROM professions;
    SELECT * FROM turns;
    SELECT * FROM coverage_plans;

## Tabla pacientes
-- consulta con restricciones
	SELECT patient_id, name, surname, cuit FROM patients
	ORDER BY cuit  -- orden de los resultados
	LIMIT 10 -- cantidad de resultados a mostrar
	OFFSET 0; -- a partir de cierta posicion

## Tabla personal
	SELECT personal_id, name, surname, cuit, role FROM personal
	ORDER BY surname DESC, cuit
	LIMIT 5
	OFFSET 0;
-- cuit empezando con 21 o 25
    SELECT * FROM personal
    WHERE cuit IN(21,25); -- SQL busca los numeros en la cadena de texto
-- apellidos empezados con "l" y nombres empezados con "m"
	SELECT * FROM personal
    WHERE surname LIKE "l%" OR name LIKE "m%"; -- %: cualquier cantidad de caracteres
## Tabla departamentos
/*
	AND	| c1F | c1V		OR	| c1V | c1F		XOR	| c1V | c1F
    c2F	| F   | F 		c2V	|  V  | V		c2V	|  F  | V
    c2V	| F	  | V		c2F	|  V  | F		c2F	|  V  | F
*/
-- id superior a 8
	SELECT * FROM departments 
	WHERE department_id > 8;
-- id entre 3 y 7 (inclusive)
	SELECT * FROM departments 
	WHERE department_id BETWEEN 3 AND 7
	ORDER BY department_id;
-- id cuyo valor se encuentra en 1,7,8,10,11
	SELECT * FROM departments 
	WHERE department_id IN(1,7,8,10,11)
	ORDER BY department_id;
-- departamentos que no terminan en "...GIA"
	SELECT * FROM departments
    WHERE department NOT LIKE "%gia";
-- departamentos que contenga la silaba "...PSI..."
	SELECT * FROM departments
    WHERE department LIKE "%psi%";
    
## Tabla especialidades
	SELECT * FROM professions;
## Tabla planes de coberturas
	SELECT
		coverage,
		COUNT(*) AS plans, -- cuenta los registros
		GROUP_CONCAT(plan_name) AS all_plans -- agrupa los datos
	FROM coverage_plans
	GROUP BY coverage -- criterio para agrupar valores
	ORDER BY coverage;

## Coberturas por pacientes
	SELECT 
		patient, 
		COUNT(*) AS plans,
		GROUP_CONCAT(plan) AS plan_list
	FROM patients_coverage
	GROUP BY patient
	ORDER BY patient, plan, type;