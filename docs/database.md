## DATABASE (SCHEMA)
Estructura que facilita la organizacion de datos y donde estos se almacenan en __Tablas__

* __Columnas (Campos)__: conjunto de datos de un mismo tipo
* __Filas (Registros)__: conjunto de datos que guardan relacion
* __Celdas (Datos)__: Minima porcion de informacion

### TIPOS:
- *RELACIONAL*
- Jerarquica
- Transaccional
- Orienta a Objetos
- etc...

### Engine (MySQL)
* __IBM__ Desarrolla SQL
* __ORACLE__ Adquiere los derechos
    * Oracle SQL
    * MySQL _(8.0.4)_
* __COMUNIDAD__ Desarrolla MariaDB _(10.4)_

## SQL (Structured Query Language)

Lenguaje de consulta estructurada cuya sintaxis se encuentra dividida en diferentes sublenguajes segun su funcion, entre ellos estan DDL para la creacion de estructuras como la base de datos y las tablas, DML para la insercion y manipulacion de registros y DCL para la gestion de permisos de conexion y control por usuario.

### DDL (Data Definition Language)
| Comando | Descripcion |
|--|--|
| CREATE    | crear db/tablas/usuario
| DROP      | eliminar db/tablas/usuarios
| ALTER     | modificar tables

### DML (Data Manipulation Language)
| Comando | Descripcion |
|--|--|
| INSERT    | cargar registros
| DELETE    | elimnar registros
| UPDATE    | actualizar registros
| SELECT    | consultar registros

### DCL (Data Control Language)
| Comando | Descripcion |
|--|--|
| GRANT     | otorgar permisos de usuario
| REVOKE    | quitar permisos de usuario
| FLUSH PRIVILEGES | refrescar permisos de usuario

[volver](../readme.md)