/*  DDL: Data Definition Language
	creacion / eliminacion / modificacion
    db / tablas / usuarios
*/

# Definicion de la base de datos
DROP DATABASE IF EXISTS hospital_business; -- eliminamos si existe
CREATE DATABASE hospital_business; -- creamos la db
USE hospital_business; -- seleccionamos la db

# Definicion de Tablas
/* Personal => turno/guardia
			=> especialidad
            => servicios
   Usuarios => turno/guardia
			=> datos => historia
            => Insumos => ventas
*/

CREATE TABLE users(
	id INT AUTO_INCREMENT, -- numero automatico
    username VARCHAR(20), -- cadena de texto
    userpass VARCHAR(20), -- 20 caracteres maximo
    employee BOOLEAN, -- verdadero o falso
    # Restricciones
    PRIMARY KEY(id), -- clave principal (relacional)
    UNIQUE KEY(username) -- campo unico (local)
);
# modificacion de estructura
ALTER TABLE users
MODIFY employee BOOLEAN DEFAULT false, -- modificamos el campo
ADD COLUMN created DATETIME DEFAULT current_timestamp; -- agregamos un campo (al final)
# descripcion de la estructura
DESCRIBE users;

/* DML: Data Manipulation Language
	insertar / eliminar / actualizar / consultar
    registros (filas)
*/
# Carga selectiva de datos
INSERT INTO users(username, userpass)
VALUES ('cristian', 'root');

INSERT INTO users(username, employee, userpass)
VALUES ('c215714n', true, 'r00t');

# Carga Multiple
INSERT INTO users(username, userpass)
VALUES	('Maria', 'pass'),
		('R4m1r0','user'),
        ('Damian','access'),
        ('c215714n!#','vtodyosm'),
        ('admin','d48w58qj');

# consulta general de datos
SELECT * FROM users;

# reinicio de tabla (eliminar registros)
TRUNCATE users; -- vuelve el contador a 0