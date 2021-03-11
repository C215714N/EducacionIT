/* -----------------------------------
	Actualizacion y eliminacion
-------------------------------------- */ 
## TRUNCATE clientes;				-- reiniciar la tabla (AUTO_INCREMENT)
## DELETE FROM clientes; 			-- elimina todos los registros
## UPDATE clientes SET sexo = 1; 	-- actualiza todos los registros

	-- actualizacion general y dinamica
	UPDATE proveedores	-- tabla a actualizar
		SET correo = LOWER( CONCAT( 'info@', proveedor, '.com.ar' ) ) -- valor calculado
        WHERE correo IS NULL; -- condicion: que no exista correo
	
    -- actualizacion por consulta
    UPDATE facturacion_detalle AS fd
		SET precio = (
			SELECT precio 
            FROM productos AS p
            WHERE p.id_producto = fd.id_producto
        )
		WHERE precio IS NULL;
	SELECT * FROM facturacion_detalle;
    
	SELECT
		id_factura,
        id_producto,
        cantidad,
        precio,
        cantidad * precio AS total
	FROM facturacion_detalle;
    
    UPDATE facturacion_detalle
    SET cantidad =
		CASE
			WHEN precio <= 1000  THEN 5 -- valor A
            WHEN precio <= 5000  THEN 3 -- valor B si A es falso
            WHEN precio <= 25000 THEN 4 -- valor C si AB es falso
            WHEN precio <= 50000 THEN 2 -- valor D si ABC es falso
            ELSE 1 -- valor F si ninguna condicion se cumple
        END
	WHERE cantidad IN(NULL, '', 0);
    
    SELECT * FROM productos;
    UPDATE productos
	SET categoria =
		CASE
			WHEN (
				producto LIKE '%tala%' 
                OR producto LIKE '%microo%' 
                OR producto LIKE '%aire%' 
                OR producto LIKE '%cafe%')
                AND precio >= 1000 THEN 2 -- hogar
            WHEN
				producto LIKE '%cafe%' 
                OR producto LIKE '%sopa%' THEN 3 -- alimentos
            WHEN 
				producto LIKE '%lavan%' 
				OR producto LIKE '%shamp%' THEN 4 -- higiene
			ELSE 1 -- tecnologia
        END
        WHERE id_producto >= 1000;
        
/* Estadisticas de Ventas */
	SELECT 
		MAX(id_factura) AS ultima_fac, -- obtiene el valor mas alto de los id_factura
		COUNT(id_producto) AS articulos, -- cuenta los registros
		SUM(cantidad) AS vendidos, -- suma las cantidades vendidas
		SUM(cantidad * precio) AS total -- suma los totales calculados
	FROM facturacion_detalle;

	SELECT
		id_factura,
        SUM(cantidad) AS articulos,
        SUM(cantidad * precio) AS total
	FROM facturacion_detalle
    GROUP BY id_factura
    HAVING total BETWEEN 50000 AND 100000 -- condicion para campos que no existen en la tabla
    ORDER BY total DESC
    LIMIT 10
    OFFSET 0;
    -- actualizacion multiple por consulta y casos
    SELECT * FROM facturacion ;
	UPDATE facturacion AS f
    SET monto = (
		SELECT SUM(cantidad * precio) AS total
		FROM facturacion_detalle AS fd
		WHERE fd.id_factura = f.id_factura
	), impuesto = 
		CASE
			WHEN monto <= 5000 THEN 0.105
            WHEN monto <= 30000 THEN 0.21
            WHEN monto <= 90000 THEN 0.315
            ELSE 0.42
		END
	WHERE monto OR impuesto IS NULL;
    -- facturacion final + impuesto con totales mayores a 100000
    SELECT
		id_factura,
        id_cliente, 
        monto,
        CONCAT(ROUND(impuesto * 100, 1), '%') AS iva,
        ROUND(monto * impuesto) AS impuesto,
        ROUND(monto + impuesto * monto, 2) AS total
	FROM facturacion
    HAVING total >= 100000 AND
		impuesto >= 20000;