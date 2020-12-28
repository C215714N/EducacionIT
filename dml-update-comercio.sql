SELECT * FROM productos;
/*ACTUALIZACION DE REGISTROS*/
	-- Actualizacion General (todos los registros)
		UPDATE productos
		SET cantidad = 2000; -- valor nuevo
	-- Actualizacion Especifica (Algunos registros)
		UPDATE productos
        SET precio = 500
        WHERE categoria = 3;
	-- Actualizacion Resctrictiva
		UPDATE productos
		SET precio = 60000
        WHERE categoria = 1 AND id_proveedor = 2;
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
				WHEN categoria LIKE '%tecnologia%' AND modelo NOT LIKE '%impresora%' THEN 75000
                WHEN categoria LIKE '%hogar%' AND 
					( modelo NOT LIKE '%tostadora%' OR modelo NOT LIKE '%ventilador%' ) THEN 60000
                WHEN categoria LIKE '%higiene%' THEN 500
                WHEN categoria LIKE '%alimentos%' THEN 300
                ELSE 20000
            END;
            
    -- ACTUALIZACION DINAMICA
		UPDATE facturacion_detalle AS fd
        SET precio = (
			SELECT precio 
            FROM productos AS p
            WHERE p.id_producto = fd.id_producto
        );

	-- obtencion de totales x producto
		SELECT 
			id_factura,
            id_producto,
            cantidad,
            precio,
            (cantidad * precio) AS total
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
			SELECT SUM(precio * cantidad) 
			FROM facturacion_detalle AS fd
			WHERE fd.id_factura = f.id_factura
		);
	SELECT * FROM facturacion;