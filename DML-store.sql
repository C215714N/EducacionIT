USE store;
/*CARGA DE DATOS*/
	## carga selectiva
	INSERT INTO clientes(apellido, nombre, fecha_nac, tipo_doc, num_doc) -- elegimos los campos
		VALUES('Racedo', 'Cristian', '1991-04-18', 1, 35335335); -- valores