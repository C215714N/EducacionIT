/* DDL: Data Definition Language

*/
CREATE TABLE pacients(
	id INT AUTO_INCREMENT,
    userId INT,
	weight DECIMAL(5,2),
    height DECIMAL(5,2),
    bloodtype ENUM('O','A','B','AB'),
    bloodrh ENUM('+','-'),
    disability BOOLEAN DEFAULT false,
    alergies TEXT,
    PRIMARY KEY(id),
    UNIQUE KEY(userId),
    FOREIGN KEY(userId) REFERENCES users(id)
);
# renombrar tabla en caso de ser necesario
RENAME TABLE pacients TO patients;

CREATE TABLE pathologies(
	id INT AUTO_INCREMENT,
    description VARCHAR(50),
    PRIMARY KEY(id),
    UNIQUE KEY(description)
);
CREATE TABLE attentions(
	id INT AUTO_INCREMENT,
    description VARCHAR(50),
    PRIMARY KEY(id),
    UNIQUE KEY(description)
);
CREATE TABLE patient_history(
	id INT AUTO_INCREMENT,
    patientId INT,
    pathologyId INT,
    attention INT,
    date DATETIME DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY(id),
    UNIQUE KEY(patientId, pathologyId),
    FOREIGN KEY(patientId) REFERENCES patients(id),
    FOREIGN KEY(pathologyId) REFERENCES pathologies(id),
    FOREIGN KEY(attention) REFERENCES attentions(id)
);
/*	DML: Data Manipulation Language

*/
# carga de pacientes
INSERT INTO patients(userId)
SELECT id FROM users WHERE employee = 0;

# carga de patologias
INSERT INTO pathologies(description)
VALUES  ('cefalea'),('dolor estomacal'),('fiebre'),('gastroenteritis'),('anemia'),('faringitis'),('presion alta'),('presion baja'),
		('hemorragia'),('fractura expuesta'),('fisura'),('luxacion'),('desgarro'),('dolor lumbar'),('problemas respiratorios'),('taquicardia'),
		('bradicardia'),('peritonitis'),('apendicitis'),('pancreatitis'),('traumatismo'),('hematoma'),('contusion'),('indeterminado');

# carga de tipos de atencion
INSERT INTO attentions(description)
VALUES ('turno'),('guardia'),('emergencia'),('consulta'),('cirugia');

INSERT INTO patient_history 
	SET	patientId = CEIL(RAND() * 4),
	pathologyId = CEIL( RAND() * 24 ),
	attention = CEIL( RAND() * 5 );
SELECT * FROM patient_history;

# Usuarios que no son empleados y no existen en la tabla pacientes
SELECT * FROM users
WHERE employee = true 
AND id NOT IN(SELECT userId FROM patients);

# actualizacion insegura (no especifica valor unico)
UPDATE patients 
SET	weight = RAND() * 60 + 60, -- peso aleatorio entre 60kg y 120kg
    height = RAND() * 50 + 150; -- estatura aleatoria entre 150cm y 200cm

# actualizacion con verificacion (cuando no existe valor)
UPDATE patients 
SET bloodtype = CEIL(RAND() * 4), -- valor entre 0 y 4 (redondeado hacia arriba)
    bloodrh = FLOOR(RAND() + 1) -- valor entre 1 y 2 (redondeado hacia abajo)
WHERE bloodtype IS NULL; -- actualiza solamente si no esta definido

/* Consulta con funciones */
# ultimas 5 patologias ingresadas
SELECT * FROM pathologies
ORDER BY id DESC -- define el orden de salida
LIMIT 5 -- cuantos resultados deben mostrarse
OFFSET 0; -- a partir la la posicion indicada

# Conteo de patologias
SELECT COUNT(id) AS count FROM pathologies;

# pacientes posean o no datos cargados
SELECT 
	# patients
    p.userId,
    # datos de usuario
    first_name, last_name
FROM patients AS p
LEFT JOIN users_data AS ud ON ud.userId = p.userId