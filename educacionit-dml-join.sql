/*Consulta Multitablas*/
	-- clases, profesores, cursos
	SELECT 
		id_clase,
		p.apellido,
		p.nombre,
		c.nombre,
		dia,
		hora
	FROM clases
	JOIN profesores AS p
	ON clases.id_profesor = p.id_profesor
	INNER JOIN cursos AS c
	ON clases.id_curso = c.id_curso
	LIMIT 20;
    
	-- Clases_Detalle
    SELECT 
		cd.id_detalle,
        a.apellido AS "Alumno - Apellido",
        a.nombre AS "Alumno - Nombre",
        p.apellido AS "Profesor - Apellido",
        p.nombre AS "Profesor - Nombre",
        cur.nombre AS "Curso",
        cla.dia,
        cla.hora,
        cd.observaciones,
        count(cd.id_detalle) AS total
    FROM clases_detalle AS cd
    JOIN alumnos AS a
		ON cd.id_alumno = a.id_alumno
    JOIN clases AS cla
		ON cd.id_clase = cla.id_clase
    JOIN profesores AS p
		ON cla.id_profesor = p.id_profesor
    JOIN cursos AS cur
		ON cla.id_curso = cur.id_curso
    GROUP BY curso, dia, hora
    HAVING total >= 10;

## ddl - modificacion nombre
	ALTER TABLE profesores
		RENAME docentes;

SELECT * FROM facturacion;
SELECT * FROM facturacion_detalle;

/*DML - Tabla Facturacion*/
	INSERT INTO facturacion(id_alumno,fecha,tipo,num_factura)
	VALUES (200,"2020-04-18",2,1),
			(135,"2020-06-15",2,2),
			(96, "2020-08-26",2,3),
			(200, "2020-05-25",1,1),
			(80, "2020-07-09", 1,2);
	SELECT * FROM facturacion;
	-- Ultima Factura DEBE
	SELECT MAX(num_factura) AS "Ultima Factura" 
	FROM facturacion 
	WHERE tipo = "debe";

/*Tabla Facturacion_Detalle*/
	SELECT * FROM facturacion_detalle;
	INSERT INTO facturacion_detalle(
		id_factura, 
        id_curso, 
        cantidad, 
        precio, 
        tipo_pago
	)
    VALUES 	(2, 1, 1, 2400, 1),
			(2, 7, 1, 4350, 1),
			(3, 4, 1, 2800, 2),
            (3, 1, 1, 2400, 2),
			(4, 7, 1, 3820, 4),
			(4, 4, 1, 2690, 4);
	-- calculo Total Facturacion
		SELECT id_factura, SUM(precio * cantidad) AS total 
		FROM facturacion_detalle
		GROUP BY id_factura;
    -- Actualizacion de Totales
		UPDATE facturacion_detalle
        SET cantidad = 2
        WHERE id_factura= 4 AND id_curso = 7;
        
		UPDATE facturacion 
		SET total = 
			CASE
				WHEN id_factura = 1 THEN 8459
				WHEN id_factura = 2 THEN 6750
				WHEN id_factura = 3 THEN 5200
				WHEN id_factura = 4 THEN 10330
			END;
	
SELECT 
	fac_d.id_factura,
    CONCAT(a.apellido," ",a.nombre) AS alumno,
    a.correo,
    a.telefono,
    c.nombre,
    fac_d.cantidad,
    MAX(fac_d.precio),
    f.fecha,
    f.tipo,
    f.num_factura
FROM facturacion_detalle AS fac_d
JOIN cursos AS c
ON fac_d.id_curso = c.id_curso
JOIN facturacion AS f
ON fac_d.id_factura = f.id_factura
JOIN alumnos AS a
ON f.id_alumno = a.id_alumno
GROUP BY fecha;

