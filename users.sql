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

/* DML: Data Manipulation Language
	insertar / eliminar / actualizar / consultar
    registros (filas)
*/
# Carga selectiva de datos
INSERT INTO users(username, userpass)
VALUES ('cristian', 'root');

INSERT INTO users(username, employee, userpass)
VALUES('c215714n',true,'12345');

SELECT * FROM users;