USE store;
## eliminacion de registros
	-- proveedor cuyo id es 8
    DELETE FROM proveedores 
	WHERE id_proveedor = 8 ; -- condicion restrictiva

## actualizacion de registros
	-- actualizacion sin restriccion
		UPDATE productos -- tabla a modificar
		SET stock = 2000; -- valor de actualizacion
        
    -- registros especificos
		UPDATE productos -- tabla consultada
			SET stock = 5000 -- valor actualizado
			WHERE valoracion >= 4; -- condicion actualizacion
	
    -- actualizaciones multiples campos
		UPDATE productos
			SET stock = 8000,
				precio = 300
			WHERE categoria = "alimentos"
			AND articulo LIKE "%gas%";
	
    -- actualizaciones selectivas
		UPDATE productos
			SET precio =
			CASE
				WHEN articulo LIKE "%colch_n%" THEN 25500
				WHEN articulo LIKE "%micro%" THEN 15900
			END
            WHERE categoria LIKE "%hog%"
            AND articulo NOT LIKE "%aire%" 
            AND articulo NOT LIKE "%hela%";
            
		UPDATE productos
			SET precio = 
				CASE -- valores asignados a precio
					WHEN categoria LIKE "%tec%" THEN 35000 -- c1v1
					WHEN categoria LIKE "%hog%" THEN 65000 -- !c1 => c2v2 
					WHEN categoria LIKE "%al%" THEN 500 -- !c1 && !c2 => c3v3
					ELSE 800 -- !c1 && !c2 && !c3 (default)
				END
			WHERE 
				articulo NOT LIKE "%gas%"
				AND articulo NOT LIKE "%colch_n%"
				AND articulo NOT LIKE "%micro%"; -- restriccion
            
/*
	Tablas de la verdad
	AND	|c1F|c1V|		OR	|c1V|c1F|
	c2F	| F	| F	|		c2V	| V	| V |
	c2V	| F	| V |		c2F	| V	| F |
*/

    -- actualizacion dinamica
		-- correos con nombre y apellido
		UPDATE clientes -- tabla
			SET email = LOWER(CONCAT(nombre, "_", apellido, "@gmail.com")) -- concatenacion de texto
		WHERE email IS NULL; -- debe estar vacio (NULL)
		
        -- correos info @ proveedor
        UPDATE proveedores
			SET email = LOWER(CONCAT("info@",proveedor,".com"))
		WHERE email IS NOT NULL;
		
        UPDATE proveedores
			SET email = "info@coca_cola.com"
		WHERE proveedor LIKE "%COCA%";
	/*
		UNO = UNO
        UNO = VARIOS
        VARIOS = VARIOS
    */
	
	## actualizacion dinamica por consulta
	UPDATE facturacion_detalle AS fd -- alias tabla a actualizar
		SET precio = ( -- valor por consulta
			SELECT precio FROM productos AS p -- alias de tabla consultada
            WHERE p.id_producto = fd.id_producto -- condicion de consulta
        )
	WHERE precio IS NULL; -- condicion actualizacion

/*CONSULTAS CALCULADAS*/
	## Totales por producto
    SELECT 
		id_factura,
        id_producto,
        cantidad,
		precio,
        cantidad * precio AS total
    FROM facturacion_detalle;
    
    ## Estadisticas de ventas
    SELECT
		"EducacionIT" AS empresa,
        COUNT(id_factura) AS ventas, -- cuenta los registros de la columna
        SUM(precio * cantidad) AS total, -- suma los registros de la columna
        ROUND(AVG(precio * cantidad), 2) AS promedio -- redondea el promedio de la columna
	FROM facturacion_detalle;
	
    ## total por factura
	SELECT 
		id_factura,
        COUNT(cantidad) AS codigos,
        SUM(precio * cantidad) AS total
	FROM facturacion_detalle
    GROUP BY id_factura; -- restringe el rango de las funciones
	
	## actualizacion de totales
	UPDATE facturacion AS f
		SET monto = (
			SELECT SUM(precio * cantidad) AS total
			FROM facturacion_detalle AS fd
            WHERE fd.id_factura = f.id_factura -- condicion
        ),
        impuesto = 
		CASE
			WHEN monto < 2500 THEN 0.0525
            WHEN monto < 25000 THEN 0.105
            WHEN monto < 250000 THEN 0.21
            ELSE 0.325
		END
	WHERE monto IS NULL;
	SELECT * FROM facturacion;

	## impuestos segun valor
	SELECT 
		id_factura,
        tipo,
        tipo_pago,
        monto,
		CONCAT(ROUND(impuesto * 100, 1), "%") AS iva,
        ROUND(monto * impuesto, 2) AS impuesto,
        monto + ROUND(monto * impuesto, 2) AS total
    FROM facturacion;
    
    /*facturas agrupadas por tipo de pago*/
	SELECT 
		tipo_pago, -- campo de tabla
		COUNT(tipo_pago) AS cantidad -- campo calculado CONTAR
		FROM facturacion -- tabla de origen
		GROUP BY tipo, tipo_pago -- agrupacion de datos
		HAVING cantidad > 1; -- clausula para campos calculados