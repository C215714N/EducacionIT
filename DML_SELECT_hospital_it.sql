/*	DML Data Manipulation Language
	SELECT: solicitar registros de tablas
*/

## Tabla pacientes
-- consulta general
	SELECT * FROM patients;
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
-- departamentos que contenga la silaba "psi"
	SELECT * FROM departments
    WHERE department LIKE "%psi%";
## Tabla especialidades
	SELECT * FROM professions;