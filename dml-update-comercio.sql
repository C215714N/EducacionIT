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
	-- Actualizacion Grupal