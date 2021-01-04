USE comercio;
## consulta JOIN
	SELECT  
		id_factura,
		apellido,
		nombre,
        c.id_cliente,
		monto,
		medio,
        tipo
	FROM clientes AS c -- LEFT: todos los valores Tabla Principal
	JOIN facturacion AS f -- INNER: solamente los Valores Coincidentes
	ON f.id_cliente = c.id_cliente -- RIGHT: todos los valores Tabla Anidada
    ORDER BY id_factura, id_cliente;