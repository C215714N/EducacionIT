/* DCL - DATA CONTROL LANGUAGE */

## Usuario Administrador
DROP USER IF EXISTS 'admin'@'localhost'; -- Eliminamos el usuario si existe
CREATE USER 'admin'@'localhost' -- usuario en servidor
IDENTIFIED BY 'R00t'; -- credenciales (contraseña)
### Permisos
GRANT ALL PRIVILEGES -- control Total
ON smsapp.* -- sobre todas las tablas de la DB
TO 'admin'@'localhost'; -- para el usuario

## Usuario Estandar
DROP USER IF EXISTS 'user'@'localhost'; -- Eliminamos si existe
CREATE USER 'user'@'localhost' -- usuario en servidor
IDENTIFIED BY 'p455'; -- credenciales (contraseña)
### Permisos
GRANT SELECT, INSERT, UPDATE -- lectura, escritura, actualizacion
ON smsapp.* -- sobre todas las tablas
TO 'user'@'localhost'; -- para el usuario

## Usuario Invitado
DROP USER IF EXISTS 'guest'@'localhost'; -- Eliminamos el usuario si existe
CREATE USER 'guest'@'localhost' -- usuario en servidor
IDENTIFIED BY '1234'; -- credenciales (contraseña)
### Permisos
GRANT SELECT -- control Total
ON smsapp.* -- sobre todas las tablas de la DB
TO 'guest'@'localhost'; -- para el usuario

FLUSH PRIVILEGES;