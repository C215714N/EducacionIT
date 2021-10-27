/*  DATA CONTROL LANGUAGE
	lenguaje de control de datos
    se utiliza para administrar los usuarios de la conexion
    otorgar y eliminar permisos y acceso a los mismos*/
## Creacion de usuarios
-- administrador (control total DB)
DROP USER IF EXISTS 'admin'@'localhost';
CREATE USER 'admin'@'localhost' -- usuario@servidor
IDENTIFIED BY 'root'; -- contraseña

GRANT ALL PRIVILEGES -- permisos (control total)
ON pepe_y_los_globos_store.* -- DB.tablas
TO 'admin'@'localhost'; -- usuario

-- supervisor
DROP USER IF EXISTS 'manager'@'localhost';
CREATE USER 'manager'@'localhost' IDENTIFIED BY '1man';

GRANT INSERT, SELECT, UPDATE, DELETE
ON pepe_y_los_globos_store.*
TO 'manager'@'localhost';

-- empleado 
DROP USER IF EXISTS 'employee'@'localhost';
CREATE USER 'employee'@'localhost' IDENTIFIED BY '1234';

GRANT INSERT, SELECT
ON pepe_y_los_globos_store.*
TO 'employee'@'localhost';

-- invitado
DROP USER IF EXISTS 'invited'@'localhost';
CREATE USER 'invited'@'localhost' IDENTIFIED BY '123';

GRANT SELECT
ON pepe_y_los_globos_store.*
TO 'invited'@'localhost';

## Refrescar permisos
FLUSH PRIVILEGES;