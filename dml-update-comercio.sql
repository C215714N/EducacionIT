SELECT * FROM productos;
/*ACTUALIZACION DE REGISTROS*/
	-- Actualizacion General (todos los registros)
		UPDATE productos
		SET cantidad = 2000; -- valor nuevo
	-- Actualizacion Especifica (Algunos registros)
		UPDATE productos
        SET precio = 500 -- valor nuevo
        WHERE categoria = 3; -- condicion
	-- Actualizacion Resctrictiva
		UPDATE productos
		SET precio = 60000 -- valor nuevo
        WHERE categoria = 1 AND id_proveedor = 2; -- condiciones excluyentes
	-- Actualizacion Grupal / Condicional
		-- dni cliente segun numeracion
        UPDATE clientes
			SET tipo_doc = 
				CASE
					WHEN num_doc < 12000000 THEN 5 -- valor condicion a
					WHEN num_doc < 30000000 THEN 4 -- valor si a no se cumple
                    WHEN num_doc < 54000000 THEN 1 -- valor si ab no se cumplen
                    WHEN num_doc < 80000000 THEN 3 -- valor si abc no se cumplen
					WHEN num_doc < 95000000 THEN 2 -- valor si abcd no se cumplen
                    ELSE 6 -- valor si ninguna de las condiciones se cumplen
				END;
		-- precio segun categoria y coincidencia
        UPDATE productos 
        SET precio = 
			CASE
				WHEN categoria LIKE '%tecnologia%' AND modelo NOT LIKE '%impresora%' THEN 95000
                WHEN categoria LIKE '%hogar%' AND 
					( modelo NOT LIKE '%tostadora%' OR modelo NOT LIKE '%ventilador%' ) THEN 70000
                WHEN categoria LIKE '%higiene%' THEN 1000
                WHEN categoria LIKE '%alimentos%' THEN 500
                ELSE 30000
            END;
            
    -- ACTUALIZACION DINAMICA
		UPDATE facturacion_detalle AS fd
        SET precio = (
			SELECT precio -- campo de referencia
            FROM productos AS p -- tabla de referencia
            WHERE p.id_producto = fd.id_producto -- condicion por registro
        ) -- IMPORTANTE: las subconsulta DEBE RETORNAR un UNICO VALOR
         WHERE fd.precio IS NULL; -- restriccion para impedir la actualizacion de toda la tabla

	-- obtencion de totales x producto
		SELECT 
			id_factura,
            id_producto,
            cantidad,
            precio,
            (cantidad * precio) AS total -- columna calculada
		FROM facturacion_detalle
        HAVING total >= 2000 -- clausula para campos calculados
        ORDER BY id_factura, id_producto;
        
	SELECT
		id_factura,
        SUM(precio * cantidad) AS total -- suma la columna calculada
	FROM facturacion_detalle
    GROUP BY id_factura -- separa las facturas por numeracion
	ORDER BY id_factura, id_producto;
    
	SELECT 
	categoria, 
	COUNT(categoria) AS cantidad -- cuenta los registros con categoria
    FROM productos
    GROUP BY categoria; -- separa las categorias por valor
    
    UPDATE facturacion AS f
		SET monto = (
			SELECT SUM(precio * cantidad) -- columna calculada (campo de referencia)
			FROM facturacion_detalle AS fd -- tabla de referencia
			WHERE fd.id_factura = f.id_factura -- condicion por registro
		) -- IMPORTANTE: la subconsulta SIEMPRE debe retornar un UNICO VALOR
		WHERE monto IS NULL; -- restriccion para actualizar registros vacios
	
    UPDATE facturacion
		SET id_cliente = FLOOR(RAND()*(10 - 9 + 1) + 4)
        WHERE id_cliente IS NULL 
			OR id_cliente = "";
        
    SELECT * FROM facturacion;
    SELECT * FROM productos;
    SELECT * FROM clientes;