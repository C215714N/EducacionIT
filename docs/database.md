## Database (schema)
Estructura que se utiliza para almacenar informacion, la misma esta compuesta de tablas que facilitan la organizacion
### Tablas:
* __campos (columna)__: conjunto de datos del mismo tipo.
* __registros (fila)__: conjunto de datos que guardan relacion entre si
* __datos (celda)__:	minima porcion de informacion.

### Tipos
* _RELACIONAL_,
* Transaccional,
* Jerarquica,
* Orientada a Objetos,
* etc...

## Database Engine (MySQL)
Se conoce como motor de base de datos a la herramienta que permite realizar modificaciones sobre dichos elementos implementando una sintaxis particular. Respecto a la historia del Motor de base de datos MySQL se puede mencionar lo siguiente:
* IBM Desarrolla __SQL__
* Oracle adquiere los derechos y desarrolla:
	* __MySQL Workbench (8.x)__
	*  __Oracle SQL Server__
* Comunidad desarrolla __MariaDB (10.x)__

### SQL (Structured Query Language)
Lenguaje de consulta estructurada cuya sintaxis se encuentra dividida en diferentes sublenguajes segun su funcion, entre ellos estan _DDL_ para la creacion de estructuras como la base de datos y las tablas, _DML_ para la insercion y manipulacion de registros y _DCL_ para la gestion de permisos de conexion y control por usuario.
#### DDL (Data Definition Language)
*	__CREATE__ 	crear db/tables/users
*	__DROP__	eliminar db/tables/users
*	__ALTER__	modificar tables
#### DML (Data Manipulation Language)
*	__INSERT__	agregar registros
*	__DELETE__	eliminar registros
*	__UPDATE__	actualizar registros
*	__SELECT__	consultar registros
#### DCL (Data Control Language)
*	__GRANT__	otorgar permisos users
*	__REVOKE__ 	remover permisos users
*	__FLUSH__ PRIVILEGES refrescar permisos
)
