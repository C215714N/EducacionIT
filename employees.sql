/* DDL: Data Definition Language

*/
CREATE TABLE charges(
	id INT AUTO_INCREMENT,
    description VARCHAR(50),
    PRIMARY KEY(id),
    UNIQUE KEY(description)
);
CREATE TABLE professions(
	id INT AUTO_INCREMENT,
    description VARCHAR(50),
    PRIMARY KEY(id),
    UNIQUE KEY(description)
);
CREATE TABLE paytypes(
	id INT AUTO_INCREMENT,
    description VARCHAR(50),
    PRIMARY KEY(id),
    UNIQUE KEY(description)
);
CREATE TABLE employees(
	id INT AUTO_INCREMENT,
    employeeId CHAR(9),
    userId INT,
    chargeId INT,
    professionId INT,
    start_date DATE,
    payId INT,
    salary DECIMAL(22,4),
    active BOOLEAN DEFAULT TRUE,
    PRIMARY KEY(id),
    UNIQUE KEY(employeeId),
    UNIQUE KEY(userId),
    FOREIGN KEY(userId) REFERENCES users(id),
    FOREIGN KEY(chargeId) REFERENCES charges(id),
    FOREIGN KEY(professionId) REFERENCES professions(id),
    FOREIGN KEY(payId) REFERENCES paytypes(id)
);

/* DML: Data Manipulation Language

*/
## cargos existentes
INSERT INTO charges(description)
VALUES	('administrativo'), -- 1
        ('auditor'), 		-- 2
		('enfermero'), 		-- 3
		('medico'), 		-- 4
        ('seguridad'), 		-- 5
        ('tecnico'), 		-- 6
        ('mantenimiento'), 	-- 7
        ('supervisor'),		-- 8
        ('director');		-- 9
        
INSERT INTO professions(description)
VALUES 	('clinico'), ('pediatria'), ('radiologia'), ('contabilidad'), ('ventas'), -- 1 al 5
		('cardiologia'), ('urologia'), ('ginecologia'), ('odontologia'), ('nutricion'), -- 6 al 10
        ('endocrinologia'), ('psicologia'), ('oncologia'), ('fonoaudiologia'), ('enfermeria'); -- 11 al 15
        
INSERT INTO paytypes(description)
VALUES ('mensual'), ('quincenal'), ('semanal'), ('diario'), ('hora'), ('consulta'), ('procedimiento'); -- 1 al 7

# Carga por consulta (insert select)
INSERT INTO employees(userId, start_date)
SELECT id, CURRENT_DATE() 
FROM users WHERE employee = 1;

# Consultas Generales
SELECT * FROM employees;

UPDATE employees
SET chargeId = 4
WHERE chargeId IS NULL;

UPDATE employees
SET professionId = RAND() * 15
WHERE professionId IS NULL;

## Todos los datos de usuarios, sean empleados o no
SELECT 
	e.userId,
    first_name,
    last_name
FROM employees AS e
RIGHT JOIN users_data AS ud ON e.userId = ud.userId;