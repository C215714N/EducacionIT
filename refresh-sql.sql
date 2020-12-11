/*DDL*/
USE escuela;
	CREATE TABLE insumos(
		id_insumo INT AUTO_INCREMENT,
        nombre VARCHAR(100),
        cod_insumo INT,
        cant INT UNSIGNED,
        precio INT,
        PRIMARY KEY (id_insumo),
        UNIQUE KEY (cod_insumo)
    );
/*DCL*/
	CREATE USER 'admin'@'localhost' IDENTIFIED BY 'root';
    GRANT SELECT, UPDATE, DELETE ON escuela.*
    TO 'admin'@'localhost';    
/*DML*/
	INSERT INTO insumos (nombre, cant, precio)
    VALUES 
		('manual mysql', 2000, 200);
    
    UPDATE insumos 
    SET cant = 1800
    WHERE nombre LIKE '%mysql%';
    
    SELECT * FROM insumos;