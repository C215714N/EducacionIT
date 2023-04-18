# DATABASE (SCHEMA)

Una base de datos es una estructura cuya finalidad es almacenar y organizar informacion. 
Esta compuesta por tablas y sus elementos son los siguientes.
  
* __Campo (Columnas):__ conjunto de datos del mismo tipo
* __Registro (Filas):__ conjunto de datos relacionados entre si
* __Dato (Celdas):__ minima porcion de informacion

## Tipos:
* __RELACIONAL__
* JERARQUICA
* TRANSACCIONAL
* ORIENTADA A OBJETOS
* ETC...


## Database Engine (MySQL)

Un motor de base de datos es una herramienta encargada de recopilar, interpretar y ejecutar las instrucciones SQL brindadas por el usuario, para la correcta manipulacion de los datos.

* _SQL_ es desarrollado por __IBM__
* __ORACLE__ adquiere los derechos
    * _MySQL_ Workbench (8.0.32)
    * _Oracle SQL_
* _Comunidad_ desarrollo __MariaDB (10.4)__

___

## SQL (Structured Query Language)

El lenguaje de consulta estructurada se divide entre varios grupos de sintaxis dependiendo de lo que necesitemos realizar con nuestra base de datos y en que etapa de desarrollo nos encontremos.

### DDL (Data Definition Language)

El lenguaje de definicion de datos es el encargado de establecer las bases, como el tipo de datos a utilizar, capacidad de almacenamiento maximo, etc.

|Comando|Descripcion|
|-|-|
| CREATE: | crear db/tables/users  
| DROP: | eliminar db/tables/users
| ALTER: | modificar tables

### DML (Data Manipulation Language)

El lenguaje de Manipulacion de datos es implementado una vez se encuentran definidas las estructuras y normalmente es implementado por el usuario.

|Comando| Descripcion|
|-|-|
| INSERT | agregar registros |
| DELETE | eliminar registros |
| UPDATE | editar registros |
| SELECT | consultar registros |

### DCL (Data Control Language)

El lenguaje de control de datos brinda seguridad al momento de administrar la base de datos ya que establece los permisos para los usuarios de la conexion.

|Comando|Descripcion|
|-|-|
|GRANT | otorgar permisos |
|REVOKE | quitar permisos |
|FLUSH PRIVILEGES | refrescar permisos |

[volver al inicio](../readme.md)