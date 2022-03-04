Database (schema) (
	Estructura que se utiliza para almacenar informacion
	Se compone de tablas que facilitan la organizacion

	Tablas estan compuestas por:
		campos (columna): conjunto de datos del mismo tipo.
		registros (fila): conjunto de datos que guardan relacion entre si
		datos (celda):	minima porcion de informacion.

	Tipos (
		RELACIONAL *,
		Transaccional,
		Jerarquica,
		Orientada a Objetos,
		etc...
	)
);

Database Engine (MySQL) (
	IBM Desarrolla SQL,
	Oracle adquiere los derechos y desarrolla
		MySQL Workbench (8.x)
		Oracle SQL Server
	Comunidad desarrolla MariaDB (10.x)
);

SQL (Structured Query Language) (
	DDL (Data Definition Language)
		CREATE 	crear db/tables/users
		DROP	eliminar db/tables/users
		ALTER	modificar tables

	DML (Data Manipulation Language)
		INSERT	agregar registros
		DELETE	eliminar registros
		UPDATE	actualizar registros
		SELECT	consultar registros

	DCL (Data Control Language)
		GRANT	otorgar permisos users
		REVOKE 	remover permisos users
		FLUSH PRIVILEGES refrescar permisos
)	