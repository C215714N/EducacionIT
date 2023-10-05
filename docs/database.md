## DATABASE (SCHEMA)

Estructura que facilita la organizacion de datos y donde estos se almacenan en __Tablas__

* __Campo(Columna)__ Conjunto de datos del mismo tipo
* __Registro(Fila)__ Conjunto de datos que guardan relacion
* __Dato(Celda)__ Minima porcion de informacion

### TIPOS

* **RELACIONAL**
* JERAQUICA
* TRANSACCIONAL
* ORIENTADA A OBJETOS
* ETC...

### ENGINE (MYSQL)
* IBM Desarrolla SQL
* ORACLE Adquiere la Licencia
    * __MySQL Workbench (8.0.3)__
    * Oracle SQL Server
* COMUNIDAD Desarrolla __MariaDB (10.4)__

## SQL(Structure Query Language)

Lenguaje de consulta estructurada cuya sintaxis se encuentra dividida en diferentes sublenguajes segun su funcion, entre ellos estan DDL para la creacion de estructuras como la base de datos y las tablas, DML para la insercion y manipulacion de registros y DCL para la gestion de permisos de conexion y control por usuario.

### DDL(Data Definition Language)

| Comando | Descripcion |
|--|--|
| CREATE | crear db/tablas/usuarios
| DROP   | eliminar db/tablas/usuarios
| ALTER  | modificar tablas

### DML(Data Manipulation Language)

| Comando | Descripcion |
|--|--|
| INSERT | agregar registros 
| DELETE | eliminar registros
| UPDATE | actualizar registros
| SELECT | consultar registros

### DCL(Data Control Language)

| Comando | Descripcion |
|--|--|
| GRANT   | otorgar permisos
| REVOKE  | quitar permisos
| FLUSH PRIVILEGES| refrescar privilegios


[volver](../readme.md)