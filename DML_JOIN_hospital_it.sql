SELECT * FROM turns;
## INNER JOIN: Registros con coincidencias
SELECT 
	turn_id,
    -- patients
    pa.surname, pa.name, pa.cuit,
    -- departments
    d.department,
    -- personal
    CONCAT('dr/a: ', pe.surname, ' ', pe.name) AS profesional
FROM turns AS t
JOIN patients AS pa ON pa.patient_id = t.patient
JOIN professions AS pr ON pr.profession_id = t.area
JOIN personal AS pe ON pe.personal_id = pr.personal
JOIN departments AS d ON d.department_id = pr.department;

## OUTER JOIN: Todos los registros de una tabla y coincidencias de otra
# Pacientes (turnos)
-- LEFT JOIN: pacientes sin turno asignado
SELECT 
	CONCAT(surname, " ",name) AS patient,
	CONCAT(blood_group, blood_type) AS blood,
    turn_id,
    area
FROM patients AS p
LEFT JOIN turns AS t ON p.patient_id = t.patient
WHERE turn_id IS NULL
ORDER BY patient_id, turn_id;

# Tabla turnos (profesiones => departamentos / personal)
-- RIGHT JOIN: areas sin turno y personal sin departamento asignado
SELECT 
	pr.profession_id AS office,
    d.department,
    pe.surname,
    pe.name,
    pe.role,
	turn_id
FROM turns AS t
RIGHT JOIN professions AS pr ON pr.profession_id = t.area
RIGHT JOIN departments AS d ON d.department_id = pr.department
RIGHT JOIN personal AS pe ON pe.personal_id = pr.personal
WHERE turn_id IS NULL AND role = "MED"
ORDER BY office, department;

## CROSS JOIN: producto cartesiano de las tablas
# Tabla patiens (personal)
-- combinaciones de asignacion de turnos
SELECT 
	patient_id,
	CONCAT(pa.surname, " ",pa.name) AS patient,
    GROUP_CONCAT(pe.surname, " ",pe.name) AS professional
FROM patients AS pa
CROSS JOIN personal AS pe
GROUP BY patient
ORDER BY patient_id, professional;