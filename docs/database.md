database(schema) (
    Estructura de Datos
    organizar y almacenar informacion
    compuesta por tablas(
        campos(columnas): conjunto de datos del mismo tipo
        registros(filas): conjunto de datos relacionados entre si
        datos(celdas): minima porcion de informacion
    )

    tipos (
        *Relacional*
        Jerarquicas
        Transaccional
        Orientadas a Objetos
        etc...
    )
)

database engine(mysql)(
    IBM Desarrolla el lenguaje SQL
    Oracle adquiere los derechos (
        * MySQL Workbench (v8.0.3)
        * Oracle SQL 
    )
    Comunidad Desarrolla MariaDB (v10.4)
)

SQL (Structured Query Language)(
    DDL (Data Definition Language)
        CREATE  crear db/tablas/usuarios
        DROP    eliminar db/tablas/usuarios
        ALTER   modificar tablas

    DML (Data Manipulation Language)
        INSERT  agregar registros
        DELETE  eliminar registros
        UPDATE  actualizar registros
        SELECT  consultar registros

    DCL (Data Control Language)
        GRANT   otorgar permisos
        REVOKE  remover permisos
        FLUSH PRIVILEGES refrescar permisos
)