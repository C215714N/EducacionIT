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