/* -----------------------------------
	Actualizacion y eliminacion
-------------------------------------- */ 
	TRUNCATE clientes;				-- reiniciar la tabla (AUTO_INCREMENT)
	DELETE FROM clientes; 			-- elimina todos los registros
	UPDATE clientes SET sexo = 1; 	-- actualiza todos los registros

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