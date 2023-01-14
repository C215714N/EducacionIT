/* DDL: Data Definition Language 

*/
CREATE TABLE doctypes(
	id INT AUTO_INCREMENT,
    doctype VARCHAR(20),
    PRIMARY KEY(id),
    UNIQUE KEY (doctype)
);

CREATE TABLE nationalities(
	id INT AUTO_INCREMENT,
    nationality VARCHAR(30),
    PRIMARY KEY(id),
    UNIQUE KEY(nationality)
);

CREATE TABLE users_data(
	id INT AUTO_INCREMENT,
    userId INT,
    first_name VARCHAR(50) NOT NULL,
    second_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    second_last_name VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    gender ENUM('M','F','O'),
    uid VARCHAR(30) NOT NULL,
    doctype INT,
    nationality INT,
    address VARCHAR(50),
    phone VARCHAR(25),
    email VARCHAR(150),
    PRIMARY KEY(id),
    UNIQUE KEY(uid),
    UNIQUE KEY(
		first_name, 
        second_name, 
        last_name, 
        second_last_name, 
        birthdate, 
        nationality, 
        phone, 
        email),
	FOREIGN KEY(userId) REFERENCES users(id) -- campo_local => tabla(campo_relacional)
);

# modificacion Tabla
ALTER TABLE users_data
ADD CONSTRAINT FOREIGN KEY (doctype) REFERENCES doctypes(id),
ADD CONSTRAINT FOREIGN KEY (nationality) REFERENCES nationalities(id);

/* DML: Data Manipulation Language 

*/
# carga de nacionalidades
INSERT INTO nationalities(nationality)
VALUES 	("argentina"), 	-- 1
		("boliviana"), 	-- 2
		("brasileña"), 	-- 3
		("paraguaya"), 	-- 4
        ("uruguaya"), 	-- 5
        ("peruana"),	-- 6 
        ("venezolana"), -- 7
        ("colombiana"), -- 8
        ("chilena"), 	-- 9
        ("ecuatoriana"),-- 10
        ("guyanesa"), 	-- 11
        ("hondureña"), 	-- 12
        ("mexicana"), 	-- 13
        ("panameña"), 	-- 14
        ("cubana"), 	-- 15
        ("española"), 	-- 16
        ("portuguesa"), -- 17
        ("italiana"); 	-- 18
# carga de tipos de documentos
INSERT INTO doctypes(doctype)
VALUES 	('cuil'),		-- 1
		('pasaporte'),	-- 2
		('du'),			-- 3
        ('cedula'), 	-- 4
        ('rut'),		-- 5
        ('lc'), 		-- 6
        ('le');			-- 7

# Carga de datos de usuario
INSERT INTO users_data(userId, first_name, second_name, last_name, birthdate, gender, nationality, uid, doctype, phone, email)
VALUES (1, 'Cristian','Damian','Racedo','1991-04-18', 1, 1, '20-35336446-5', 1, '(54911)0303-4567', 'cristiandracedo@hotmail.com');

# Carga por asignacion
INSERT INTO users_data
SET 	userId = (SELECT id FROM users WHERE username = 'maria'), -- subconsulta
		first_name = 'Maria de los Angeles',
        second_name = 'Candelaria Trinidad',
        last_name = 'Calzadilla',
        second_last_name = 'Urruchaga',
        birthdate = '2000-02-29',
        gender = 2,
        nationality = (SELECT id FROM nationalities WHERE nationality = 'hondureña'),
        doctype = (SELECT id FROM doctypes WHERE doctype = 'pasaporte'),
        uid = 'MACTCU 1293-8412-3843-1234',
        email = 'mda_candelaria.calzadilla_u@gmail.com';
# CONSULTAS
## datos de usuario
SELECT * FROM users_data;

## id nacionalidad colombiana
SELECT * FROM nationalities
WHERE nationality = 'colombiana'; -- condicion

## nacionalidades que empiezan con "p"
SELECT * FROM nationalities
WHERE nationality LIKE "p%"; -- % cualquier cantidad de caracteres

SELECT * FROM nationalities
WHERE nationality LIKE "paname_a"; -- _ 1 caracter cualquiera