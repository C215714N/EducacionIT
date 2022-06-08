# Database (schema)

Estructura utilizada para organizar y almacenar la informacion en forma de tablas, cuyo objetivo principal consiste en mantener la integridad de los elementos que la componen.

## Composicion:
Las tablas representan las entidades principales dentro de una base de datos y se encuentran divididas en las siguientes partes:
> **Campos(columnas)**:	Datos pertenecientes al mismo tipo
> **Registros(filas)**:	Conjunto de datos que guardan relacion
> **Datos(celdas)**: 	Minima porcion de informacion

## Modelos:
* **Relacional**
* Transaccional
* Jerarquico
* Orientado a Objetos
* etc...

## Database Engine (MySQL)
Un Motor de base de datos es una herramienta que permite la manipulacion de nuestras bases de datos mediante una sintaxis particular, existen diferentes motores que admiten variedad de comandos y algunas de las empresas que mas destacan son:
> **IBM** Desarrolla *SQL*
>
> **Oracle** adquiere los derechos
> * *MySQL Workbench (8.1)*
> *	Oracle SQL server
>
> **Comunidad** Desarrolla *MariaDB (10.4)*

## SQL (Structure Query Language)
El lenguaje de consulta estructurada se compone de diferentes sublenguajes, cada una con sus palabras clave correspondientes. Estas facilitan su comprension y evitan que haya errores a la hora de crear las estructuras y cargar los registros en nuestas bases de datos.

### DDL (Data Definition Language)
EL lenguaje de definicion de datos permite la creacion y manipulacion de las estructuras a utilizar, incluyendo la propia base de datos.
> **CREATE:** 	Crear db/tables/users
>
> **DROP:** 		Eliminar db/tables/users
>
> **ALTER:** 		Modificar tables

### DML (Data Manipulation Language)
El lenguaje de Manipulacion de datos permite la carga y edicion de registros dentro de las estructuras creadas con anterioridad.
> **INSERT:**  	Insertar registros
>
> **DELETE:** 	Eliminar registros
>
> **UPDATE:** 	Actualizar registros
>
> **SELECT:** 	Consultar registros

### DCL (Data Control Language)
El lenguaje de control de datos permite la asignacion de permisos para los diferentes usuarios que se conectan al servidor de base de datos.
> **GRANT:** 		Otorgar permisos
>
> **REVOKE:** 	Quitar permisos
>
> **FLUSH PRIVILEGES:** refrescar permisos

[volver](../readme.md)
