/*
	Usuarios -> Datos
	Alumnos -> Curso -> Profesor
    Profesores -> Materia
	Profesores -> Cursos -> Alumnos
    Cargos -> Profesores
*/
CREATE TABLE users_data(
	id INT AUTO_INCREMENT,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    birthdate date, -- campo de tipo fecha
    gender ENUM('M','F','O','PnD'), -- Lista de Opciones (Admite texto o numero)
    id_type ENUM('CI','CUIT/CUIL','DNI','DNIE','LC','LE','PASS','RUC'),
    uid VARCHAR(20), -- Numero de Identificacion
    address VARCHAR(100),
    email VARCHAR(100),
    userId INT, -- debe coincidir con algun Id de la tabla usuarios
    ## Restricciones
    PRIMARY KEY(id),
    UNIQUE KEY(gender, id_type, uid), -- Clave Unica Compuesta
    UNIQUE KEY(userId), -- 1 registro de datos por cada usuario
    FOREIGN KEY(userId) REFERENCES users(user_id) -- Clave Foranea
);

## Carga de Datos de Usuarios Existentes
INSERT INTO users_data(firstname, lastname, id_type, uid, birthdate, gender, email, userId)
VALUES 
('Lionel', 'Messi', 3, '33016244','1987-06-24', 1, 'lionel@messi.com', 4),
('Roberto','Pantalones Cuadrados', 7, 'A1356021','1986-07-14', 3,'sponge_sqrpnts@gmail.com', 7),
('Juan Roman','Riquelme', 2,'20-26752869-2', '1978-06-24', 1, 'Riquelme_feliz10@gmail.com', 6);

SELECT * FROM users_data;