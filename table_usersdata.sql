/* DDL */
CREATE TABLE users_data(
	id INT AUTO_INCREMENT,
    userId INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    uid CHAR(13), -- cadena de texto fija
    birth_date DATE, -- formato de fecha "YYYY-MM-DD"
    email VARCHAR(100),
    phone VARCHAR(20),
    country VARCHAR(50),
    # restricciones
    PRIMARY KEY(id),
    UNIQUE KEY(uid),
    UNIQUE KEY(email),
    UNIQUE KEY(last_name, first_name, birth_date, phone, country),
    FOREIGN KEY(userId) REFERENCES users(id)
);
# Carga de datos del usuario cristian
INSERT INTO users_data(last_name, first_name, birth_date, uid, email)
VALUES ("Racedo", "Cristian", "1991-04-18", "20-35336446-5", "cristiandracedo@hotmail.com");

INSERT INTO users_data(last_name, first_name, birth_date, uid, email, userId)
VALUES ("Racedo", "Cristian Damian", "1991-04-18", "27-35336446-5", "cristiandracedo@gmail.com", 3);


INSERT INTO users_data(last_name, first_name, birth_date, uid, email, userId)
VALUES 	("Gutierrez", "Brian", "1986-06-25", "20-31898346-3", "brian.g_elmascapo@gmail.com", 5),
		("Gutierrez", "Carlos", "1995-02-15", "20-40323846-2", "guti.carlos.95@gmail.com", 6),
        ("Gomez", "Alejandra", "2000-12-30", "27-48219286-1", "ale_gomez@gmail.com", 4);
#actualizacion general
UPDATE users_data
SET country = "Argentina";

# Actualizacion Datos de CRISTIAN
UPDATE users_data -- tabla a actualizar
SET userId = (SELECT id FROM users WHERE username = "c215714n") -- valor | subconsulta (trae el user Id)
WHERE email = "cristiandracedo@hotmail.com"; -- condicion para actualizar

# Consulta General
SELECT * FROM users_data;

# Consulta por Nombre de Usuario
SELECT username, id FROM users
WHERE username = "cristian";