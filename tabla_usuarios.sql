/* DML (Data Manipulation Language)
	Crear / Eliminar / Modificar
    DB / Tablas
*/

# Creacion del esquema
DROP DATABASE IF EXISTS escuelait; -- elimino si existe
CREATE DATABASE escuelait; -- creo la base de datos
USE escuelait; -- selecciono la base de datos

# Creacion de Tablas
## Usuarios
CREATE TABLE users(
	user_id INT AUTO_INCREMENT, -- entero automatico
    username VARCHAR(20), -- cadena de texto variable
    userpass VARCHAR(20), -- almacena los caracteres ingresados
	# Restricciones
    PRIMARY KEY(user_id), -- Clave Primaria (Relacional)
    UNIQUE KEY(username) -- Clave Unica (Local)
);

# Consulta de Usuarios
SELECT * FROM users;