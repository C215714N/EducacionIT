/* DCL - Data Control Language 
	crear, eliminar y asignar permisos
    usuarios
*/
## Usuario Administrador
DROP USER IF EXISTS 'admin'@'localhost'; -- eliminamos si existe
CREATE USER 'admin'@'localhost' -- creacion del usuario en servidor
IDENTIFIED BY 'root'; -- le asignamos la contraseña
## Permisos (Control Total sobre EscuelaIT)
GRANT ALL PRIVILEGES -- instrucciones a ejecutar
ON escuelait.* -- database.tables (* => todas las tablas)
TO 'admin'@'localhost'; -- usuario designado

## Usuario Instructor (Manipulacion de datos)
DROP USER IF EXISTS 'teacher'@'localhost'; -- eliminacion si existe
CREATE USER 'teacher'@'localhost' -- usuario en servidor
IDENTIFIED BY 'pass'; -- contraseña
## Permisos (Control y Edicion de Registros)
GRANT SELECT, INSERT, UPDATE, DELETE
ON escuelait.*
TO 'teacher'@'localhost';

## Usuario Alumno (Carga y Consulta de Datos)
DROP USER IF EXISTS 'student'@'localhost'; -- eliminamos si existe
CREATE USER 'student'@'localhost' -- usuario en servidor
IDENTIFIED BY '1234'; -- contraseña
GRANT SELECT, INSERT
ON escuelait.*
TO 'student'@'localhost';

## Usuario Invitado (Lectura de datos)
DROP USER IF EXISTS 'guest'@'localhost'; -- eliminamos si existe
CREATE USER 'guest'@'localhost' -- usuario en servidor
IDENTIFIED BY '000'; -- contraseña
## Permisos (Solo lectura - Version de prueba)
GRANT SELECT
ON escuelait.*
TO 'guest'@'localhost';

# Reparacion Base de datos Servidor
SHOW DATABASES; -- verificamos los esquemas del servidor
USE mysql; -- Seleccionamos la db principal
SHOW TABLES; -- verificamos las tablas de la base de datos
REPAIR TABLE db, global_priv; -- reconstruye indices y elimina datos corruptos